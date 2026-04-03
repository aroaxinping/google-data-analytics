# ============================================================
# MODULO 2 — FUNCIONES Y CONDICIONALES
# Curso: Google Data Analytics Certificate — Course 7
# Conceptos: def, parametros, return, if/elif/else
# Ejecutar: python ejercicios.py
# ============================================================


# ============================================================
# BLOQUE 1: Funcion basica — un parametro, un return
# ============================================================

def calcular_iva(precio_neto):
    """Devuelve el precio con IVA del 21% aplicado."""
    return precio_neto * 1.21

# Llamar a la funcion con distintos valores
print("--- Funciones basicas ---")
print(calcular_iva(100))      # 121.0
print(calcular_iva(49.99))    # 60.4879...
print(f"{calcular_iva(49.99):.2f}")  # 60.49 — con formato


# ============================================================
# BLOQUE 2: Funcion con multiples parametros
# ============================================================

def calcular_descuento(precio, porcentaje_descuento):
    """Devuelve el precio despues de aplicar un descuento porcentual."""
    descuento = precio * (porcentaje_descuento / 100)
    precio_final = precio - descuento
    return precio_final

print("\n--- Multiples parametros ---")
print(f"Precio con 20% descuento: {calcular_descuento(200, 20):.2f}")   # 160.00
print(f"Precio con 5% descuento:  {calcular_descuento(200, 5):.2f}")    # 190.00


# ============================================================
# BLOQUE 3: Parametros con valor por defecto
# ============================================================

def redondear_metrica(valor, decimales=2):
    """Redondea un valor. Por defecto usa 2 decimales."""
    return round(valor, decimales)

print("\n--- Parametros por defecto ---")
print(redondear_metrica(3.14159))       # 3.14 — usa el defecto
print(redondear_metrica(3.14159, 4))    # 3.1416 — sobreescribe el defecto
print(redondear_metrica(3.14159, 0))    # 3.0


# ============================================================
# BLOQUE 4: Funcion que devuelve multiples valores (como tupla)
# ============================================================

def estadisticas_basicas(lista_valores):
    """Devuelve minimo, maximo y promedio de una lista de numeros."""
    minimo = min(lista_valores)
    maximo = max(lista_valores)
    promedio = sum(lista_valores) / len(lista_valores)
    return minimo, maximo, promedio  # Python empaqueta esto como tupla

print("\n--- Return multiple ---")
ventas = [12000, 18500, 9300, 22100, 15600]
minv, maxv, prom = estadisticas_basicas(ventas)   # desempaquetado
print(f"Minimo:   {minv}")
print(f"Maximo:   {maxv}")
print(f"Promedio: {prom:.1f}")


# ============================================================
# BLOQUE 5: Condicional if/elif/else basico
# ============================================================

print("\n--- Condicionales ---")

def clasificar_nps(puntuacion):
    """
    Clasifica una puntuacion NPS (Net Promoter Score) en tres categorias.
    NPS va de 0 a 10.
    """
    if puntuacion >= 9:
        return "promotor"
    elif puntuacion >= 7:
        return "pasivo"
    else:
        return "detractor"

# Probar con distintos valores
for puntuacion in [10, 8, 6, 3]:
    resultado = clasificar_nps(puntuacion)
    print(f"NPS {puntuacion}: {resultado}")


# ============================================================
# BLOQUE 6: Condicional con operadores in y not in
# ============================================================

def es_mercado_prioritario(pais):
    """Devuelve True si el pais esta en la lista de mercados prioritarios."""
    mercados_prioritarios = ["España", "Francia", "Alemania", "Italia"]
    return pais in mercados_prioritarios

print("\n--- Operador in ---")
print(es_mercado_prioritario("España"))      # True
print(es_mercado_prioritario("Portugal"))    # False
print(es_mercado_prioritario("Alemania"))    # True


# ============================================================
# BLOQUE 7: Funcion que usa condicionales internamente
# para aplicar logica de negocio
# ============================================================

def calcular_comision(ventas_mes, tipo_vendedor):
    """
    Calcula la comision de un vendedor segun su tipo y ventas del mes.
    - junior: 3% hasta 10000, 5% por encima
    - senior: 5% hasta 20000, 8% por encima
    - director: 10% fijo
    """
    if tipo_vendedor == "junior":
        if ventas_mes <= 10000:
            comision = ventas_mes * 0.03
        else:
            # Los primeros 10000 al 3%, el resto al 5%
            comision = 10000 * 0.03 + (ventas_mes - 10000) * 0.05
    elif tipo_vendedor == "senior":
        if ventas_mes <= 20000:
            comision = ventas_mes * 0.05
        else:
            comision = 20000 * 0.05 + (ventas_mes - 20000) * 0.08
    elif tipo_vendedor == "director":
        comision = ventas_mes * 0.10
    else:
        # Tipo no reconocido
        return None

    return round(comision, 2)

print("\n--- Logica de negocio en funciones ---")
print(f"Junior   15000 euros: {calcular_comision(15000, 'junior')} euros de comision")
print(f"Senior   25000 euros: {calcular_comision(25000, 'senior')} euros de comision")
print(f"Director 18000 euros: {calcular_comision(18000, 'director')} euros de comision")
print(f"Tipo invalido:        {calcular_comision(10000, 'becario')}")   # None


# ============================================================
# BLOQUE 8: Funciones que llaman a otras funciones
# ============================================================

def margen_bruto(ingresos, coste_variable):
    """Calcula el margen bruto en euros."""
    return ingresos - coste_variable

def margen_bruto_pct(ingresos, coste_variable):
    """Calcula el margen bruto como porcentaje de los ingresos."""
    margen = margen_bruto(ingresos, coste_variable)   # reutiliza la funcion anterior
    if ingresos == 0:
        return 0
    return round((margen / ingresos) * 100, 2)

print("\n--- Funciones anidadas ---")
print(f"Margen bruto:    {margen_bruto(50000, 32000)} euros")
print(f"Margen bruto %:  {margen_bruto_pct(50000, 32000)}%")


# ============================================================
# EJERCICIO INTEGRADOR
# Sistema de evaluacion de rendimiento con funciones y condicionales
# ============================================================

print("\n--- Evaluacion de rendimiento ---")

def nivel_rendimiento(tasa_resolucion, satisfaccion, tickets_pendientes):
    """
    Evalua el nivel de rendimiento de un agente de soporte.
    Devuelve un string con el nivel y una recomendacion.
    """
    if tasa_resolucion >= 90 and satisfaccion >= 4.5:
        nivel = "excelente"
        accion = "candidato para mentor de equipo"
    elif tasa_resolucion >= 75 and satisfaccion >= 4.0:
        nivel = "bueno"
        accion = "mantener seguimiento mensual"
    elif tasa_resolucion >= 60:
        nivel = "en desarrollo"
        accion = "plan de mejora con seguimiento semanal"
    else:
        nivel = "critico"
        accion = "reunion urgente con manager"

    if tickets_pendientes > 10:
        accion += " — revisar carga de trabajo"

    return nivel, accion


# Evaluar tres agentes con distintos perfiles
agentes = [
    ("Sofia",   92.5, 4.8, 3),
    ("Miguel",  78.0, 4.1, 8),
    ("Carmen",  55.0, 3.7, 15),
]

for nombre, tasa, satisfaccion, pendientes in agentes:
    nivel, accion = nivel_rendimiento(tasa, satisfaccion, pendientes)
    print(f"{nombre}: {nivel} — {accion}")
