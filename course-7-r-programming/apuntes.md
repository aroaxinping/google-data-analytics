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

## Glosarios por modulo

**Glosario del modulo 1:**

| Termino | Definicion |
|---------|------------|
| Argumento | La informacion que se necesita que una funcion de programacion realice su tarea predeterminada |
| Comentario | Texto en una linea de codigo que no se ejecuta — anotaciones legibles para humanos que explican lo que hace el codigo |
| Tipo de dato | Un atributo que describe como se almacena y usa un dato en un lenguaje de programacion |
| Float | Un tipo de dato numerico con decimales |
| Entero (int) | Un tipo de dato numerico sin decimales |
| Jupyter Notebook | Un entorno de desarrollo interactivo que combina celdas de codigo ejecutable y texto Markdown en un mismo documento |
| Celda Markdown | En Jupyter Notebook, una celda que contiene texto formateado, imagenes o ecuaciones — no se ejecuta como codigo |
| Metodo | Una funcion que pertenece a un tipo de objeto especifico y se llama con la notacion punto |
| Modulo | Un archivo de Python que contiene funciones, clases y variables que pueden importarse en otros programas |
| Objeto | Una instancia de una clase en programacion orientada a objetos; almacena datos y comportamiento |
| Programacion orientada a objetos (OOP) | Un paradigma de programacion que organiza el codigo en clases y objetos |
| Paquete | Una coleccion de modulos Python agrupados para ofrecer funcionalidad adicional |
| String (str) | Un tipo de dato de texto — una secuencia de caracteres entre comillas |
| Variable | Un contenedor con nombre que almacena un valor en un programa; puede ser reasignado |

**Glosario del modulo 2:**

| Termino | Definicion |
|---------|------------|
| Condicion | Una expresion booleana que Python evalua como verdadera o falsa para determinar que bloque de codigo ejecutar |
| Logica condicional | Un conjunto de instrucciones que se ejecutan solo cuando se cumple una condicion especifica |
| def | Palabra clave de Python usada para definir una funcion |
| elif | Palabra clave de Python que significa "de lo contrario si" — evalua una nueva condicion cuando la anterior es falsa |
| else | Palabra clave de Python que ejecuta un bloque de codigo cuando ninguna condicion anterior fue verdadera |
| Funcion | Un bloque de codigo reutilizable con un nombre que realiza una tarea especifica cuando se le llama |
| if | Palabra clave de Python que inicia una instruccion condicional — ejecuta el bloque siguiente si la condicion es verdadera |
| Operador logico | Operador que combina o invierte condiciones booleanas: and, or, not |
| Operador de comparacion | Un operador que compara dos valores y devuelve un booleano: ==, !=, >, <, >=, <= |
| Parametro | Una variable definida en la declaracion de una funcion que recibe un valor cuando la funcion se llama |
| PEP 8 | La guia de estilo oficial de Python que define convenciones de formato de codigo como la indentacion y los nombres de variables |
| return | Palabra clave de Python que especifica el valor que devuelve una funcion al codigo que la llamo |
| Snake case | Convencion de nombres en Python donde las palabras se separan con guiones bajos: nombre_variable |

**Glosario del modulo 3:**

| Termino | Definicion |
|---------|------------|
| break | Palabra clave de Python que termina la ejecucion de un bucle antes de que la condicion normal de parada se cumpla |
| continue | Palabra clave de Python que salta el resto del cuerpo del bucle en la iteracion actual y pasa a la siguiente |
| Bucle for | Una instruccion de Python que itera sobre los elementos de una secuencia o coleccion |
| Indexacion | Acceder a un elemento especifico de una secuencia usando su posicion numerica |
| Iteracion | Una sola repeticion de las instrucciones dentro de un bucle |
| range() | Funcion de Python que genera una secuencia de numeros enteros entre un inicio y un fin con un paso opcional |
| Slicing | Extraer un subconjunto de una secuencia usando la notacion [inicio:fin:paso] |
| Cadena de texto (string) | Una secuencia de caracteres en Python; los metodos de string permiten manipular texto |
| Bucle while | Una instruccion de Python que repite un bloque de codigo mientras una condicion sea verdadera |

**Glosario del modulo 4:**

| Termino | Definicion |
|---------|------------|
| Array | Una estructura de datos de NumPy que almacena elementos del mismo tipo en una o mas dimensiones |
| Boolean masking | Filtrar filas de un DataFrame de pandas usando una expresion booleana para seleccionar solo las filas donde la condicion es verdadera |
| DataFrame | La estructura de datos principal de pandas — una tabla bidimensional con filas y columnas etiquetadas |
| Diccionario | Una estructura de datos de Python que almacena pares clave-valor sin orden garantizado |
| groupby | Un metodo de pandas que agrupa filas de un DataFrame segun los valores de una o mas columnas para aplicar funciones de agregacion |
| Libreria | Una coleccion de paquetes y modulos que anade funcionalidad al lenguaje base de Python |
| Lista | Una estructura de datos de Python que almacena elementos ordenados y modificables, que pueden ser de tipos diferentes |
| merge() | Un metodo de pandas que combina dos DataFrames usando una o mas columnas comunes, equivalente a un JOIN de SQL |
| NumPy | Una libreria de Python para computacion numerica que proporciona arrays de n dimensiones con operaciones matematicas eficientes |
| pandas | Una libreria de Python para el analisis y manipulacion de datos que proporciona DataFrames y Series |
| pip | El sistema de gestion de paquetes de Python para instalar y actualizar paquetes desde el repositorio PyPI |
| Series | Una estructura de datos de pandas de una sola dimension con un indice; equivale a una columna de un DataFrame |
| Set | Una estructura de datos de Python que almacena elementos unicos sin orden garantizado |
| Tupla | Una estructura de datos de Python que almacena elementos ordenados e inmutables |

---

## Actividades del curso

**Modulo 1 — Hello, Python!:**

Actividades practicas:
- Annotated follow-along guide: Hello, Python!: guia anotada que muestra como escribir y ejecutar el primer script Python en Jupyter Notebook — variables, tipos de datos, operaciones basicas
- Activity: Use Python syntax: ejercicio en Jupyter Notebook para practicar variables, tipos de datos (int, float, str, bool), operadores aritmeticos y f-strings sobre datos de ejemplo

Lecturas clave:
- Introduction to R: comparativa entre R y Python para analisis de datos — cuando usar cada uno y por que Python es la eleccion del curso
- Ways to learn about programming: recursos recomendados para aprender Python fuera del curso — documentacion oficial, Stack Overflow, comunidades
- How to use Jupyter Notebooks: interfaz de Jupyter — celdas de codigo vs celdas Markdown, como ejecutar celdas, como reiniciar el kernel, como exportar el notebook
- More about object-oriented programming: conceptos de OOP aplicados a Python — que es un objeto, una clase, un metodo y un atributo; como pandas y NumPy usan OOP internamente
- Explore Python syntax: referencia de sintaxis Python — indentacion obligatoria, convencion snake_case, comentarios con #, diferencia entre = (asignacion) y == (comparacion)

Otras actividades:
- Introduction to Course 7 (video, 4 min): presentacion del curso y de Python como herramienta de analisis de datos
- Adrian: My path to a data career (video, 2 min): testimonio de empleado de Google sobre como llego al analisis de datos
- Welcome to module 1 (video, 2 min): introduccion al modulo
- Introduction to Python (video, 5 min): que es Python, historia, por que es el lenguaje mas usado en data science
- Discover more about Python (video, 7 min): ventajas de Python — legibilidad, librerias, comunidad, versatilidad
- Jupyter Notebooks (video, 3 min): demostracion del entorno Jupyter — interfaz, celdas, ejecucion
- Object-oriented programming (video, 5 min): introduccion a OOP — clases, objetos, metodos, atributos
- Hamza: How Python helped my data science career (video, 3 min): caso real de uso de Python en el trabajo diario de un data scientist
- Variables and data types (video): como declarar variables y los cuatro tipos de datos basicos (int, float, str, bool)
- Desafio del modulo 1 (quiz calificado — completado)

Cuestionarios de practica:
- Test your knowledge: Get started with the course: evalua conceptos introductorios del curso y el entorno de Python
- Test your knowledge: The power of Python: evalua ventajas de Python para el analisis de datos y sus capacidades
- Test your knowledge: Using Python syntax: evalua sintaxis basica de Python, variables, tipos de datos y operadores

**Modulo 2 — Functions and Conditional Statements:**

Actividades practicas:
- Annotated follow-along guide: Functions and conditional statements: guia anotada con ejemplos de definicion de funciones, parametros con valores por defecto, y condicionales if/elif/else
- Activity: Functions: escribir funciones con def y return, practicar con parametros opcionales y verificar resultados con assert
- Activity: Conditional statements: construir logica condicional con if, elif y else usando operadores de comparacion (==, !=, >, <, >=, <=) y logicos (and, or, not)

Lecturas clave:
- Reference guide: Functions: referencia completa de funciones en Python — sintaxis, parametros posicionales vs nombrados, valores de retorno, scope de variables
- Reference guide: Python operators: tabla de operadores aritmeticos, de comparacion y logicos con ejemplos de uso en analisis de datos
- Reference guide: Conditional statements: sintaxis de if/elif/else, operadores ternarios y como anidar condicionales

Otras actividades:
- Welcome to module 2 (video, 3 min): introduccion al modulo
- Lateefat: Tips to address challenges when learning to code (video, 3 min): consejos de una data analyst de Google para superar la frustracion al aprender a programar
- Define functions and return values (video, 6 min): como definir funciones con def, anadir parametros y usar return
- Write clean code (video, 4 min): convenios de estilo PEP 8 — nombres descriptivos, longitud de linea, espacios alrededor de operadores
- Use comments to scaffold your code (video, 7 min): como usar comentarios (#) para documentar logica, planificar el codigo antes de escribirlo y facilitar la revision
- Make comparisons using operators (video, 4 min): operadores de comparacion y logicos con ejemplos aplicados a datos
- Use if, elif, else statements to make decisions (video, 11 min): demostracion extensa de condicionales con casos de uso reales
- Desafio del modulo 2 (quiz calificado — completado)

Cuestionarios de practica:
- Test your knowledge: Functions: evalua definicion de funciones, parametros, valores de retorno y scope de variables
- Test your knowledge: Conditional statements: evalua sintaxis de if/elif/else, operadores de comparacion y logicos

**Modulo 3 — Loops and Strings:**

Actividades practicas:
- Annotated follow-along guide: Loops and strings: guia con ejemplos de while, for, range() con multiples parametros, y manipulacion de strings con indexing, slicing y format
- Activity: While loops: practicar while loops con condiciones de parada, uso de break y continue
- Activity: For loops: iterar sobre listas, rangos y strings; combinar loops con condicionales
- Activity: Strings: usar indexing ([i]), slicing ([start:end:step]), metodos (strip, lower, upper, replace, split) y f-strings

Lecturas clave:
- Loops, break, and continue statements: referencia de while y for loops con break (salir del loop) y continue (saltar a la siguiente iteracion); cuando usar cada uno
- For loops: sintaxis de for loops con range(), enumerate() y zip(); iterar sobre distintos tipos de colecciones
- String indexing and slicing: como acceder a caracteres individuales por indice y como extraer subcadenas con slicing
- String formatting and regular expressions: f-strings para formatear texto; introduccion a expresiones regulares para buscar y reemplazar patrones en strings

Otras actividades:
- Welcome to module 3 (video, 3 min): introduccion al modulo
- Michelle: Approach problems with an analytical mindset (video, 3 min): como aplicar pensamiento analitico al disenar loops y logica de programacion
- Introduction to while loops (video, 9 min): sintaxis de while, condicion de parada, riesgo de bucle infinito, uso de break
- Introduction to for loops (video, 4 min): sintaxis de for con listas y range()
- Loops with multiple range() parameters (video, 4 min): range(start, stop, step) para controlar el inicio, fin y salto del loop
- Work with strings (video, 4 min): metodos de string mas usados en analisis de datos — strip, lower, upper, replace, split
- String slicing (video, 7 min): indexacion positiva y negativa, slicing con start/end/step
- Format strings (video, 5 min): f-strings para insertar variables en texto, formateo de decimales y padding
- Desafio del modulo 3 (quiz calificado — completado)

Cuestionarios de practica:
- Test your knowledge: While loops: evalua sintaxis de while, condiciones de parada y uso de break y continue
- Test your knowledge: For loops: evalua iteracion sobre colecciones con range(), enumerate() y zip()
- Test your knowledge: Strings: evalua indexado, slicing y metodos de cadena (strip, lower, replace, split)

**Modulo 4 — Data Structures in Python:**

Actividades practicas:
- Annotated follow-along guide: Data structures in Python: guia anotada cubriendo listas, tuplas, diccionarios, sets, NumPy arrays y DataFrames de pandas con operaciones basicas en cada uno
- Activity: Lists & tuples: crear, modificar y recorrer listas; crear tuplas y acceder a sus elementos; usar zip() y enumerate()
- Activity: Dictionaries & sets: crear y actualizar diccionarios, usar metodos (keys, values, items), operaciones de sets (union, interseccion, diferencia)
- Activity: Arrays and vectors with NumPy: crear arrays con np.array(), operaciones vectorizadas (suma, media, std), indexacion y slicing de arrays
- Activity: Dataframes with pandas: cargar un CSV con pd.read_csv(), explorar con head/info/describe, filtrar con boolean masking, agrupar con groupby, unir DataFrames con merge

Lecturas clave:
- Reference guide: Lists: metodos de lista — append, extend, insert, remove, pop, sort, reverse; list comprehension
- Compare lists, strings, and tuples: tabla comparativa de las tres estructuras — mutabilidad, orden, indexacion, casos de uso tipicos
- zip(), enumerate(), and list comprehension: tres herramientas para iterar de forma eficiente; list comprehension como alternativa compacta a un for loop
- Reference guide: Dictionaries: metodos de diccionario — get, keys, values, items, update, pop; dict comprehension
- Reference guide: Sets: operaciones de conjuntos — union (|), interseccion (&), diferencia (-), diferencia simetrica (^)
- Understand Python libraries, packages, and modules: como funciona el ecosistema de paquetes Python — import, from...import, pip install; diferencia entre modulo, paquete y libreria
- Python's new versions and features: como mantenerse al dia con los cambios de Python — changelog, compatibilidad, uso de type hints
- Reference guide: Arrays: operaciones NumPy esenciales — np.array, np.zeros, np.ones, np.arange, np.linspace, indexacion y slicing
- The fundamentals of pandas: Series vs DataFrame, como pandas extiende NumPy para datos heterogeneos, el indice de pandas
- Boolean masking in pandas: filtrar filas con condiciones booleanas — df[df["col"] > valor], combinar condiciones con & y |
- More on grouping and aggregation: groupby con multiples columnas, agg() con diccionario de funciones, transform() para crear columnas de agregacion sin colapsar el DataFrame

Otras actividades:
- Welcome to module 4 (video, 2 min): introduccion al modulo
- Introduction to lists (video, 5 min): listas en Python — crear, acceder, modificar, metodos
- Modify the contents of a list (video, 4 min): append, insert, remove, pop, sort
- Introduction to tuples (video, 4 min): tuplas — inmutabilidad, cuando usarlas, desempaquetado
- More with loops, lists, and tuples (video, 6 min): combinar estructuras con loops; zip() y enumerate()
- Introduction to dictionaries (video, 5 min): diccionarios — clave:valor, acceso por clave, iterar
- Dictionary methods (video, 5 min): keys(), values(), items(), get(), update()
- Introduction to sets (video, 6 min): sets — unicidad, operaciones de conjuntos, casos de uso
- The power of packages (video, 4 min): como importar librerias (import numpy as np, import pandas as pd)
- Introduction to NumPy (video, 4 min): arrays NumPy vs listas Python — velocidad, operaciones vectorizadas
- Basic array operations (video, 6 min): operaciones aritmeticas, mean, std, sum, indexacion
- Introduction to pandas (video, 5 min): que es pandas, Series y DataFrame, relacion con NumPy
- pandas basics (video, 10 min): read_csv, head, tail, shape, info, describe, dtypes
- Boolean masking (video, 6 min): filtrar filas con condiciones booleanas
- Grouping and aggregation (video, 6 min): groupby, agg, sum, mean, count, size
- Merging and joining data (video, 9 min): pd.merge() con how="inner"/"left"/"right"/"outer" — equivalente a SQL JOIN
- Desafio del modulo 4 (quiz calificado — completado)
- Evaluacion del curso (quiz calificado final)

Cuestionarios de practica:
- Test your knowledge: Lists and tuples: evalua creacion y modificacion de listas, inmutabilidad de tuplas y uso de zip() y enumerate()
- Test your knowledge: Dictionaries and sets: evalua operaciones con diccionarios, metodos clave y operaciones de conjuntos (union, interseccion, diferencia)
- Test your knowledge: Arrays and vectors with NumPy: evalua creacion de arrays, operaciones vectorizadas e indexacion
- Test your knowledge: Dataframes with pandas: evalua carga de datos, exploracion con head/info/describe, filtrado con boolean masking, groupby y merge

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
