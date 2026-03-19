# Apuntes — Course 5: Analyze Data to Answer Questions

**Duracion:** 26 horas
**Modulos:** 4

---

## Que cubre este curso

La fase "Analyze" del proceso. Organizar, formatear, combinar y calcular
con datos para responder preguntas de negocio. Es el curso de SQL mas
avanzado del certificado.

---

## Modulo 1: Organize Data for More Effective Analysis

Antes de analizar, los datos tienen que estar bien organizados.

**Ordenar datos:**

En Sheets: Data > Sort range
En SQL:
```sql
ORDER BY columna ASC        -- de menor a mayor
ORDER BY columna DESC       -- de mayor a menor
ORDER BY col1 ASC, col2 DESC  -- primero por col1, luego por col2
```

**Filtrar datos:**

En Sheets: Data > Create a filter
En SQL:
```sql
WHERE condicion1 AND condicion2
WHERE valor IN ('a', 'b', 'c')
WHERE valor BETWEEN 10 AND 50
WHERE texto LIKE '%palabra%'   -- contiene "palabra"
WHERE columna IS NOT NULL
```

**Segmentar datos (bucketing):**
Agrupar valores continuos en rangos para facilitar el analisis.

```sql
SELECT
  CASE
    WHEN edad < 25 THEN 'Joven'
    WHEN edad BETWEEN 25 AND 40 THEN 'Adulto'
    ELSE 'Senior'
  END AS segmento_edad,
  COUNT(*) AS total
FROM usuarios
GROUP BY segmento_edad;
```

---

## Modulo 2: Format and Adjust Data

Conversiones de tipo, formateo y combinacion de datos con JOIN.

**Conversiones de tipo en SQL:**

```sql
CAST(columna AS tipo)            -- conversion generica
SAFE_CAST(columna AS tipo)       -- igual pero devuelve NULL si falla
CAST('2024-03-15' AS DATE)
CAST(precio_texto AS FLOAT64)
CAST(cantidad AS STRING)
```

**Formatear fechas en SQL:**

```sql
FORMAT_DATE('%Y-%m', fecha)           -- "2024-03"
EXTRACT(YEAR FROM fecha)              -- 2024
EXTRACT(MONTH FROM fecha)             -- 3
EXTRACT(DAYOFWEEK FROM fecha)         -- 1=domingo, 7=sabado
DATE_DIFF(fecha2, fecha1, DAY)        -- dias entre dos fechas
DATE_ADD(fecha, INTERVAL 7 DAY)       -- sumar 7 dias
```

**JOINs — combinar tablas:**

```
Tabla A:    Tabla B:    INNER JOIN:   LEFT JOIN:    FULL OUTER JOIN:
id | nombre  id | precio  filas en    todas A +     todas de A y B
1  | Ana     1  | 100     ambas       coincidencias (nulos donde no coincide)
2  | Luis    3  | 200
3  | Eva
```

```sql
-- INNER JOIN: solo filas que coinciden en ambas tablas
SELECT a.nombre, b.precio
FROM tabla_a AS a
INNER JOIN tabla_b AS b ON a.id = b.id;

-- LEFT JOIN: todas las filas de A, con NULLs donde no hay coincidencia en B
SELECT a.nombre, b.precio
FROM tabla_a AS a
LEFT JOIN tabla_b AS b ON a.id = b.id;

-- RIGHT JOIN: todas las filas de B
-- FULL OUTER JOIN: todas las filas de ambas tablas
```

---

## Modulo 3: Aggregate Data for Analysis

Combinar datos de multiples filas para obtener resumen. El modulo mas largo (8 horas).

**GROUP BY — la instruccion mas usada:**

```sql
-- Ventas por region
SELECT region, SUM(ventas) AS total
FROM tabla
GROUP BY region
ORDER BY total DESC;

-- Con multiple agrupacion
SELECT anio, region, COUNT(*) AS pedidos
FROM tabla
GROUP BY anio, region
ORDER BY anio, pedidos DESC;
```

**HAVING — filtrar despues de agrupar:**

```sql
-- Solo regiones con mas de 1000 ventas
SELECT region, COUNT(*) AS total
FROM tabla
GROUP BY region
HAVING COUNT(*) > 1000;

-- Diferencia con WHERE:
-- WHERE filtra filas antes de agrupar
-- HAVING filtra grupos despues de agrupar
```

**Funciones de ventana (window functions):**

Son el salto mas grande en complejidad de este curso. Permiten calcular
agregaciones sin colapsar las filas.

```sql
-- Calcular el porcentaje de cada fila sobre el total
SELECT
  producto,
  ventas,
  SUM(ventas) OVER () AS total_global,
  ROUND(ventas * 100.0 / SUM(ventas) OVER (), 1) AS porcentaje
FROM tabla;

-- Total acumulado por fecha
SELECT
  fecha,
  ventas,
  SUM(ventas) OVER (ORDER BY fecha) AS acumulado
FROM tabla;

-- Ranking
SELECT
  nombre,
  ventas,
  RANK() OVER (ORDER BY ventas DESC) AS ranking
FROM tabla;

-- Comparar con fila anterior
SELECT
  mes,
  ventas,
  LAG(ventas, 1) OVER (ORDER BY mes) AS ventas_mes_anterior,
  ventas - LAG(ventas, 1) OVER (ORDER BY mes) AS variacion
FROM tabla;
```

**UNNEST para columnas con listas:**

```sql
-- Si "generos" contiene "Accion, Drama, Comedia"
SELECT TRIM(genero) AS genero, COUNT(*) AS total
FROM tabla, UNNEST(SPLIT(generos, ', ')) AS genero
GROUP BY genero
ORDER BY total DESC;
```

---

## Modulo 4: Perform Data Calculations

Formulas avanzadas en Sheets y tablas temporales en SQL.

**Formulas avanzadas en Sheets:**

```
=SUMIF(rango_criterio, criterio, rango_suma)
=COUNTIFS(rango1, criterio1, rango2, criterio2)
=AVERAGEIF(rango, criterio, rango_promedio)

-- Tablas pivot para calculos complejos
-- Insert > Pivot table > organizar filas, columnas y valores
```

**Tablas temporales en SQL (CTEs):**

```sql
-- WITH define una tabla temporal que existe solo durante la query
WITH ventas_por_region AS (
  SELECT region, SUM(ventas) AS total
  FROM tabla
  GROUP BY region
),
media_global AS (
  SELECT AVG(total) AS media
  FROM ventas_por_region
)
SELECT
  v.region,
  v.total,
  m.media,
  v.total - m.media AS diferencia_vs_media
FROM ventas_por_region v, media_global m
ORDER BY diferencia_vs_media DESC;
```

Los CTEs hacen las queries largas mucho mas legibles — cada bloque WITH
es como darle nombre a un paso intermedio.

---

## Esquema resumido del curso

```
COURSE 5: ANALYZE DATA
|
+-- Organizar
|     ORDER BY, WHERE, CASE WHEN para segmentar
|
+-- Combinar datos
|     CAST para conversiones de tipo
|     EXTRACT / FORMAT_DATE para fechas
|     JOIN: INNER, LEFT, RIGHT, FULL OUTER
|
+-- Agregar
|     GROUP BY + funciones de agregacion
|     HAVING para filtrar despues de agrupar
|     Funciones de ventana: SUM/RANK/LAG OVER(...)
|     UNNEST para columnas con listas
|
+-- Calcular
      Formulas avanzadas en Sheets: SUMIF, COUNTIFS
      CTEs (WITH) para organizar queries complejas
```

---

## Lo mas importante de este curso

**Las funciones de ventana** son lo que mas distingue a alguien que "sabe SQL"
de alguien que realmente domina SQL. Aprender OVER() bien, con ORDER BY y
PARTITION BY, cambia completamente lo que puedes calcular en una sola query.

**Los JOINs** son la segunda habilidad mas critica. En el mundo real, los datos
nunca estan todos en una tabla. Saber combinarlos es fundamental.

**CTEs (WITH):** no son opcionales si quieres que tu codigo sea legible.
Una query de 50 lineas sin CTEs es casi imposible de mantener; la misma
query con CTEs bien nombrados se lee como una historia.
