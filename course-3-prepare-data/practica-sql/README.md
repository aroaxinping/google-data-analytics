# SQL basico — practica

**Curso:** Course 3 — Prepare Data for Exploration
**Herramienta:** BigQuery

## Que cubre esta carpeta

El Course 3 introduce SQL desde cero: como leer datos de una tabla con SELECT,
filtrar con WHERE, ordenar con ORDER BY, limitar resultados con LIMIT y resumir
con funciones de agregacion. Esta carpeta agrupa toda la practica SQL del curso
en un archivo unico comentado.

## Conceptos clave

- SELECT columnas FROM tabla para elegir que columnas ver
- SELECT * para ver todas las columnas
- WHERE para filtrar filas por condicion
- ORDER BY columna ASC/DESC para ordenar resultados
- LIMIT n para ver solo los primeros n resultados (util para explorar)
- Funciones de agregacion: COUNT(*), SUM(), AVG(), MAX(), MIN()
- Alias con AS para renombrar columnas en el resultado
- Comentarios en SQL: -- para una linea, /* */ para bloque

## Actividades practicas de Coursera

- Hands-On Activity: Introduction to BigQuery: el estudiante navega por la
  interfaz de BigQuery, localiza un dataset publico y ejecuta su primera
  SELECT * LIMIT 10 para explorar la estructura de una tabla
- Hands-On Activity: SQL Queries: el estudiante escribe SELECT con WHERE,
  ORDER BY y LIMIT sobre bigquery-public-data para responder preguntas
  concretas sobre los datos
- Hands-On Activity: Aggregate Functions: el estudiante usa COUNT, SUM y
  AVG para obtener resumen de un dataset sin necesidad de GROUP BY todavia

## Archivos en esta carpeta

`consultas-basicas.sql` — Ejercicios autocontenidos con tabla temporal que
cubren SELECT, WHERE, ORDER BY, LIMIT y funciones de agregacion. Ejecutables
directamente en BigQuery sin configuracion adicional.

## Nota sobre BigQuery

Para ejecutar consultas sobre datos reales del certificado, los datasets
publicos mas usados en el Course 3 son:
- `bigquery-public-data.new_york_citibike.citibike_trips`
- `bigquery-public-data.world_bank_intl_education.international_education`

Los comentarios en `consultas-basicas.sql` indican como adaptar cada query.
