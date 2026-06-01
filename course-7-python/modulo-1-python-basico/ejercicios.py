# ============================================================
# MODULO 1 — PYTHON BASICO
# Curso: Google Data Analytics Certificate — Course 7
# Conceptos: variables, tipos de datos, operadores, f-strings
# Ejecutar: python ejercicios.py
# ============================================================


# ============================================================
# BLOQUE 1: Variables y tipos de datos
# ============================================================

# Asignacion: el valor de la derecha se almacena con el nombre de la izquierda
nombre_analista = "Laura"
anios_experiencia = 3
salario = 42500.50
es_activo = True
proyecto_actual = None  # None representa "sin valor" / ausencia de dato

# type() devuelve el tipo de dato de cualquier variable
print("--- Tipos de datos ---")
print(type(nombre_analista))      # <class 'str'>
print(type(anios_experiencia))    # <class 'int'>
print(type(salario))              # <class 'float'>
print(type(es_activo))            # <class 'bool'>
print(type(proyecto_actual))      # <class 'NoneType'>


# ============================================================
# BLOQUE 2: Conversion entre tipos (casting)
# ============================================================

print("\n--- Conversion de tipos ---")

# str a int y float: necesario cuando los datos vienen de un CSV como texto
edad_texto = "28"
edad_numero = int(edad_texto)
print(edad_numero + 1)            # 29 — ahora si se puede operar

precio_texto = "19.99"
precio_numero = float(precio_texto)
print(precio_numero * 2)          # 39.98

# int o float a str: necesario para concatenar en textos
codigo = "ID-" + str(1042)
print(codigo)                     # ID-1042

# Peligro comun: sumar strings en lugar de numeros
a = "3"
b = "4"
print(a + b)                      # "34" — concatenacion, no suma
print(int(a) + int(b))           # 7 — suma numerica


# ============================================================
# BLOQUE 3: Operadores aritmeticos
# ============================================================

print("\n--- Operadores aritmeticos ---")

ventas_enero = 15000
ventas_febrero = 18500
ventas_marzo = 12300

total = ventas_enero + ventas_febrero + ventas_marzo
promedio = total / 3
diferencia = ventas_febrero - ventas_enero

print(f"Total Q1: {total}")
print(f"Promedio mensual: {promedio:.2f}")       # :.2f = 2 decimales
print(f"Diferencia ene-feb: {diferencia}")

# Division entera (//) — descarta los decimales
print(15 // 4)    # 3 (no 3.75)

# Modulo (%) — devuelve el resto de la division
print(15 % 4)     # 3 (15 = 4*3 + 3)
# Util para saber si un numero es par: numero % 2 == 0

# Potencia (**)
print(2 ** 8)     # 256


# ============================================================
# BLOQUE 4: Operadores de comparacion
# Siempre devuelven True o False
# ============================================================

print("\n--- Operadores de comparacion ---")

meta_ventas = 16000

print(ventas_enero >= meta_ventas)     # False — enero no llego a la meta
print(ventas_febrero > meta_ventas)    # True  — febrero supero la meta
print(ventas_enero == ventas_marzo)    # False — no son iguales
print(ventas_enero != ventas_febrero)  # True  — son distintos

# Comparar strings (compara alfabeticamente)
ciudad_a = "Madrid"
ciudad_b = "Barcelona"
print(ciudad_a == ciudad_b)            # False
print(ciudad_a != ciudad_b)            # True


# ============================================================
# BLOQUE 5: Operadores logicos — and, or, not
# ============================================================

print("\n--- Operadores logicos ---")

# and: ambas condiciones deben ser True
cumple_meta = ventas_febrero > meta_ventas and ventas_marzo > meta_ventas
print(f"Ambos meses superaron la meta: {cumple_meta}")   # False

# or: al menos una condicion debe ser True
algun_mes_bien = ventas_enero > meta_ventas or ventas_febrero > meta_ventas
print(f"Algun mes supero la meta: {algun_mes_bien}")     # True

# not: invierte el valor booleano
sin_proyecto = not es_activo
print(f"Sin proyecto activo: {sin_proyecto}")            # False


# ============================================================
# BLOQUE 6: f-strings — interpolacion de variables en texto
# ============================================================

print("\n--- f-strings ---")

# Sintaxis: f"texto {variable} texto"
producto = "laptop"
precio = 899.99
descuento_pct = 15

precio_final = precio * (1 - descuento_pct / 100)

# f-string basico
print(f"Producto: {producto}")
print(f"Precio original: {precio}")
print(f"Descuento: {descuento_pct}%")
print(f"Precio final: {precio_final:.2f}")   # :.2f = formatear con 2 decimales

# f-string con expresiones directas (no solo variables)
print(f"El producto '{producto}' tiene un descuento de {precio - precio_final:.2f} euros")

# Formato de numeros grandes con separadores de miles
ventas_anuales = 1250000
print(f"Ventas anuales: {ventas_anuales:,}")          # 1,250,000
print(f"Ventas anuales: {ventas_anuales:,.2f}")       # 1,250,000.00


# ============================================================
# EJERCICIO INTEGRADOR
# Calcular y mostrar un resumen de rendimiento de un analista
# ============================================================

print("\n--- Resumen de rendimiento ---")

analista = "Carlos"
tickets_asignados = 47
tickets_resueltos = 41
tiempo_medio_horas = 2.3
satisfaccion = 4.6  # sobre 5.0

tasa_resolucion = tickets_resueltos / tickets_asignados * 100
tickets_pendientes = tickets_asignados - tickets_resueltos

print(f"Analista: {analista}")
print(f"Tickets resueltos: {tickets_resueltos} de {tickets_asignados}")
print(f"Tasa de resolucion: {tasa_resolucion:.1f}%")
print(f"Tickets pendientes: {tickets_pendientes}")
print(f"Tiempo medio por ticket: {tiempo_medio_horas}h")
print(f"Satisfaccion: {satisfaccion}/5.0")
print(f"Rendimiento aceptable: {tasa_resolucion >= 80 and satisfaccion >= 4.0}")
