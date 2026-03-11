# Notas: Sheets como herramienta de análisis

**Curso:** Course 2 — Ask Questions to Make Data-Driven Decisions
**Herramienta:** Google Sheets

---

El Course 2 usa Sheets para introducir tres conceptos que luego se repiten
en SQL y R: filtrar, agregar y combinar tablas. Aprenderlos aquí con interfaz
visual hace que después tengan mucho más sentido en código.

## Ordenar y filtrar

La confusión clásica al principio: **ordenar** cambia el orden de filas,
**filtrar** oculta filas que no cumplen la condición. Son cosas distintas.

Cuando tienes un filtro activo y ordenas, estás ordenando solo lo que está
visible. Hay que tenerlo claro para no confundirse con los resultados.

## Tablas pivot

Una tabla pivot hace en segundos lo que harías con horas de fórmulas.
Lo más importante: **si los datos originales cambian, la pivot se actualiza**.
No es una foto, es una vista viva.

En SQL esto es un `GROUP BY`. Entender la pivot visualmente antes me hizo
entender `GROUP BY` mucho más rápido cuando llegué al Course 3.

## VLOOKUP

```
=VLOOKUP(A2, 'Catalogo'!A:C, 2, FALSE)
```

- `A2` → el valor que busco
- `'Catalogo'!A:C` → dónde busco
- `2` → qué columna del rango devolver (no de la hoja, del rango)
- `FALSE` → coincidencia exacta

La trampa está en el tercer parámetro: se refiere a la posición dentro del
rango definido, no en la hoja completa. Eso me confundió varias veces.

En SQL esto equivale a un `JOIN`. De hecho, entender VLOOKUP fue lo que me
hizo entender JOIN cuando llegué al Course 5.

## La tabla de equivalencias que me quedé

| Sheets | SQL |
|--------|-----|
| Filtrar | `WHERE` |
| Ordenar | `ORDER BY` |
| Tabla pivot | `GROUP BY` |
| VLOOKUP | `JOIN` |

Aprender el concepto visual en Sheets primero hizo el salto a SQL mucho
menos traumático. Los conceptos son los mismos, cambia la sintaxis.
