# Modulo 1 — Python basico

**Duracion estimada:** 3 horas | **Fase:** Foundations

## Que cubre este modulo

Introduce los bloques fundamentales de Python: como almacenar valores en
variables, los tipos de datos primitivos (int, float, str, bool), los
operadores aritmeticos y de comparacion, y como construir strings dinamicos
con f-strings. Es el punto de partida obligatorio antes de funciones,
bucles y librerias.

## Conceptos clave

- Variables y asignacion con =
- Tipos de datos: int, float, str, bool, NoneType
- type() para inspeccionar el tipo de un valor
- Operadores aritmeticos: +, -, *, /, //, %, **
- Operadores de comparacion: ==, !=, <, >, <=, >=
- Operadores logicos: and, or, not
- f-strings para interpolacion de variables en texto
- print() como herramienta de inspeccion y salida

## Actividades practicas de Coursera

- Hands-On Activity: Variables and Data Types: el estudiante crea variables
  de diferentes tipos, usa type() para verificarlos y hace conversiones
  basicas con int(), float(), str()
- Hands-On Activity: Operators and Expressions: el estudiante calcula metricas
  simples usando operadores y muestra resultados con f-strings
- Practice Quiz — Python Syntax: preguntas sobre tipos de datos, precedencia
  de operadores y comportamiento de la division entera (//)

## Ejercicios en este repo

`ejercicios.py` — Script ejecutable que cubre tipos de datos, operadores,
conversiones de tipo y f-strings con ejemplos comentados. Se ejecuta con
`python ejercicios.py` sin dependencias externas.

## Conclusiones del modulo

Los tipos de datos no son un detalle tecnico — son la razon por la que
`"3" + "4"` da `"34"` y no `7`. Entender que tipo tiene cada variable
evita errores que son muy dificiles de depurar cuando el dataset tiene
miles de filas.
