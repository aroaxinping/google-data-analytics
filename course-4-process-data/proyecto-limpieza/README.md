# Ejercicio: Limpieza de datos con SQL

**Curso:** Course 4 — Process Data from Dirty to Clean
**Dataset:** Messy E-Commerce Sales Dataset (Kaggle — CC0 Public Domain)
**Herramientas:** SQL (BigQuery)

> Dataset elegido específicamente porque tiene errores intencionales:
> valores nulos, duplicados, formatos inconsistentes. Perfecto para practicar
> limpieza antes de que aparezca en datos reales sin avisar.

---

El Course 4 fue donde entendí por qué dicen que el 80% del trabajo de un
analista es limpiar datos. Los errores en datos reales no son obvios —
`"Electronics"` vs `"electronics"` son técnicamente texto válido, pero para
un `GROUP BY` son dos grupos distintos. Si no lo limpias, tus resultados
están mal y ni te das cuenta.

## Los problemas del dataset

| Problema | Descripción |
|----------|-------------|
| Valores nulos | `customer_name`, `region`, `category` con NULL |
| Duplicados | Filas con mismo `order_id` repetidas |
| Formatos mezclados | Fechas en `DD/MM/YYYY` y `YYYY-MM-DD` |
| Inconsistencia de texto | `"Electronics"`, `"electronics"`, `"ELECTRONICS"` |
| Espacios extra | Nombres de cliente con espacios al inicio/fin |
| Outliers | Precios negativos o cero en `sale_price` |

---

## Proceso de limpieza

### Paso 1 — Inspeccionar antes de tocar nada

```sql
-- Cuántas filas tiene el dataset
SELECT COUNT(*) AS total_filas
FROM `proyecto.dataset.ecommerce_ventas`;

-- Cuántos nulos hay por columna
SELECT
  COUNTIF(order_id IS NULL)       AS nulos_order_id,
  COUNTIF(customer_name IS NULL)  AS nulos_customer_name,
  COUNTIF(order_date IS NULL)     AS nulos_order_date,
  COUNTIF(category IS NULL)       AS nulos_category,
  COUNTIF(sale_price IS NULL)     AS nulos_sale_price,
  COUNTIF(region IS NULL)         AS nulos_region
FROM `proyecto.dataset.ecommerce_ventas`;
```

### Paso 2 — Detectar duplicados

```sql
SELECT order_id, COUNT(*) AS veces
FROM `proyecto.dataset.ecommerce_ventas`
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY veces DESC;
```

### Paso 3 — Crear tabla limpia

```sql
CREATE OR REPLACE TABLE `proyecto.dataset.ecommerce_ventas_limpio` AS

WITH sin_duplicados AS (
  SELECT *
  FROM (
    SELECT *,
      ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_date) AS fila_num
    FROM `proyecto.dataset.ecommerce_ventas`
  )
  WHERE fila_num = 1
)

SELECT
  order_id,
  INITCAP(TRIM(customer_name))               AS customer_name,
  PARSE_DATE('%d/%m/%Y', order_date)         AS order_date,
  LOWER(TRIM(category))                      AS category,
  UPPER(TRIM(region))                        AS region,
  CASE WHEN sale_price > 0 THEN sale_price
       ELSE NULL END                         AS sale_price,
  quantity,
  country
FROM sin_duplicados
WHERE order_id IS NOT NULL
  AND order_date IS NOT NULL
  AND sale_price > 0;
```

### Paso 4 — Verificar que quedó bien

```sql
-- Comparar antes vs después
SELECT 'antes' AS estado, COUNT(*) AS filas
FROM `proyecto.dataset.ecommerce_ventas`
UNION ALL
SELECT 'después', COUNT(*)
FROM `proyecto.dataset.ecommerce_ventas_limpio`;

-- Confirmar que no quedan duplicados
SELECT order_id, COUNT(*) AS veces
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Confirmar que las categorías son consistentes
SELECT category, COUNT(*) AS n
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY category
ORDER BY n DESC;
```

---

## Funciones SQL usadas

| Función | Para qué |
|---------|----------|
| `ROW_NUMBER() OVER (PARTITION BY ...)` | Eliminar duplicados conservando uno |
| `TRIM()` | Quitar espacios extra al inicio y fin |
| `LOWER()` / `UPPER()` / `INITCAP()` | Estandarizar mayúsculas |
| `PARSE_DATE()` | Convertir texto a fecha con formato definido |
| `COUNTIF()` | Contar nulos o condiciones concretas |
| `CASE WHEN` | Lógica condicional (filtrar precios inválidos) |

---

## Lo que me quedé

Los datos sucios no solo dan resultados incorrectos — dan resultados que
**parecen** correctos. Eso es mucho más peligroso. La verificación del
paso 4 no es opcional: es lo que te da confianza para analizar.
