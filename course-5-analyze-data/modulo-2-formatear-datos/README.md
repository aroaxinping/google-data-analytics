# Modulo 2 — Formatear datos

**Duracion estimada:** 4 horas | **Fase:** Format

## Que cubre este modulo

Cubre como convertir tipos de datos en SQL, manipular fechas y unir tablas.
CAST y SAFE_CAST permiten cambiar el tipo de una columna (texto a numero, numero
a fecha). Las funciones de fecha como FORMAT_DATE, EXTRACT y DATE_DIFF permiten
operar sobre columnas temporales. Los JOINs combinan filas de dos tablas a partir
de una columna clave compartida.

## Conceptos clave

- CAST(columna AS tipo) y SAFE_CAST (version segura que devuelve NULL en error)
- FORMAT_DATE para dar formato a fechas como texto
- EXTRACT para sacar partes de una fecha (YEAR, MONTH, DAY, HOUR, DAYOFWEEK)
- DATE_DIFF para calcular diferencias entre fechas
- INNER JOIN: solo filas que tienen coincidencia en ambas tablas
- LEFT JOIN: todas las filas de la tabla izquierda + las coincidentes de la derecha
- RIGHT JOIN: todas las filas de la tabla derecha + las coincidentes de la izquierda
- FULL OUTER JOIN: todas las filas de ambas tablas, con NULL donde no hay coincidencia

## Actividades practicas de Coursera

- Hands-On Activity: CAST and Data Type Conversion: el estudiante practica
  CAST sobre columnas de texto que contienen numeros y fechas mal tipadas
- Hands-On Activity: Working with Dates in SQL: el estudiante usa EXTRACT y
  FORMAT_DATE para desglosar columnas de timestamp en partes utiles
- Hands-On Activity: JOIN Tables in BigQuery: el estudiante escribe los 4 tipos
  de JOIN y observa cuantas filas devuelve cada uno con el mismo dataset

## Ejercicios en este repo

`ejercicios.sql` — Ejercicios con tablas temporales que demuestran CAST y
SAFE_CAST, manipulacion de fechas con EXTRACT y FORMAT_DATE, y los cuatro
tipos de JOIN con ejemplos que muestran claramente las diferencias entre ellos.

## Conclusiones del modulo

Los JOINs son la herramienta mas importante del modulo: la mayoria de los datos
reales viven en tablas separadas y combinarlas es el 90% del trabajo de analisis.
Entender cuando usar INNER vs LEFT JOIN evita que se pierdan o dupliquen datos
sin darse cuenta.
