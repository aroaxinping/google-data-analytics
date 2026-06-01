# ============================================================
# MODULO 3 — BUCLES Y STRINGS
# Curso: Google Data Analytics Certificate — Course 7
# Conceptos: for, while, range(), metodos de string, list comprehensions
# Ejecutar: python ejercicios.py
# ============================================================


# ============================================================
# BLOQUE 1: for loop sobre una lista
# ============================================================

print("--- for loop sobre lista ---")

ventas_diarias = [1200, 980, 1450, 760, 2100, 1380, 890]

# Iterar e imprimir cada valor
for venta in ventas_diarias:
    print(f"  Venta: {venta}")

# Acumular en una variable — patron clasico
total = 0
for venta in ventas_diarias:
    total += venta          # equivalente a: total = total + venta
print(f"Total acumulado: {total}")


# ============================================================
# BLOQUE 2: for con range() — iterar sobre numeros
# ============================================================

print("\n--- range() ---")

# range(n) genera 0, 1, 2, ..., n-1
for i in range(5):
    print(i, end=" ")     # end=" " evita el salto de linea entre prints
print()

# range(inicio, fin) — incluye inicio, excluye fin
for i in range(1, 6):
    print(i, end=" ")
print()

# range(inicio, fin, paso) — avanza de 2 en 2
for i in range(0, 11, 2):
    print(i, end=" ")
print()

# Combinar range con una lista para acceder por indice
dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
for i in range(len(dias)):
    print(f"Dia {i+1}: {dias[i]} — venta: {ventas_diarias[i]}")


# ============================================================
# BLOQUE 3: for con enumerate() — indice y valor a la vez
# ============================================================

print("\n--- enumerate() ---")

# enumerate() es mas pythonico que usar range(len(lista))
for indice, dia in enumerate(dias):
    print(f"  {indice}: {dia}")


# ============================================================
# BLOQUE 4: while loop — repetir hasta que se cumpla condicion
# ============================================================

print("\n--- while loop ---")

# Simular un proceso de carga de datos por lotes
registros_procesados = 0
total_registros = 1000
tamano_lote = 250

while registros_procesados < total_registros:
    registros_procesados += tamano_lote
    print(f"Procesados: {registros_procesados} / {total_registros}")

print("Carga completada")


# ============================================================
# BLOQUE 5: break — salir del bucle antes de terminar
# ============================================================

print("\n--- break ---")

# Buscar el primer valor que supera un umbral
umbral = 1500
for i, venta in enumerate(ventas_diarias):
    if venta > umbral:
        print(f"Primera venta que supera {umbral}: dia {i+1} con {venta}")
        break   # detiene el bucle en cuanto encuentra el primero
else:
    # El bloque else del for se ejecuta si el bucle termino SIN break
    print(f"Ninguna venta supera {umbral}")


# ============================================================
# BLOQUE 6: continue — saltar una iteracion sin salir del bucle
# ============================================================

print("\n--- continue ---")

# Procesar solo las ventas que superan la media (ignorar las demas)
media = sum(ventas_diarias) / len(ventas_diarias)
print(f"Media: {media:.1f}")

ventas_sobre_media = []
for venta in ventas_diarias:
    if venta <= media:
        continue   # salta a la siguiente iteracion
    ventas_sobre_media.append(venta)

print(f"Ventas sobre la media: {ventas_sobre_media}")


# ============================================================
# BLOQUE 7: Metodos de string — limpieza de texto
# ============================================================

print("\n--- Metodos de string ---")

# Datos sucios tipicos de un CSV: espacios, mayusculas inconsistentes
nombres_sucios = [
  "  Ana Torres ",
  "LUIS morales",
  "sara DIAZ  ",
  " Pedro_Ruiz",
  "MARTA lopez"
]

# Limpiar cada nombre: quitar espacios, titulo (primera letra mayuscula)
print("Nombres limpios:")
for nombre in nombres_sucios:
    limpio = nombre.strip().title().replace("_", " ")
    print(f"  '{nombre}' -> '{limpio}'")

# Metodos mas usados en limpieza:
texto = "  Hola Mundo  "
print(f"\nstrip():   '{texto.strip()}'")        # quita espacios inicio y fin
print(f"lower():   '{texto.strip().lower()}'")  # todo minusculas
print(f"upper():   '{texto.strip().upper()}'")  # todo mayusculas
print(f"title():   '{texto.strip().title()}'")  # Cada Palabra En Mayuscula


# ============================================================
# BLOQUE 8: Mas metodos de string — buscar, reemplazar, dividir
# ============================================================

print("\n--- Buscar y dividir ---")

email = "usuario.apellido@empresa.com"

# split() divide el string en una lista segun un separador
partes = email.split("@")
print(f"Partes del email: {partes}")             # ['usuario.apellido', 'empresa.com']
print(f"Dominio: {partes[1]}")                   # empresa.com
print(f"Usuario: {partes[0].replace('.', ' ')}")  # usuario apellido

# Comprobar si un string empieza o termina con algo
print(f"Es email de empresa: {email.endswith('@empresa.com')}")  # True
print(f"Empieza con 'admin': {email.startswith('admin')}")        # False

# find() devuelve el indice de la primera ocurrencia (-1 si no existe)
print(f"Posicion de '@': {email.find('@')}")     # 16

# count() cuenta ocurrencias
print(f"Puntos en email: {email.count('.')}")    # 2

# replace() reemplaza todas las ocurrencias
url_antigua = "http://old-domain.com/productos/item"
url_nueva = url_antigua.replace("old-domain.com", "new-domain.com")
print(f"URL actualizada: {url_nueva}")


# ============================================================
# BLOQUE 9: join() — unir una lista de strings en uno solo
# ============================================================

print("\n--- join() ---")

etiquetas = ["data", "analytics", "python", "sql"]

# join() es lo contrario de split()
print(",".join(etiquetas))          # data,analytics,python,sql
print(" | ".join(etiquetas))        # data | analytics | python | sql
print("-".join(etiquetas).upper())  # DATA-ANALYTICS-PYTHON-SQL


# ============================================================
# BLOQUE 10: List comprehensions — bucles concisos
# ============================================================

print("\n--- List comprehensions ---")

# Forma larga con for + append:
precios_netos = [100, 250, 89, 410, 33]
precios_con_iva_largo = []
for precio in precios_netos:
    precios_con_iva_largo.append(round(precio * 1.21, 2))
print(f"Con IVA (bucle):          {precios_con_iva_largo}")

# Forma corta con list comprehension — equivalente exacto:
precios_con_iva = [round(p * 1.21, 2) for p in precios_netos]
print(f"Con IVA (comprehension):  {precios_con_iva}")

# Con condicion: solo los precios mayores de 100
precios_filtrados = [p for p in precios_netos if p > 100]
print(f"Solo mayores de 100:      {precios_filtrados}")

# Limpiar una lista de strings en una linea
ciudades_sucias = ["  madrid ", "BARCELONA  ", " sevilla"]
ciudades_limpias = [c.strip().title() for c in ciudades_sucias]
print(f"Ciudades limpias: {ciudades_limpias}")


# ============================================================
# EJERCICIO INTEGRADOR
# Procesar una lista de registros de ventas con bucles y strings
# ============================================================

print("\n--- Ejercicio integrador: procesar registros ---")

# Datos en bruto como llegarian de un CSV mal formateado
registros_raw = [
    "p001 | laptop | 899.99 | madrid",
    "P002 |  Telefono  | 499.50 | BARCELONA",
    "p003 | tablet | 349.00 | sevilla",
    "P004 | AURICULARES | 89.99 |  madrid ",
    "p005 | laptop | 1299.99 | barcelona",
]

registros_limpios = []
total_ventas = 0

for registro in registros_raw:
    partes = registro.split("|")
    # Limpiar cada campo
    id_venta   = partes[0].strip().upper()
    producto   = partes[1].strip().title()
    precio     = float(partes[2].strip())
    ciudad     = partes[3].strip().title()

    registros_limpios.append({
        "id": id_venta,
        "producto": producto,
        "precio": precio,
        "ciudad": ciudad
    })
    total_ventas += precio

print("Registros procesados:")
for r in registros_limpios:
    print(f"  {r['id']} | {r['producto']:15} | {r['precio']:8.2f} | {r['ciudad']}")

print(f"\nTotal ventas procesadas: {total_ventas:.2f}")
print(f"Media por venta:         {total_ventas / len(registros_limpios):.2f}")
