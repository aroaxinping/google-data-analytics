# Apuntes — Course 7: Introduction to Data Analysis Using Python

**Duracion:** 27 horas
**Modulos:** 4

> Nota: el certificado se actualizo en 2024 y cambio el Course 7 de R a Python.
> La carpeta de este repositorio se llama "course-7-r-programming" porque se
> creo antes de ese cambio. El ejercicio practico (analisis-netflix.Rmd) usa R,
> pero el temario oficial del curso cubre Python.

---

## Que cubre este curso

Introduccion a Python para analisis de datos: desde la sintaxis basica hasta
el uso de pandas y NumPy para manipular datos. Es el curso mas largo del
certificado (27 horas).

---

## Modulo 1: Hello, Python!

Por que Python es tan popular en datos y como funciona el lenguaje.

**Por que Python para datos:**
- Libreria enorme: pandas, NumPy, matplotlib, scikit-learn...
- Legible y relativamente facil de aprender
- Gratis y open source
- Comunidad enorme (facil encontrar ayuda y soluciones)
- Mismo lenguaje que se usa en machine learning — si profundizas, no tienes
  que cambiar de herramienta

**Tipos de datos en Python:**

```python
# Entero (int)
edad = 25

# Decimal (float)
precio = 19.99

# Texto (str)
nombre = "Ana"

# Booleano (bool)
activo = True

# Verificar tipo
type(edad)   # <class 'int'>
```

**Variables:**
```python
# Asignar
x = 10
nombre = "Maria"

# Reasignar
x = x + 5   # x ahora es 15

# Convenciones de nombre: snake_case
nombre_completo = "Ana Garcia"
```

**Jupyter Notebooks:**
El entorno de trabajo que usa el curso. Combina celdas de codigo y texto
(markdown) en un mismo documento. Ideal para analisis porque puedes ver
el resultado debajo de cada celda inmediatamente.

---

## Modulo 2: Functions and Conditional Statements

Como escribir codigo reutilizable y con logica condicional.

**Funciones:**
```python
# Definir una funcion
def calcular_media(lista):
    return sum(lista) / len(lista)

# Llamar la funcion
resultado = calcular_media([10, 20, 30])  # 20.0

# Con valores por defecto
def saludar(nombre, mensaje="Hola"):
    return f"{mensaje}, {nombre}!"

saludar("Ana")           # "Hola, Ana!"
saludar("Ana", "Buenos dias")  # "Buenos dias, Ana!"
```

**Condicionales:**
```python
if ventas > 10000:
    print("Objetivo cumplido")
elif ventas > 5000:
    print("Progreso aceptable")
else:
    print("Por debajo del objetivo")
```

**Operadores de comparacion:**
```python
== igualdad
!= distinto
>  mayor que
<  menor que
>= mayor o igual
<= menor o igual
and, or, not   # operadores logicos
```

---

## Modulo 3: Loops and Strings

Codigo que se repite y manipulacion de texto.

**Bucles:**
```python
# for — cuando sabes cuantas iteraciones
for numero in [1, 2, 3, 4, 5]:
    print(numero * 2)

# iterar sobre lista
ciudades = ["Madrid", "Barcelona", "Valencia"]
for ciudad in ciudades:
    print(f"Ciudad: {ciudad}")

# range()
for i in range(10):   # 0, 1, 2... 9
    print(i)

# while — cuando no sabes cuantas iteraciones
contador = 0
while contador < 5:
    print(contador)
    contador += 1
```

**Strings:**
```python
texto = "  Hola Mundo  "

texto.strip()           # "Hola Mundo" — quita espacios
texto.lower()           # "  hola mundo  "
texto.upper()           # "  HOLA MUNDO  "
texto.replace("Hola", "Adios")  # "  Adios Mundo  "
texto.split(" ")        # ["", "", "Hola", "Mundo", "", ""]
len(texto)              # 14 — longitud

# f-strings (formatear texto)
nombre = "Ana"
edad = 25
f"Me llamo {nombre} y tengo {edad} anos"
```

---

## Modulo 4: Data Structures in Python

El modulo mas largo (10 horas). Estructuras de datos y las librerias
pandas y NumPy para analisis real.

**Estructuras de datos:**

```python
# Lista — ordenada, modificable
frutas = ["manzana", "pera", "uva"]
frutas.append("naranja")    # anadir al final
frutas[0]                   # "manzana" — acceder por indice

# Tupla — ordenada, NO modificable
coordenadas = (40.4168, -3.7038)

# Diccionario — clave: valor
persona = {
    "nombre": "Ana",
    "edad": 25,
    "ciudad": "Madrid"
}
persona["nombre"]           # "Ana"
persona["email"] = "ana@email.com"  # anadir clave nueva

# Set — sin duplicados, sin orden
paises = {"Spain", "France", "Italy"}
```

**NumPy — arrays numericos:**
```python
import numpy as np

array = np.array([1, 2, 3, 4, 5])
array.mean()     # media
array.std()      # desviacion estandar
array.sum()      # suma
array * 2        # multiplica cada elemento por 2
```

**pandas — el corazon del analisis de datos en Python:**

```python
import pandas as pd

# Cargar datos
df = pd.read_csv("datos.csv")

# Explorar
df.head()          # primeras 5 filas
df.tail()          # ultimas 5 filas
df.shape           # (filas, columnas)
df.info()          # tipos de dato y nulos
df.describe()      # estadisticas descriptivas

# Seleccionar
df["columna"]                  # una columna -> Series
df[["col1", "col2"]]           # varias columnas -> DataFrame
df[df["edad"] > 25]            # filtrar filas

# Limpiar
df.dropna()                    # eliminar filas con nulos
df.fillna(0)                   # reemplazar nulos por 0
df.drop_duplicates()           # eliminar duplicados
df["col"].str.lower()          # texto a minusculas
df["col"].str.strip()          # quitar espacios

# Agregar
df.groupby("region")["ventas"].sum()
df.groupby("region")["ventas"].agg(["sum", "mean", "count"])

# Ordenar
df.sort_values("ventas", ascending=False)

# Nueva columna
df["beneficio"] = df["ventas"] - df["costes"]
```

**Visualizacion basica con pandas/matplotlib:**

```python
import matplotlib.pyplot as plt

df["ventas"].plot(kind="bar")       # barras
df["ventas"].plot(kind="line")      # linea
df["ventas"].hist(bins=20)          # histograma
plt.title("Ventas por region")
plt.show()
```

---

## Esquema resumido del curso

```
COURSE 7: PYTHON
|
+-- Sintaxis basica
|     Tipos: int, float, str, bool
|     Variables, operadores, f-strings
|
+-- Funciones y condicionales
|     def funcion(parametros): return
|     if / elif / else
|
+-- Bucles y strings
|     for, while, range()
|     strip, lower, replace, split
|
+-- Estructuras de datos
|     Lista, tupla, diccionario, set
|
+-- NumPy
|     Arrays numericos, operaciones vectorizadas
|
+-- pandas
      read_csv, head, info, describe
      Filtrar, seleccionar, limpiar
      groupby + agg
      sort_values, nuevas columnas
```

---

## Actividades del curso

**Modulo 1 — Hello, Python!:**
- Por que Python para analisis de datos (video)
- Tipos de datos: int, float, str, bool (video)
- Variables y operadores (video)
- Jupyter Notebooks: celdas de codigo y markdown (lectura)
- Actividad practica: primeros pasos en Jupyter Notebook (hands-on)
- Desafio del modulo 1 (quiz calificado)

**Modulo 2 — Functions and Conditional Statements:**
- Definir y llamar funciones con def y return (video)
- Parametros y valores por defecto (video)
- Condicionales: if, elif, else (video)
- Operadores de comparacion y logicos (lectura)
- Actividad practica: escribir funciones con condicionales (hands-on)
- Desafio del modulo 2 (quiz calificado)

**Modulo 3 — Loops and Strings:**
- Bucles for y while (video)
- range() y como iterar sobre listas (video)
- Manipulacion de strings: strip, lower, replace, split, f-strings (video)
- Actividad practica: limpiar texto con loops y funciones de string (hands-on)
- Desafio del modulo 3 (quiz calificado)

**Modulo 4 — Data Structures in Python:**
- Listas, tuplas, diccionarios y sets (video)
- NumPy: arrays numericos y operaciones vectorizadas (video)
- pandas: cargar CSV, explorar con head/info/describe (video)
- Seleccionar, filtrar y limpiar con pandas (video)
- groupby y agg para agregaciones (video)
- Actividad practica: analisis completo de un dataset con pandas (hands-on calificable)
- Visualizacion basica con matplotlib (video)
- Actividad practica: crear graficos con pandas y matplotlib (hands-on calificable)
- Evaluacion del curso (quiz calificado final)

---

## Cuando usar X vs Y

**pandas vs SQL:**
SQL para extraer y filtrar datos directamente de bases de datos — es el lenguaje nativo de las bases de datos y suele ser mas eficiente para operaciones simples de seleccion y agregacion. pandas cuando la logica es programatica (requiere loops, funciones, logica condicional compleja), cuando los datos ya estan en memoria como CSV o DataFrame, o cuando quieres integrar el analisis en un flujo de codigo Python mas amplio. pandas puede hacer casi todo lo que SQL hace, pero el codigo es mas verboso para operaciones simples.

**Lista vs diccionario:**
Lista cuando el orden importa y accedes a los elementos por su posicion numerica (el primer elemento, el tercero). Diccionario cuando quieres acceder a los elementos por nombre o clave — mucho mas legible y menos propenso a errores que acordarse de que "el indice 2 es el precio".

**Lista vs set:**
Lista cuando necesitas mantener duplicados o cuando el orden de los elementos importa. Set cuando necesitas unicidad (eliminar duplicados automaticamente) y no te importa el orden. Las operaciones de pertenencia (esta este elemento?) son mucho mas rapidas en un set que en una lista.

**for vs while:**
for cuando sabes de antemano cuantas iteraciones necesitas o cuando iteras sobre una coleccion (lista, rango, columna de DataFrame). while cuando la condicion de parada depende de algo que cambia durante la ejecucion y no sabes cuantas iteraciones se necesitan.

**dropna() vs fillna():**
dropna() cuando la fila sin ese dato no tiene valor analitico y perder esas filas no distorsiona la muestra. fillna() cuando el valor faltante puede estimarse razonablemente (mediana para datos numericos sesgados, media para distribuciones simetricas, cero para conteos, valor mas frecuente para categorias) y eliminar esas filas reduciria la muestra de forma significativa.

**Series vs DataFrame:**
Una columna de un DataFrame es una Series (una dimension). Un DataFrame es una coleccion de columnas, es decir, una tabla (dos dimensiones). Muchas funciones de pandas se comportan diferente segun reciban una Series o un DataFrame, por lo que entender la diferencia evita muchos errores.

---

## Errores comunes

- **Modificar un DataFrame sin hacer copia primero:** muchas operaciones de pandas actuan sobre el DataFrame original por referencia. Si modificas un DataFrame que es "vista" de otro, puedes alterar el original sin darte cuenta. Usar df.copy() antes de cualquier transformacion que no quieres que afecte al original.
- **Confundir Series con DataFrame:** df["col"] devuelve una Series (una dimension); df[["col"]] devuelve un DataFrame de una columna (dos dimensiones). Muchas funciones aceptan uno pero no el otro, lo que genera errores poco descriptivos.
- **Olvidar asignar el resultado de operaciones de pandas:** la mayoria de metodos de pandas devuelven un nuevo objeto en lugar de modificar el original. df.dropna() no modifica df a menos que uses df = df.dropna() o el parametro inplace=True. No asignar el resultado hace que la operacion no tenga efecto.
- **Usar print() donde deberia usarse return en funciones:** el valor mostrado con print() no puede usarse fuera de la funcion. Una funcion que hace print de su resultado no puede encadenarse con otras operaciones.
- **No entender la diferencia entre df["col"] (Series) y df[["col"]] (DataFrame):** ademas de la diferencia de tipo, muchas operaciones de agregacion y transformacion se comportan diferente en cada caso.
- **Mezclar indices en NumPy y pandas:** los arrays de NumPy usan indices numericos siempre; los DataFrames de pandas pueden tener indices personalizados. Mezclar las dos formas de indexar genera resultados inesperados.

---

## Conexion con otros cursos

- pandas es el equivalente Python de SQL del curso 5: groupby es GROUP BY, merge es JOIN, query es WHERE. Si dominas SQL del curso 5, pandas tiene mucha menos curva de aprendizaje.
- Las funciones de limpieza de texto de Python (strip, lower, replace) son los mismos conceptos que TRIM, LOWER, REPLACE en SQL del curso 4 y en Sheets del mismo curso. La logica es identica, cambia la sintaxis.
- La visualizacion con matplotlib de este curso es el equivalente basico de Tableau del curso 6. Para dashboards interactivos profesionales se sigue usando Tableau; para visualizacion integrada en un Jupyter Notebook (como en el capstone) se usa matplotlib o seaborn.
- Las estructuras de datos de Python (lista, diccionario, set) conectan con los tipos de datos del curso 3: entender nominal vs ordinal ayuda a elegir si representar una variable como string categorico o como entero ordinal en pandas.
- En el capstone del curso 8, Python (o R) es la herramienta recomendada para el caso Cyclistic. Todo lo aprendido aqui sobre pandas se aplica directamente al analisis del dataset de bicicletas.

---

## Lo mas importante de este curso

**pandas** es la libreria. Una vez que dominas DataFrame, Series, groupby
y merge, puedes hacer en Python practicamente cualquier cosa que harias
en SQL o Sheets.

La diferencia clave con SQL: en pandas el codigo es programatico, puedes
crear funciones, loops y logica compleja. En SQL siempre declaras "que
quieres", no "como hacerlo". Los dos enfoques tienen su lugar — pandas
brilla cuando la logica es compleja o repetitiva.
