# Notas: Sheets como herramienta de análisis

**Curso:** Course 2 — Ask Questions to Make Data-Driven Decisions
**Herramienta:** Google Sheets

---

El Course 2 usa Sheets para introducir tres conceptos que luego se repiten
en SQL y R: filtrar, agregar y combinar tablas. Aprenderlos aquí con interfaz
visual hace que después tengan mucho más sentido en código.

## Ordenar y filtrar

Distincion importante: **ordenar** cambia el orden de filas; **filtrar**
oculta filas que no cumplen la condicion.

Cuando tienes un filtro activo y ordenas, estás ordenando solo lo que está
visible.

## Tablas pivot

Una tabla pivot hace en segundos lo que harías con horas de fórmulas.
Lo más importante: **si los datos originales cambian, la pivot se actualiza**.
No es una foto, es una vista viva.

En SQL esto es un `GROUP BY`. La pivot es el equivalente visual: util para
entender la logica de agregacion antes de escribirla en codigo.

## VLOOKUP

```
=VLOOKUP(A2, 'Catalogo'!A:C, 2, FALSE)
```

- `A2` → el valor que busco
- `'Catalogo'!A:C` → dónde busco
- `2` → qué columna del rango devolver (no de la hoja, del rango)
- `FALSE` → coincidencia exacta

La trampa está en el tercer parámetro: se refiere a la posición dentro del
rango definido, no en la hoja completa.

En SQL esto equivale a un `JOIN`.

## Tabla de equivalencias Sheets / SQL

| Sheets | SQL |
|--------|-----|
| Filtrar | `WHERE` |
| Ordenar | `ORDER BY` |
| Tabla pivot | `GROUP BY` |
| VLOOKUP | `JOIN` |

Los conceptos son los mismos en Sheets y en SQL. Cambia la sintaxis.
