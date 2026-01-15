# Notas: Primera vez con BigQuery y SQL

**Curso:** Course 3 — Prepare Data for Exploration
**Herramienta:** BigQuery (Google Cloud)
**Dataset:** `bigquery-public-data.chicago_taxi_trips.taxi_trips`

---

La razón para saltar de Sheets a BigQuery es simple: Sheets aguanta unas 100k
filas antes de volverse lento. El dataset de taxis de Chicago tiene más de
200 millones de filas. No puedes abrirlo en Sheets — necesitas SQL.

## Abrir BigQuery por primera vez

1. `console.cloud.google.com` → crear proyecto (gratuito)
2. BigQuery > SQL Workspace en el menú lateral
3. Explorar `bigquery-public-data` en el panel izquierdo

BigQuery no tiene interfaz de archivo. Se escribe una query y se consulta
directamente la base de datos.

## Queries iniciales

```sql
-- Ver estructura del dataset
SELECT *
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
LIMIT 10;
```

El `LIMIT` es obligatorio al explorar. Sin él BigQuery intenta traer los 200M
de filas, tarda siglos y consume créditos gratuitos.

```sql
-- Contar total de filas
SELECT COUNT(*) AS total_viajes
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`;
-- Resultado: ~203 millones
```

```sql
-- Distribución por método de pago
SELECT
  payment_type,
  COUNT(*) AS total,
  ROUND(AVG(tips), 2) AS propina_media
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE payment_type IS NOT NULL
GROUP BY payment_type
ORDER BY total DESC;
```

Hallazgo: los pagos con tarjeta tienen propina media mucho más alta que
en efectivo. Con tarjeta solo marcas un porcentaje en la pantalla, con
efectivo tienes que buscar el cambio.

## La diferencia entre WHERE y HAVING

```sql
-- WHERE filtra antes de agrupar (sobre datos originales)
WHERE fare > 5

-- HAVING filtra después de agrupar (sobre el resultado de COUNT, AVG...)
HAVING COUNT(*) > 1000
```

Regla: si filtras sobre una columna original → `WHERE`. Si filtras sobre
una agregacion → `HAVING`.

## El estimador de datos procesados

Antes de ejecutar, BigQuery muestra cuántos datos procesará arriba a la derecha.
La capa gratuita incluye 1 TB/mes. Buena práctica: siempre usar `WHERE` para
acotar antes de agregar, y `LIMIT` cuando solo exploras.

## SQL leido como inglés

Cada clausula tiene una traduccion directa:

```
"Select everything from this table" → SELECT * FROM tabla
"Where the fare is more than 5"     → WHERE fare > 5
"Group by payment type"             → GROUP BY payment_type
"Order by total descending"         → ORDER BY total DESC
```
