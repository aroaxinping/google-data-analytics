# Modulo 3 — Agregar datos

**Duracion estimada:** 5 horas | **Fase:** Aggregate

## Que cubre este modulo

Se centra en resumir grandes cantidades de datos en metricas utiles. GROUP BY
agrupa filas segun valores comunes para aplicar funciones de agregacion como
COUNT, SUM, AVG, MAX, MIN. HAVING filtra esos grupos despues de la agregacion
(no antes, como WHERE). Las subconsultas permiten usar el resultado de una query
dentro de otra. Las window functions calculan valores sobre un conjunto de filas
sin colapsar el resultado como hace GROUP BY.

## Conceptos clave

- GROUP BY con COUNT, SUM, AVG, MAX, MIN
- HAVING para filtrar grupos agregados
- Diferencia entre WHERE (filtra filas antes de agregar) y HAVING (filtra grupos despues)
- Subconsultas en FROM, WHERE y SELECT
- Window functions: RANK(), ROW_NUMBER(), LAG(), SUM() OVER(PARTITION BY ... ORDER BY ...)
- PARTITION BY dentro de OVER() para aplicar la funcion por grupos sin colapsar

## Actividades practicas de Coursera

- Hands-On Activity: Aggregating Data with GROUP BY: el estudiante cuenta y suma
  por categoria sobre el dataset de taxis, identifica zonas con mas viajes
- Hands-On Activity: Filtering Aggregated Data with HAVING: el estudiante filtra
  solo los grupos que superar un umbral (por ejemplo, zonas con mas de 100 viajes)
- Hands-On Activity: Subqueries: el estudiante escribe una subconsulta en FROM
  para calcular el promedio por grupo y luego compararlo con cada fila
- Hands-On Activity: Window Functions: el estudiante usa RANK() y SUM() OVER()
  para crear rankings y acumulados sin perder el detalle de fila

## Ejercicios en este repo

`ejercicios.sql` — Ejercicios que cubren GROUP BY con multiples funciones de
agregacion, la diferencia practica entre WHERE y HAVING, subconsultas en FROM
y WHERE, y window functions (RANK, LAG, SUM acumulado) con PARTITION BY y
ORDER BY dentro de OVER().

## Conclusiones del modulo

GROUP BY + funciones de agregacion es la combinacion mas usada en analisis de
datos: casi todo reporte resume millones de filas en decenas de metricas. Las
window functions amplian ese poder al permitir calcular metricas como rankings
o acumulados manteniendo el detalle de cada fila visible — algo que GROUP BY
no puede hacer.
