# Modulo 2 — Funciones y condicionales

**Duracion estimada:** 4 horas | **Fase:** Functions & Control Flow

## Que cubre este modulo

Introduce como encapsular logica reutilizable en funciones con def, y como
controlar el flujo de ejecucion con if/elif/else. Las funciones reciben
parametros, procesan datos y devuelven resultados con return. Los condicionales
permiten que el codigo tome decisiones distintas segun el valor de los datos.

## Conceptos clave

- def nombre_funcion(parametro1, parametro2): para definir una funcion
- return para devolver un valor (sin return, la funcion devuelve None)
- Parametros con valor por defecto: def f(x, redondear=2)
- Alcance de variables: local (dentro de la funcion) vs global
- if, elif, else para ramificar la ejecucion
- Operadores de comparacion en condiciones: in, not in, is, is not
- Llamar a funciones desde otras funciones

## Actividades practicas de Coursera

- Hands-On Activity: Writing Functions: el estudiante define funciones para
  calcular metricas de negocio (tasa de conversion, margen bruto) y las
  llama con distintos argumentos
- Hands-On Activity: Conditional Statements: el estudiante escribe logica
  condicional para clasificar clientes segun su nivel de gasto
- Practice Quiz — Functions and Conditionals: preguntas sobre scope, return,
  y el orden de evaluacion en if/elif/else

## Ejercicios en este repo

`ejercicios.py` — Script que define funciones de creciente complejidad:
desde funciones simples con un parametro hasta funciones que usan condicionales
internamente y funciones que llaman a otras funciones. Sin dependencias externas.

## Conclusiones del modulo

Las funciones son la herramienta mas importante de programacion para un
analista: en lugar de copiar el mismo calculo 20 veces en el script, se define
una vez y se llama cuando se necesita. Cualquier cambio en la logica se hace
en un solo lugar.
