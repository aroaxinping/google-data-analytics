# Modulo 4 — Estructuras de datos y pandas

**Duracion estimada:** 6 horas | **Fase:** Data Structures & Analysis

## Que cubre este modulo

Cubre las estructuras de datos de Python mas importantes para analisis: listas,
diccionarios, arrays de NumPy y DataFrames de pandas. El foco esta en pandas
como herramienta principal: leer datos, filtrar, limpiar valores nulos,
transformar columnas y agrupar con groupby.

## Conceptos clave

- Listas: append, remove, slicing, listas de diccionarios como "tabla"
- Diccionarios: acceder por clave, .keys(), .values(), .items(), dict anidado
- NumPy arrays: operaciones vectorizadas, diferencia con listas de Python
- pandas DataFrame: crear desde diccionario, leer CSV con pd.read_csv()
- Seleccionar columnas: df['columna'], df[['col1', 'col2']]
- Filtrar filas: df[df['columna'] > valor], multiples condiciones con & y |
- Valores nulos: .isnull(), .dropna(), .fillna()
- Transformar columnas: .str.lower(), .str.strip(), aplicar funciones con .apply()
- Agrupar y agregar: .groupby('columna').agg({'col': 'sum'})
- Estadisticas basicas: .describe(), .value_counts(), .corr()

## Actividades practicas de Coursera

- Hands-On Activity: Python Data Structures: el estudiante trabaja con listas
  y diccionarios para modelar un conjunto de datos simple
- Hands-On Activity: NumPy Arrays: el estudiante crea arrays y aplica
  operaciones vectorizadas sobre todos los elementos a la vez
- Hands-On Activity: pandas DataFrames: el estudiante crea un DataFrame,
  filtra filas y calcula estadisticas con .groupby() y .describe()
- Hands-On Activity: Cleaning Data with pandas: el estudiante maneja valores
  nulos con .fillna() y estandariza columnas de texto

## Ejercicios en este repo

`ejercicios.py` — Script que cubre listas y diccionarios, creacion de
NumPy arrays con operaciones vectorizadas, y pandas con datos hardcodeados:
creacion de DataFrame, filtrado, limpieza de nulos, transformacion de columnas
y groupby. Requiere numpy y pandas instalados (pip install numpy pandas).

## Conclusiones del modulo

pandas es la herramienta mas usada por analistas de datos en Python.
Entender como filtrar, limpiar y agrupar un DataFrame es equivalente
a dominar WHERE, TRIM/LOWER y GROUP BY en SQL — pero con la flexibilidad
de un lenguaje de programacion completo y sin necesidad de base de datos.
