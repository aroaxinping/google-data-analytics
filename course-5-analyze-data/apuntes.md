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

**Subconsultas (subqueries):**

Una subconsulta es una query dentro de otra query. Se escribe entre parentesis.
Puede aparecer en tres lugares distintos:

```sql
-- 1. En SELECT: para calcular un valor agregado por cada fila
SELECT
  station_id,
  num_bikes_available,
  (SELECT AVG(num_bikes_available) FROM citibike_stations) AS avg_num_bikes_available
FROM citibike_stations;

-- 2. En FROM: para crear una tabla auxiliar con la que hacer JOIN
SELECT
  stations.station_id,
  stations.name,
  trips_by_station.number_of_rides AS number_of_rides_starting_at_station
FROM citibike_stations AS stations
INNER JOIN (
  SELECT
    CAST(start_station_id AS STRING) AS start_station_id_str,
    COUNT(*) AS number_of_rides
  FROM citibike_trips
  GROUP BY start_station_id
) AS trips_by_station
ON stations.station_id = trips_by_station.start_station_id_str
ORDER BY number_of_rides_starting_at_station DESC;

-- 3. En WHERE: para filtrar con valores calculados en otra tabla
SELECT
  station_id,
  name
FROM citibike_stations
WHERE station_id IN (
  SELECT CAST(start_station_id AS STRING)
  FROM citibike_trips
  WHERE usertype = 'Subscriber'
);
```

Las subconsultas son funcionalmente similares a los JOINs pero a veces
mas legibles para logica de filtrado puntual. Para logica compleja con
multiples pasos, los CTEs (WITH) son mas legibles que subconsultas anidadas.

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

## Actividades del curso

**Modulo 1 — Organizar los Datos para un analisis mas eficaz:**

Actividades practicas:
- Actividad practica: Consultas de ordenacion SQL: ejecutar queries ORDER BY sobre un dataset de peliculas en BigQuery
- Actividad practica: Analizar datos meteorologicos en BigQuery: filtrar y ordenar datos de clima con WHERE y ORDER BY

Lecturas clave:
- Paso a Paso: Filtrar Datos con SQL: uso de WHERE con condiciones multiples sobre el dataset de peliculas (bigquery-public-data)
- Paso a paso: Ordenacion de conjuntos de datos en hojas de calculo: usar Data > Sort range con multiples columnas en Sheets
- Paso a paso: Utilizar la funcion SORT en las hojas de calculo: sintaxis =SORT(rango, columna_orden, ascendente) para ordenar dinamicamente
- Paso a Paso: Ordenacion de Datos con SQL: ORDER BY con una y multiples columnas, ASC/DESC

Otras actividades:
- Introduccion a organizarse (video, 3 min): presenta la importancia de organizar datos antes de analizar
- El proceso de analisis (video, 4 min): recorrido por las fases del analisis de datos
- Siempre hay que organizar (video, 2 min): ejemplos reales de por que importa el orden
- Filtrar Datos con SQL (video, 5 min): demuestra WHERE con IN, LIKE, BETWEEN, IS NOT NULL
- Ordenacion de datos en hojas de calculo (video, 4 min): Data > Sort range en Sheets
- Utilizar la funcion SORT en las hojas de calculo (video, 5 min): funcion SORT dinamica vs ordenacion manual
- Ordenacion de Datos con SQL (video, 7 min): ORDER BY avanzado con multiples columnas
- Desafio del modulo 1 (quiz calificado — completado al 85%)

**Modulo 2 — Formatear y ajustar datos:**

Actividades practicas:
- Actividad practica: Combinar varios datos: usar CONCAT y funciones de cadena en SQL/Sheets para combinar columnas de texto

Lecturas clave:
- Paso a paso: DE UN TIPO A OTRO: conversion de tipos con CAST/SAFE_CAST en BigQuery y conversion de formatos en Sheets
- Paso a paso: Combinar cadenas de texto para obtener estadisticas: uso de CONCAT en SQL para combinar campos y calcular metricas textuales
- Paso a paso: Cadenas en hojas de calculo: funciones CONCATENATE, LEFT, RIGHT, MID, LEN, FIND en Sheets

Otras actividades:
- Comenzar con el formateo de datos (video, 1 min): introduccion al modulo
- DE UN TIPO A OTRO (video, 5 min): demuestra CAST y SAFE_CAST en BigQuery
- Convertir datos en hojas de calculo (lectura, 8 min): VALUE, TEXT, DATEVALUE y otras funciones de conversion en Sheets
- Validacion de datos (video, 3 min): Data > Data validation en Sheets para restringir entradas
- Formato condicional (video, 4 min): Format > Conditional formatting en Sheets con reglas de color
- Transformar datos con SQL (lectura, 4 min): resumen de funciones de conversion y transformacion en SQL
- Fusione cadenas de texto para obtener estadisticas (video, 4 min): CONCAT en SQL para combinar campos
- Cadenas en hojas de calculo (video, 3 min): funciones de texto en Sheets
- Manipular cadenas con SQL (lectura, 4 min): TRIM, UPPER, LOWER, LENGTH, SUBSTR en BigQuery
- Autorreflexion: Desbordamiento de pila (practica no calificada, 20 min): reflexion sobre uso de Stack Overflow para resolver problemas
- Desafio del modulo 2 (quiz calificado — completado al 100%)

**Modulo 3 — Agregacion de Datos para Analisis:**

Actividades practicas:
- Actividad practica: Utilizar VLOOKUP para realizar una tarea: combinar datos de dos hojas usando VLOOKUP con columna clave comun
- Actividad practica: Consultas para JOINS: escribir INNER JOIN, LEFT JOIN y RIGHT JOIN sobre el dataset de empleados en BigQuery
- Actividad practica: COUNT y COUNT DISTINCTOS: contar registros totales y distintos en el dataset del almacen en BigQuery
- Actividad practica: Utilizar subconsultas para refinar Datos: escribir subconsultas en WHERE para filtrar resultados con datos de otra tabla
- Actividad practica: Utilizar subconsultas: subconsultas en SELECT y FROM para crear columnas calculadas y tablas auxiliares

Lecturas clave:
- Paso a paso: Explore como funcionan los JOIN: ejemplos de INNER JOIN, LEFT JOIN en BigQuery con el dataset de empleados
- Paso a Paso: Consultas dentro de consultas: tres ejemplos de subconsultas en BigQuery — en SELECT (calcular promedio global), en FROM (crear tabla auxiliar con COUNT de viajes por estacion), y en WHERE (filtrar estaciones usadas por suscriptores). Dataset: bigquery-public-data.new_york (tablas citibike_stations y citibike_trips)
- Paso a Paso: Utilice subconsultas para agregar Datos: subconsultas como alternativa a JOIN para agregar datos de multiples tablas

Otras actividades:
- Agregacion de Datos para Analisis (video, 3 min): introduce la agregacion como herramienta analitica
- Preparar VLOOKUP (video, 4 min): requisitos previos — formato coherente, columna clave a la izquierda
- VLOOKUP en accion (video, 3 min): demostracion de VLOOKUP con FALSE como cuarto argumento
- Identificar y solucionar errores comunes de VLOOKUP (video, 5 min): errores #N/A, tipos de dato distintos, rango incorrecto
- Conceptos basicos de VLOOKUP (lectura, 8 min): sintaxis completa, casos de uso, limitaciones vs JOIN
- Explore como funcionan las JOIN (video, 7 min): visualizacion de los cuatro tipos de JOIN
- Identidades secretas: La importancia de los alias (lectura, 8 min): uso de AS para nombrar columnas y tablas en SQL
- Utilice los JOIN de forma eficaz (lectura, 8 min): cuando elegir cada tipo de JOIN, buenas practicas
- Consultas dentro de consultas (video, 6 min): subconsultas como herramienta de analisis
- Utilice subconsultas para agregar Datos (video, 7 min): subconsultas en FROM para agregaciones complejas
- Funciones y subconsultas SQL: Una amistad funcional (lectura, 8 min): combinar funciones de agregacion con subconsultas
- Desafio del modulo 3 (quiz calificado — completado al 97.72%)

**Modulo 4 — Realizar calculos de datos:**

Actividades practicas:
- Actividad practica: Trabajar con condiciones: usar SUMIF, COUNTIFS y AVERAGEIF en Sheets sobre un dataset real
- Actividad practica: Explorar datos de peliculas con tablas dinamicas: crear tabla dinamica en Sheets y analizar datos por genero/año
- Actividad practica: Calculos con SQL: escribir queries con aritmetica directa y funciones de agregacion en BigQuery sobre dataset de aguacates
- Actividad practica: FROM hojas de calculo a BigQuery: importar datos de Sheets a BigQuery y validar con COUNT y comparacion manual
- Actividad practica: Crear tablas temporales: crear tablas WITH (CTE) y tablas temporales con CREATE TEMP TABLE en BigQuery

Lecturas clave:
- Funciones con condiciones multiples (lectura, 8 min): SUMIF, COUNTIFS, AVERAGEIF en Sheets — sintaxis y diferencias con sus versiones simples
- Elementos de una Tabla dinamica (lectura, 4 min): filas, columnas, valores y filtros en las tablas dinamicas de Sheets
- Utilizar tablas dinamicas en el Analisis (lectura, 8 min): cuando usar tabla dinamica vs formula manual, como interpretar resultados
- Paso a paso: Incrustar calculos sencillos con SQL: aritmetica directa en SELECT (suma, resta, multiplicacion, division, porcentajes) usando el dataset de aguacates
- Tipos de validacion de datos (lectura, 4 min): seis tipos — tipo de dato, rango de datos, restriccion, coherencia, estructura y codigo
- Trabajar con tablas temporales (lectura, 8 min): diferencias entre WITH (CTE), CREATE TEMP TABLE y CREATE TABLE; cuando usar cada una
- Su guia intermedia de SQL (lectura, 8 min): referencia de las clausulas SQL mas usadas en el certificado hasta este punto

Otras actividades:
- Calculo de datos (video, 2 min): introduccion al modulo
- Formulas de calculo habituales (video, 9 min): SUM, AVERAGE, MIN, MAX, COUNT en Sheets con ejemplos practicos
- Funciones y condiciones (video, 8 min): IF, IFS y funciones condicionales en Sheets
- Funciones compuestas (video, 5 min): anidar funciones en Sheets (ej: SUMIF dentro de otra formula)
- Empezar a trabajar con tablas dinamicas (video, 7 min): crear una tabla dinamica desde cero en Sheets
- Tablas dinamicas continuacion (video, 5 min): agrupar, ordenar y filtrar dentro de una tabla dinamica
- Consultas y calculos (video, 4 min): introduccion a los calculos aritmeticos directamente en SQL
- Incrustar calculos sencillos con SQL (video, 6 min): demostracion de operadores aritmeticos en SELECT
- Calculos con otras declaraciones (video, 4 min): calculos dentro de GROUP BY, ORDER BY y WHERE
- Comprobar y volver a comprobar (video, 4 min): proceso de validacion de resultados de analisis
- Tablas temporales (video, 6 min): introduccion a WITH y CREATE TEMP TABLE en BigQuery
- Multiples variantes de mesa (video, 3 min): comparacion entre CTEs, tablas temporales y vistas
- Utilizar hojas conectadas con BigQuery (lectura, 8 min): conectar Google Sheets directamente a BigQuery para analizar datos sin exportar
- Desafio del modulo 4 (quiz calificado — completado al 93.75%)

---

## Cuando usar X vs Y

**INNER JOIN vs LEFT JOIN:**
Usar INNER JOIN cuando solo te interesan las filas que tienen coincidencia en ambas tablas — las filas sin coincidencia desaparecen del resultado. Usar LEFT JOIN cuando necesitas conservar todas las filas de la tabla principal aunque no haya coincidencia en la segunda tabla: las filas sin match aparecen con NULL en las columnas de la tabla derecha.

**WHERE vs HAVING:**
WHERE filtra filas individuales antes de que se aplique GROUP BY — no puede referenciar alias de agregacion ni funciones de grupo. HAVING filtra grupos despues de agrupar con GROUP BY, por lo que si puede referenciar COUNT(*) u otras funciones de agregacion. No se pueden intercambiar: usar WHERE con COUNT(*) genera un error.

**Window functions vs GROUP BY:**
GROUP BY colapsa todas las filas de cada grupo en una sola fila de resultado — se pierde el detalle individual. Las window functions con OVER() calculan sobre grupos pero conservan cada fila individual en el resultado. Usar GROUP BY cuando solo necesitas el resumen; usar OVER() cuando necesitas el calculo por grupo pero manteniendo las filas originales (rankings, totales acumulados, comparacion con fila anterior).

**CTE vs subquery:**
Funcionalmente equivalentes en la mayoria de casos, pero los CTEs (WITH) son mucho mas legibles cuando hay mas de un paso intermedio: cada bloque WITH tiene un nombre descriptivo que actua como documentacion. Las subqueries anidadas son dificiles de debuggear porque hay que leer de dentro hacia afuera. Preferir CTEs para cualquier query con mas de un nivel de logica.

**ORDER BY dentro de OVER() vs ORDER BY global:**
El ORDER BY dentro de OVER() determina como se calcula la funcion de ventana: para LAG define cual es la "fila anterior", para SUM acumulado define el orden en que se acumulan los valores. El ORDER BY al final de la query determina el orden visual de las filas en el resultado. Son independientes y pueden apuntar a columnas distintas.

**VLOOKUP vs JOIN:**
VLOOKUP en Sheets cuando el dataset es pequeno y ya tienes los datos en hojas de calculo — es mas rapido para exploracion puntual. JOIN en SQL cuando los datos estan en una base de datos, cuando los datasets son grandes, o cuando necesitas combinar mas de dos tablas. VLOOKUP solo mira hacia la derecha y a la primera coincidencia; JOIN es mas flexible y potente.

---

## Errores comunes

- **Usar INNER JOIN cuando se necesita LEFT JOIN:** se pierden silenciosamente todos los registros sin coincidencia, sin ningun error ni advertencia. El resultado parece correcto pero esta incompleto. Antes de elegir el tipo de JOIN hay que pensar si importa conservar los registros sin match.
- **Olvidar ORDER BY dentro de OVER() para funciones de ventana:** para funciones como LAG, LEAD o totales acumulados, el ORDER BY dentro de OVER() es obligatorio para que el calculo tenga sentido. Sin el, el resultado es indeterminado y puede variar entre ejecuciones.
- **Confundir HAVING con WHERE:** intentar usar WHERE para filtrar por el resultado de una funcion de agregacion genera un error en SQL. HAVING es el unico lugar donde se pueden filtrar resultados de GROUP BY.
- **No usar SAFE_CAST cuando el dato puede ser inconsistente:** CAST falla con error si encuentra un valor que no puede convertir; SAFE_CAST devuelve NULL en lugar de romper la query. En datasets reales donde una columna "numerica" puede tener algun texto, CAST hace fallar toda la query.
- **Escribir queries largas sin CTEs:** legibles para el autor en el momento de escribirlas, ilegibles para cualquiera (incluido el mismo autor) semanas despues. Los CTEs no son un lujo de estilo, son una herramienta de mantenibilidad.
- **Confundir VLOOKUP con una busqueda de texto:** VLOOKUP busca coincidencia exacta en la primera columna del rango (con FALSE como ultimo parametro). Si el tipo de dato del valor buscado no coincide con el de la tabla (numero vs texto), no encuentra nada y devuelve #N/A aunque visualmente parezca igual.

---

## Conexion con otros cursos

- Los JOINs de este curso son la version SQL del VLOOKUP del curso 2: el concepto de combinar datos de distintas fuentes usando una clave comun es identico, solo cambia la escala y la herramienta.
- Las funciones de ventana (ROW_NUMBER, LAG) se introdujeron en el curso 4 para eliminar duplicados. Aqui se amplian para calculos analiticos mas ricos, lo que muestra que la misma sintaxis OVER() tiene multiples usos.
- El proceso de verificacion del curso 4 (comprobar que los datos estan limpios) es un prerequisito directo para este curso: si los datos llegaron sucios al analisis, los resultados del JOIN o del GROUP BY seran incorrectos aunque las queries sean perfectas.
- Las tablas dinamicas de Sheets de este modulo 4 son el equivalente visual de GROUP BY en SQL, que se exploro tambien en el curso 2. El concepto de agrupar y agregar es el mismo en todas las herramientas.
- Los hallazgos que se obtienen aqui con SQL son los que se visualizan en el curso 6 con Tableau. El output de las queries de este curso es el input de las visualizaciones del siguiente.
- En el capstone del curso 8, todas las habilidades de este curso (JOINs, GROUP BY, window functions, CTEs) se usan combinadas para el analisis del caso Cyclistic.

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
