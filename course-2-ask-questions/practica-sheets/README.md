# Practica de Google Sheets — Course 2

**Curso:** Course 2 — Ask Questions to Make Data-Driven Decisions
**Herramienta:** Google Sheets

## Que cubre esta carpeta

El Course 2 usa Google Sheets como herramienta principal de analisis.
Tres funciones ocupan el nucleo de las actividades practicas: VLOOKUP
para cruzar datos entre tablas, las tablas pivot para resumir y explorar,
y COUNTIF/SUMIF para contar y sumar con condiciones. Esta documentacion
explica que problema resuelve cada una, como funciona y cuando usarla
en trabajo real.

---

## VLOOKUP

**Que problema resuelve:**
Tienes dos tablas y necesitas traer datos de una a otra usando un campo
comun como clave. Por ejemplo: una tabla de pedidos con ID de cliente,
y otra tabla de clientes con nombre y ciudad. VLOOKUP busca el ID en la
tabla de clientes y devuelve el campo que necesitas.

**Sintaxis:**
```
=VLOOKUP(valor_buscado, rango_tabla, num_columna, [exacto])
```

- `valor_buscado`: el valor a buscar (normalmente una celda con un ID)
- `rango_tabla`: el rango donde buscar (la tabla de referencia), siempre
  con el campo clave en la primera columna
- `num_columna`: que columna de la tabla quieres devolver (1 = la primera,
  2 = la segunda, etc.)
- `exacto`: usa siempre FALSE (o 0) para busqueda exacta

**Ejemplo de la actividad de Coursera:**
Se tiene una hoja con ventas (columna A: ID producto, columna B: unidades
vendidas) y otra hoja con el catalogo de productos (columna A: ID, columna B:
nombre, columna C: precio unitario). VLOOKUP trae el precio unitario a la
primera hoja para calcular el total de cada venta.

```
=VLOOKUP(A2, Catalogo!A:C, 3, FALSE)
```

**Cuando usarla en el mundo real:**
- Enriquecer un dataset con informacion de otro: anadir el nombre del
  cliente a una tabla de transacciones que solo tiene ID de cliente
- Cruzar codigos de producto con sus descripciones o precios
- Validar si un valor de una lista existe en otra lista

**Limitacion importante:** VLOOKUP solo busca hacia la derecha (el campo
clave debe ser la primera columna del rango). Si necesitas buscar en
cualquier direccion, usa INDEX/MATCH o XLOOKUP.

---

## Tablas pivot (Pivot Tables)

**Que problema resuelve:**
Resumir miles de filas en una tabla de resumen que muestra totales,
promedios o conteos por grupos, sin escribir formulas. Es el equivalente
visual de GROUP BY en SQL.

**Como se crea en Sheets:**
Datos > Tabla dinamica > seleccionar el rango de datos. Luego arrastrar
campos a Filas, Columnas, Valores y Filtros en el panel lateral.

**Ejemplo de la actividad de Coursera:**
Dataset de ventas con columnas: Fecha, Region, Categoria, Importe.
Se crea una pivot con:
- Filas: Region
- Columnas: Categoria
- Valores: SUM(Importe)

Resultado: una tabla donde cada celda muestra las ventas totales de esa
region en esa categoria. Se puede ver de inmediato que la region Norte
vende mas Electronica y que la region Sur lidera en Ropa.

**Cuando usarla en el mundo real:**
- Explorar un dataset nuevo rapidamente antes de escribir cualquier formula
- Preparar un resumen para una reunion sin necesidad de crear graficos
- Comparar el mismo metrica por dos dimensiones a la vez (region x categoria,
  mes x vendedor, etc.)
- Calcular porcentajes de columna o fila con un clic derecho

**Consejo de uso:** las pivot tables son dinamicas — si los datos cambian,
se actualizan con boton derecho > Actualizar. Pero no se pueden editar
directamente, son de solo lectura.

---

## COUNTIF y SUMIF

**Que problema resuelve:**
Contar o sumar solo las filas que cumplen una condicion, sin crear una
pivot table ni filtrar manualmente. COUNTIF cuenta cuantas celdas cumplen
el criterio. SUMIF suma los valores de las celdas que cumplen el criterio.

**Sintaxis COUNTIF:**
```
=COUNTIF(rango_condicion, criterio)
```

**Sintaxis SUMIF:**
```
=SUMIF(rango_condicion, criterio, rango_a_sumar)
```

**Ejemplos de la actividad de Coursera:**

Contar cuantos pedidos son de la region "Norte":
```
=COUNTIF(B:B, "Norte")
```

Sumar las ventas solo de la categoria "Electronica":
```
=SUMIF(C:C, "Electronica", D:D)
```

Contar pedidos con importe mayor de 500:
```
=COUNTIF(D:D, ">500")
```

**Versiones con multiples condiciones (COUNTIFS / SUMIFS):**
```
=COUNTIFS(B:B, "Norte", C:C, "Electronica")
=SUMIFS(D:D, B:B, "Norte", C:C, "Electronica")
```

COUNTIFS y SUMIFS aceptan tantos pares condicion/criterio como necesites.

**Cuando usarla en el mundo real:**
- Calcular KPIs rapidos en un dashboard de Sheets: "cuantos clientes
  compraron mas de 3 veces este mes"
- Validar datos: "cuantos registros tienen la ciudad en blanco"
- Crear resúmenes por categoria sin modificar los datos originales
- Calcular conversion rates: COUNTIF(estado, "cerrado") / COUNTIF(estado, "<>")

**Diferencia con la pivot table:**
COUNTIF/SUMIF devuelven un solo numero en una celda — util cuando necesitas
ese valor en una formula mayor o en un dashboard fijo. La pivot table es
mas flexible para explorar multiples combinaciones de forma interactiva.
