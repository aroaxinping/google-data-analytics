# ============================================================
# MODULO 4 — ESTRUCTURAS DE DATOS Y PANDAS
# Curso: Google Data Analytics Certificate — Course 7
# Conceptos: listas, diccionarios, NumPy arrays, pandas DataFrame
# Ejecutar: pip install numpy pandas  &&  python ejercicios.py
# ============================================================

import numpy as np
import pandas as pd


# ============================================================
# BLOQUE 1: Listas — estructura de datos ordenada y mutable
# ============================================================

print("--- Listas ---")

ventas = [1200, 980, 1450, 760, 2100]

# Acceder por indice (empieza en 0)
print(f"Primera venta: {ventas[0]}")      # 1200
print(f"Ultima venta:  {ventas[-1]}")     # 2100 — indice negativo cuenta desde el final

# Slicing: ventas[inicio:fin] — incluye inicio, excluye fin
print(f"Primeras 3: {ventas[:3]}")        # [1200, 980, 1450]
print(f"Ultimas 2:  {ventas[-2:]}")       # [2100] ... espera, ultimas 2: [760, 2100]

# Modificar y agregar
ventas.append(1700)                        # anade al final
ventas[1] = 1050                           # modifica por indice
print(f"Lista modificada: {ventas}")

# Lista de diccionarios — estructura mas comun para datos tabulares en Python puro
empleados = [
    {"nombre": "Ana",   "depto": "Ventas",    "salario": 42000},
    {"nombre": "Luis",  "depto": "Marketing", "salario": 38000},
    {"nombre": "Sara",  "depto": "Ventas",    "salario": 47000},
]

# Acceder a campos
for emp in empleados:
    print(f"  {emp['nombre']} — {emp['depto']} — {emp['salario']}")


# ============================================================
# BLOQUE 2: Diccionarios — estructura clave-valor
# ============================================================

print("\n--- Diccionarios ---")

# Crear y acceder
producto = {
    "id": "P001",
    "nombre": "Laptop Pro",
    "precio": 1299.99,
    "stock": 45,
    "activo": True
}

print(f"Nombre: {producto['nombre']}")
print(f"Precio: {producto['precio']}")

# .get() es mas seguro: devuelve None si la clave no existe, sin error
print(f"Garantia: {producto.get('garantia', 'no especificada')}")

# Iterar sobre el diccionario
print("\nTodos los campos:")
for clave, valor in producto.items():
    print(f"  {clave}: {valor}")

# Modificar y agregar claves
producto["precio"] = 1199.99          # modificar
producto["categoria"] = "Electronica" # agregar clave nueva
print(f"\nPrecio actualizado: {producto['precio']}")

# Diccionario como resultado de un GROUP BY manual
ventas_por_ciudad = {}
datos = [
    ("Madrid", 1500), ("Barcelona", 800), ("Madrid", 2100),
    ("Sevilla", 600),  ("Barcelona", 1200), ("Madrid", 900),
]
for ciudad, venta in datos:
    if ciudad not in ventas_por_ciudad:
        ventas_por_ciudad[ciudad] = 0
    ventas_por_ciudad[ciudad] += venta

print(f"\nVentas por ciudad: {ventas_por_ciudad}")


# ============================================================
# BLOQUE 3: NumPy arrays — operaciones vectorizadas
# ============================================================

print("\n--- NumPy arrays ---")

# Diferencia clave entre lista Python y NumPy array:
# La lista aplica operaciones elemento a elemento con bucles (lento)
# NumPy aplica la operacion a TODOS los elementos a la vez (rapido)

precios = np.array([100, 250, 89, 410, 33, 175, 520])

# Operaciones sobre todo el array sin bucle
print(f"Con IVA (21%): {precios * 1.21}")               # multiplica TODOS
print(f"Descuento 10%: {precios * 0.9}")
print(f"Media:         {precios.mean():.2f}")
print(f"Desv. estandar:{precios.std():.2f}")
print(f"Total:         {precios.sum()}")
print(f"Maximo:        {precios.max()}")
print(f"Minimo:        {precios.min()}")

# Filtrado booleano — equivalente a WHERE en SQL
print(f"\nPrecios > 200:  {precios[precios > 200]}")
print(f"Precios <= 100: {precios[precios <= 100]}")

# Crear array con valores generados
secuencia = np.arange(0, 50, 5)          # de 0 a 50, paso 5
print(f"\nSecuencia:      {secuencia}")

ceros = np.zeros(5)                       # array de 5 ceros
print(f"Ceros:          {ceros}")


# ============================================================
# BLOQUE 4: pandas DataFrame — crear desde diccionario
# ============================================================

print("\n--- pandas DataFrame ---")

# Crear DataFrame desde un diccionario de listas (columnas)
datos_ventas = {
    "fecha":     ["2024-01-01", "2024-01-01", "2024-01-02", "2024-01-02", "2024-01-03",
                  "2024-01-03", "2024-01-04", "2024-01-05"],
    "ciudad":    ["Madrid", "Barcelona", "Madrid", "Sevilla", "Barcelona",
                  "Madrid", "Sevilla", "Madrid"],
    "categoria": ["Electronica", "Ropa", "Electronica", "Hogar", "Electronica",
                  "Ropa", "Electronica", "Hogar"],
    "importe":   [350.0, 85.0, 720.0, 140.0, 210.0, 95.0, 180.0, 310.0],
    "unidades":  [2, 3, 4, 1, 1, 5, 2, 2],
}

df = pd.DataFrame(datos_ventas)

# Vista general
print(df)
print(f"\nDimensiones: {df.shape}")           # (filas, columnas)
print(f"\nTipos de columnas:")
print(df.dtypes)

# Estadisticas descriptivas de columnas numericas
print(f"\nEstadisticas:")
print(df.describe())


# ============================================================
# BLOQUE 5: Seleccionar columnas y filtrar filas
# ============================================================

print("\n--- Seleccion y filtrado ---")

# Seleccionar una columna — devuelve una Serie
print(df["ciudad"])

# Seleccionar varias columnas — devuelve un DataFrame
print(df[["ciudad", "importe"]])

# Filtrar filas: solo ventas de Madrid
madrid = df[df["ciudad"] == "Madrid"]
print(f"\nVentas de Madrid:\n{madrid}")

# Filtrar con multiples condiciones: & para AND, | para OR
# IMPORTANTE: cada condicion debe ir entre parentesis
electronica_cara = df[(df["categoria"] == "Electronica") & (df["importe"] > 300)]
print(f"\nElectronica > 300 euros:\n{electronica_cara}")

# Filtrar con .isin() — equivalente a IN de SQL
ciudades_objetivo = ["Madrid", "Barcelona"]
df_objetivo = df[df["ciudad"].isin(ciudades_objetivo)]
print(f"\nCiudades objetivo:\n{df_objetivo}")


# ============================================================
# BLOQUE 6: Valores nulos — detectar, eliminar, rellenar
# ============================================================

print("\n--- Valores nulos ---")

# Crear un DataFrame con valores nulos para practicar
datos_con_nulos = {
    "id":       [1, 2, 3, 4, 5],
    "nombre":   ["Ana", None, "Carlos", "Diana", None],
    "salario":  [42000, 38000, None, 51000, 44000],
    "ciudad":   ["Madrid", "Barcelona", "Madrid", None, "Sevilla"],
}
df_nulos = pd.DataFrame(datos_con_nulos)

print("DataFrame con nulos:")
print(df_nulos)

# Detectar nulos
print(f"\nNulos por columna:")
print(df_nulos.isnull().sum())

# Eliminar filas con cualquier nulo
sin_nulos = df_nulos.dropna()
print(f"\nSin ningun nulo: {len(sin_nulos)} filas de {len(df_nulos)}")

# Rellenar nulos con un valor especifico
df_relleno = df_nulos.copy()
df_relleno["salario"].fillna(df_relleno["salario"].mean(), inplace=True)   # media
df_relleno["nombre"].fillna("Desconocido", inplace=True)
df_relleno["ciudad"].fillna("Sin ciudad", inplace=True)
print(f"\nNulos rellenados:")
print(df_relleno)


# ============================================================
# BLOQUE 7: Transformar columnas
# ============================================================

print("\n--- Transformar columnas ---")

# Crear columna nueva calculada
df["ticket_unitario"] = df["importe"] / df["unidades"]
df["ticket_unitario"] = df["ticket_unitario"].round(2)
print(df[["ciudad", "categoria", "importe", "unidades", "ticket_unitario"]])

# Limpiar texto: .str.lower(), .str.strip(), .str.replace()
ciudades_sucias = pd.Series(["  MADRID ", "barcelona  ", " Sevilla", "MADRID"])
ciudades_limpias = ciudades_sucias.str.strip().str.title()
print(f"\nCiudades limpias: {ciudades_limpias.tolist()}")

# Convertir tipos con .astype()
df["fecha"] = pd.to_datetime(df["fecha"])   # string a datetime
print(f"\nTipo de fecha: {df['fecha'].dtype}")

# Aplicar una funcion personalizada con .apply()
def segmentar_importe(valor):
    if valor < 200:
        return "bajo"
    elif valor < 500:
        return "medio"
    else:
        return "alto"

df["segmento"] = df["importe"].apply(segmentar_importe)
print(f"\nCon segmento:")
print(df[["ciudad", "importe", "segmento"]])


# ============================================================
# BLOQUE 8: groupby — agrupar y agregar
# ============================================================

print("\n--- groupby ---")

# Agrupar por ciudad y calcular metricas
por_ciudad = df.groupby("ciudad").agg(
    num_transacciones=("importe", "count"),
    ventas_totales=("importe", "sum"),
    ticket_medio=("importe", "mean"),
    unidades_totales=("unidades", "sum")
).round(2).reset_index()

print("Ventas por ciudad:")
print(por_ciudad)

# Agrupar por dos columnas
por_ciudad_categoria = df.groupby(["ciudad", "categoria"])["importe"].sum().reset_index()
por_ciudad_categoria.columns = ["ciudad", "categoria", "total"]
print(f"\nVentas por ciudad y categoria:")
print(por_ciudad_categoria.sort_values("total", ascending=False))

# value_counts() — contar ocurrencias de cada valor (como SELECT COUNT(*) GROUP BY)
print(f"\nTransacciones por ciudad:")
print(df["ciudad"].value_counts())
