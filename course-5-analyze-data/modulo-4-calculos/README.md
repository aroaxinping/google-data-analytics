# Modulo 4 — Calculos

**Duracion estimada:** 4 horas | **Fase:** Calculate

## Que cubre este modulo

Se centra en estructurar queries complejas de forma legible y reutilizable.
Las CTEs (Common Table Expressions) con WITH permiten nombrar subconsultas
y referenciarlas varias veces en la misma query, haciendo el codigo mas
facil de leer y depurar. Las tablas temporales (TEMP TABLE) almacenan
resultados intermedios dentro de una sesion de BigQuery para usarlos en
queries posteriores. El modulo tambien revisa el uso de formulas en Sheets
como complemento al SQL.

## Conceptos clave

- CTE con WITH nombre_cte AS (SELECT ...) para organizar logica en pasos
- Multiples CTEs encadenadas que se referencian entre si
- CREATE TEMP TABLE para guardar resultados intermedios en la sesion
- Diferencia entre CTE (existe solo en esa query) y TEMP TABLE (existe durante la sesion)
- Cuándo usar cada una: CTE para legibilidad, TEMP TABLE para reutilizar resultados costosos

## Actividades practicas de Coursera

- Hands-On Activity: Using CTEs in BigQuery: el estudiante reescribe una query
  con subconsultas anidadas usando CTEs para hacerla legible
- Hands-On Activity: Temporary Tables: el estudiante crea una TEMP TABLE con
  datos filtrados y luego la usa como base de queries adicionales
- Hands-On Activity: Calculations in Spreadsheets: el estudiante usa formulas
  de Sheets (SUMA, PROMEDIO, funciones de fecha) como complemento al SQL

## Ejercicios en este repo

`ejercicios.sql` — Ejercicios que muestran CTEs simples, multiples CTEs
encadenadas, y el patron CTE final SELECT que es la estructura mas comun
en SQL profesional. Tambien incluye ejemplos de CREATE TEMP TABLE con
queries de seguimiento.

## Conclusiones del modulo

Las CTEs transforman queries de 80 lineas ilegibles en codigo que se puede
leer de arriba a abajo como si fuera una historia: primero calculo esto,
luego aquello, y al final combino los resultados. Es la habilidad de SQL
que mas diferencia a un analista junior de uno senior en codigo real.
