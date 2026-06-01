# Modulo 3 — Bucles y strings

**Duracion estimada:** 4 horas | **Fase:** Iteration & String Manipulation

## Que cubre este modulo

Cubre como iterar sobre colecciones de datos con for y while, y como manipular
texto con los metodos de string mas utiles. En analisis de datos, los bucles
permiten procesar cada elemento de una lista, y los metodos de string son
esenciales para limpiar texto que viene de fuentes externas.

## Conceptos clave

- for item in coleccion para iterar sobre listas, strings o rangos
- range(inicio, fin, paso) para generar secuencias numericas
- while condicion para repetir mientras se cumpla una condicion
- break para salir del bucle, continue para saltar una iteracion
- Metodos de string: .strip(), .lower(), .upper(), .replace(), .split(), .join()
- .startswith(), .endswith(), .find(), .count() para buscar en strings
- List comprehensions como alternativa concisa a bucles con append

## Actividades practicas de Coursera

- Hands-On Activity: For Loops: el estudiante itera sobre una lista de
  productos y calcula metricas acumuladas
- Hands-On Activity: While Loops: el estudiante simula un proceso que se
  repite hasta que se cumple una condicion de salida
- Hands-On Activity: String Methods: el estudiante limpia una lista de
  nombres con .strip(), .lower() y .replace() para estandarizarlos

## Ejercicios en este repo

`ejercicios.py` — Script que cubre for con listas y range(), while con
condicion de salida, break y continue, los metodos de string mas usados
en limpieza de datos, y list comprehensions como alternativa a bucles
de acumulacion. Sin dependencias externas.

## Conclusiones del modulo

Los bucles y los metodos de string son la base de cualquier script de
preprocesamiento de datos en Python. La limpieza de texto (.strip().lower())
es lo primero que se hace antes de comparar o agrupar valores de texto
— el equivalente Python a TRIM() y LOWER() en SQL.
