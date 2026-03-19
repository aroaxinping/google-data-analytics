# Apuntes — Course 4: Process Data from Dirty to Clean

**Duracion:** 16 horas
**Modulos:** 6

---

## Que cubre este curso

La fase "Process" del proceso de analisis. Como detectar datos sucios, limpiarlos
con Sheets y con SQL, verificar que la limpieza fue correcta y documentar todo
el proceso.

---

## Modulo 1: The Importance of Integrity

La integridad de los datos es la condicion de que los datos sean completos,
precisos, consistentes y confiables. Sin integridad, el analisis produce
resultados incorrectos — a veces sin que te des cuenta.

**Tipos de problemas de integridad:**

| Problema | Descripcion | Ejemplo |
|----------|-------------|---------|
| Datos insuficientes | Faltan registros para responder la pregunta | Solo tienes datos de 3 meses cuando necesitas 12 |
| Datos incorrectos | Valores erroneos o malinterpretados | Fecha en formato incorrecto |
| Datos inconsistentes | El mismo valor representado de formas distintas | "ES", "Spain", "Espana" |
| Datos duplicados | Mismo registro repetido | Pedido con el mismo ID dos veces |
| Datos desactualizados | Informacion que ya no refleja la realidad | Precios de hace 3 anos |

**Muestreo aleatorio:**
Cuando el dataset completo es demasiado grande para analizar, se trabaja con
una muestra representativa. El muestreo aleatorio garantiza que cada elemento
tenga igual probabilidad de ser seleccionado (elimina el sesgo de seleccion).

**Sesgo de muestreo:** ocurre cuando la muestra no representa bien a la
poblacion total. Ejemplo: encuestar solo a usuarios premium para sacar
conclusiones sobre todos los usuarios.

---

## Modulo 2: Clean Data for More Accurate Insights

La limpieza en Sheets: como identificar y corregir problemas manualmente
y con funciones.

**Tipos de datos sucios:**

- **Errores tipograficos:** "Madrd" en lugar de "Madrid"
- **Espacios extra:** " Juan" en lugar de "Juan"
- **Mayusculas inconsistentes:** "electronics", "Electronics", "ELECTRONICS"
- **Formatos de fecha mezclados:** "15/03/2024" y "2024-03-15" en la misma columna
- **Valores nulos:** celdas vacias donde deberia haber dato
- **Duplicados:** filas identicas o casi identicas repetidas
- **Outliers:** valores extremos que pueden ser errores o casos reales

**Funciones de limpieza en Sheets:**

```
=TRIM(texto)           -> elimina espacios extra al inicio y fin
=LOWER(texto)          -> convierte a minusculas
=UPPER(texto)          -> convierte a mayusculas
=PROPER(texto)         -> Primera Letra En Mayuscula
=LEN(texto)            -> longitud del texto (util para detectar errores)
=SUBSTITUTE(texto, buscar, reemplazar)  -> reemplazar texto
=SPLIT(texto, delimitador)  -> dividir texto en columnas
=CONCATENATE(a, b)     -> unir textos
```

**Eliminar duplicados en Sheets:**
Data > Data cleanup > Remove duplicates

**Congelar cabeceras para trabajar mejor:**
View > Freeze > 1 row

---

## Modulo 3: Data Cleaning with SQL

El mismo proceso de limpieza pero en BigQuery, para datasets que no caben en Sheets.

**Detectar problemas:**

```sql
-- Contar nulos por columna
SELECT
  COUNTIF(columna IS NULL) AS nulos
FROM tabla;

-- Ver valores unicos (para detectar inconsistencias)
SELECT DISTINCT categoria
FROM tabla
ORDER BY categoria;

-- Detectar duplicados
SELECT id, COUNT(*) AS veces
FROM tabla
GROUP BY id
HAVING COUNT(*) > 1;
```

**Limpiar en SQL:**

```sql
-- Estandarizar texto
SELECT
  TRIM(nombre)           AS nombre,
  LOWER(categoria)       AS categoria,
  UPPER(pais)            AS pais
FROM tabla;

-- Manejar nulos
SELECT
  COALESCE(region, 'Sin region') AS region  -- reemplaza NULL por valor por defecto
FROM tabla;

-- Eliminar duplicados (quedarse con uno por id)
SELECT *
FROM (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY fecha) AS fila
  FROM tabla
)
WHERE fila = 1;

-- Convertir tipo de dato
SELECT CAST(precio_texto AS FLOAT64) AS precio
FROM tabla;

-- Estandarizar fecha
SELECT PARSE_DATE('%d/%m/%Y', fecha_texto) AS fecha
FROM tabla;
```

**Funciones SQL de texto mas usadas:**

```sql
TRIM(col)                          -- quitar espacios
LOWER(col) / UPPER(col)           -- cambiar capitalización
REPLACE(col, 'viejo', 'nuevo')    -- reemplazar texto
SUBSTR(col, inicio, longitud)     -- extraer parte del texto
CONCAT(col1, ' ', col2)           -- unir textos
LENGTH(col)                        -- longitud del texto
```

---

## Modulo 4: Verify and Report on Cleaning Results

Limpiar sin verificar no es suficiente. El paso de verificacion confirma
que los cambios son correctos y que no se introdujeron nuevos errores.

**Proceso de verificacion:**

1. Comparar conteo de filas antes y despues de la limpieza
2. Confirmar que no quedan duplicados
3. Comprobar que los valores nulos se manejaron correctamente
4. Validar que los tipos de dato son los esperados
5. Revisar estadisticas descriptivas (min, max, media) para detectar outliers

```sql
-- Comparar antes vs despues
SELECT 'antes' AS estado, COUNT(*) FROM tabla_original
UNION ALL
SELECT 'despues', COUNT(*) FROM tabla_limpia;

-- Estadisticas de verificacion
SELECT
  MIN(precio)  AS precio_min,
  MAX(precio)  AS precio_max,
  AVG(precio)  AS precio_medio,
  STDDEV(precio) AS desviacion
FROM tabla_limpia;
```

**Documentar el proceso:**
Un log de limpieza incluye:
- Que problemas se encontraron y cuantos registros afectaban
- Que se hizo para corregir cada problema
- Cuantas filas se eliminaron y por que
- Que decisiones se tomaron sobre los nulos (eliminar, reemplazar, mantener)

Esto es importante: si alguien reproduce el analisis, tiene que poder
entender exactamente que se hizo con los datos.

---

## Modulo 5: Add Data to Your Resume

Consejos para reflejar habilidades de datos en el curriculum. El punto
relevante: los proyectos del certificado (especialmente el capstone) pueden
ir directamente al portfolio y al CV.

---

## Esquema resumido del curso

```
COURSE 4: PROCESS (CLEAN)
|
+-- Integridad de datos
|     Insuficientes, incorrectos, inconsistentes, duplicados, desactualizados
|     Muestreo aleatorio y sesgo de muestreo
|
+-- Limpieza en Sheets
|     TRIM, LOWER, UPPER, PROPER, SUBSTITUTE, SPLIT
|     Eliminar duplicados con Data > Remove duplicates
|
+-- Limpieza en SQL
|     TRIM, LOWER, REPLACE, COALESCE
|     ROW_NUMBER() para eliminar duplicados
|     CAST para conversiones de tipo
|     PARSE_DATE para estandarizar fechas
|
+-- Verificacion y documentacion
      Comparar antes/despues
      Estadisticas de validacion
      Log del proceso de limpieza
```

---

## Lo mas importante de este curso

**ROW_NUMBER() OVER (PARTITION BY id ORDER BY fecha)** es la tecnica SQL
mas util para eliminar duplicados conservando el registro correcto. Vale la
pena entenderla bien.

**COALESCE** es la forma estandar de manejar NULLs en SQL. Mucho mas limpio
que un CASE WHEN largo.

Y lo mas importante de todo: **documentar siempre el proceso de limpieza**.
Un analisis sin documentacion de limpieza no es reproducible, y eso lo hace
poco util en un entorno profesional.
