# Modulo 1 — Organizar datos

**Duracion estimada:** 3 horas | **Fase:** Organize

## Que cubre este modulo

Introduce las herramientas fundamentales para ordenar y filtrar datos en SQL.
Se trabaja con ORDER BY para controlar el orden de los resultados, con WHERE
usando multiples condiciones combinadas con AND/OR/NOT, y con CASE WHEN para
crear columnas clasificatorias que segmentan los datos segun logica de negocio.

## Conceptos clave

- ORDER BY ASC / DESC, ordenar por multiples columnas
- WHERE con operadores de comparacion (=, <>, <, >, BETWEEN, LIKE, IN)
- Combinar condiciones con AND, OR, NOT
- CASE WHEN ... THEN ... ELSE ... END para segmentar registros
- Alias de columna con AS para legibilidad

## Actividades practicas de Coursera

- Hands-On Activity: Sorting and Filtering in BigQuery: el estudiante ejecuta
  queries con ORDER BY y WHERE sobre el dataset de taxi de Chicago, filtra por
  condiciones multiples y exporta resultados
- Practice Quiz — SQL Sorting: preguntas sobre el comportamiento de ORDER BY
  con NULLs y con varias columnas
- Hands-On Activity: Segmenting Data with CASE: el estudiante anade una columna
  clasificatoria con CASE WHEN para etiquetar rangos de duracion de viaje

## Ejercicios en este repo

`ejercicios.sql` — Queries autocontenidas usando tablas temporales que
replican la estructura del dataset de taxis de Chicago. Cubren ORDER BY
simple y compuesto, WHERE con multiples condiciones, y CASE WHEN para
crear segmentos. Cada ejercicio tiene comentarios que explican el concepto
que practica y como adaptarlo a un dataset real en BigQuery.

## Conclusiones del modulo

ORDER BY y WHERE son las primeras herramientas de un analista para explorar
datos antes de agregarlos o transformarlos. CASE WHEN es la forma de SQL
de aplicar logica condicional sobre filas — equivalente al IF de Sheets pero
dentro de una query, lo que permite clasificar millones de filas en una sola
instruccion.
