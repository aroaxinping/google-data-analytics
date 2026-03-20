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

## Lo mas importante de este curso

**pandas** es la libreria. Una vez que dominas DataFrame, Series, groupby
y merge, puedes hacer en Python practicamente cualquier cosa que harias
en SQL o Sheets.

La diferencia clave con SQL: en pandas el codigo es programatico, puedes
crear funciones, loops y logica compleja. En SQL siempre declaras "que
quieres", no "como hacerlo". Los dos enfoques tienen su lugar — pandas
brilla cuando la logica es compleja o repetitiva.
