-- ============================================================
-- MODULO 1 — ORGANIZAR DATOS
-- Curso: Google Data Analytics Certificate — Course 5
-- Conceptos: ORDER BY, WHERE con multiples condiciones, CASE WHEN
-- Herramienta: BigQuery
-- ============================================================
--
-- Nota: estos ejercicios usan tablas temporales autocontenidas para
-- que puedas ejecutarlos directamente en BigQuery sin necesidad de
-- subir ningun dataset. Los comentarios indican como sustituir la
-- tabla temporal por bigquery-public-data.chicago_taxi_trips.taxi_trips
-- si quieres trabajar con datos reales.
-- ============================================================


-- ------------------------------------------------------------
-- SETUP: tabla temporal que simula viajes de taxi
-- Ejecuta este bloque primero — crea los datos de practica
-- ------------------------------------------------------------

CREATE TEMP TABLE viajes AS
SELECT * FROM UNNEST([
  STRUCT('T001' AS trip_id, '2024-01-15' AS trip_date, 'Manhattan'  AS pickup_zone, 'Brooklyn'    AS dropoff_zone, 12.5  AS fare_usd, 18.3  AS distance_km, 'Card'  AS payment_type),
  STRUCT('T002',            '2024-01-15',               'Brooklyn',                  'Queens',                       8.0,             11.2,               'Cash'),
  STRUCT('T003',            '2024-01-16',               'Manhattan',                 'Manhattan',                    22.0,            5.1,                'Card'),
  STRUCT('T004',            '2024-01-16',               'Bronx',                     'Manhattan',                    15.5,            19.8,               'Cash'),
  STRUCT('T005',            '2024-01-17',               'Queens',                    'Brooklyn',                     6.0,             8.4,                'Card'),
  STRUCT('T006',            '2024-01-17',               'Manhattan',                 'Bronx',                        31.0,            27.6,               'Cash'),
  STRUCT('T007',            '2024-01-18',               'Brooklyn',                  'Manhattan',                    9.5,             12.0,               'Card'),
  STRUCT('T008',            '2024-01-18',               'Staten Island',             'Manhattan',                    45.0,            38.2,               'Card'),
  STRUCT('T009',            '2024-01-19',               'Queens',                    'Manhattan',                    18.0,            22.5,               'Cash'),
  STRUCT('T010',            '2024-01-19',               'Manhattan',                 'Queens',                       14.0,            16.3,               'Card')
]);


-- ============================================================
-- EJERCICIO 1: ORDER BY simple
-- Concepto: ordenar resultados por una columna, ascendente y descendente
-- ============================================================

-- 1a. Mostrar todos los viajes ordenados por tarifa de mayor a menor
SELECT
  trip_id,
  pickup_zone,
  dropoff_zone,
  fare_usd
FROM viajes
ORDER BY fare_usd DESC;

-- 1b. Mostrar todos los viajes ordenados por fecha (mas antiguos primero)
SELECT
  trip_id,
  trip_date,
  fare_usd
FROM viajes
ORDER BY trip_date ASC;

-- Para datos reales en BigQuery:
-- FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
-- ORDER BY trip_start_timestamp ASC


-- ============================================================
-- EJERCICIO 2: ORDER BY con multiples columnas
-- Concepto: desempate cuando la primera columna tiene valores iguales
-- ============================================================

-- Ordenar por zona de origen (alfabeticamente) y dentro de cada zona,
-- por tarifa de mayor a menor
SELECT
  trip_id,
  pickup_zone,
  fare_usd,
  distance_km
FROM viajes
ORDER BY pickup_zone ASC, fare_usd DESC;

-- Lo que pasa: todos los viajes de Brooklyn aparecen juntos, ordenados
-- por tarifa dentro del grupo. Util para reportes agrupados visualmente.


-- ============================================================
-- EJERCICIO 3: WHERE con una condicion simple
-- Concepto: filtrar filas que cumplen un criterio
-- ============================================================

-- Solo viajes que salieron de Manhattan
SELECT
  trip_id,
  pickup_zone,
  dropoff_zone,
  fare_usd
FROM viajes
WHERE pickup_zone = 'Manhattan';

-- Solo viajes con tarifa mayor a 20 dolares
SELECT
  trip_id,
  fare_usd,
  pickup_zone,
  dropoff_zone
FROM viajes
WHERE fare_usd > 20
ORDER BY fare_usd DESC;


-- ============================================================
-- EJERCICIO 4: WHERE con AND — multiples condiciones obligatorias
-- Concepto: la fila debe cumplir TODAS las condiciones
-- ============================================================

-- Viajes de Manhattan que ademas pagaron con tarjeta
SELECT
  trip_id,
  pickup_zone,
  payment_type,
  fare_usd
FROM viajes
WHERE pickup_zone = 'Manhattan'
  AND payment_type = 'Card';

-- Viajes con tarifa entre 10 y 25 dolares y distancia mayor a 10 km
SELECT
  trip_id,
  fare_usd,
  distance_km,
  pickup_zone
FROM viajes
WHERE fare_usd BETWEEN 10 AND 25
  AND distance_km > 10
ORDER BY distance_km DESC;

-- BETWEEN es equivalente a: fare_usd >= 10 AND fare_usd <= 25


-- ============================================================
-- EJERCICIO 5: WHERE con OR — al menos una condicion se cumple
-- Concepto: la fila necesita cumplir UNA o mas de las condiciones
-- ============================================================

-- Viajes que salieron de Manhattan O de Brooklyn
SELECT
  trip_id,
  pickup_zone,
  dropoff_zone,
  fare_usd
FROM viajes
WHERE pickup_zone = 'Manhattan'
   OR pickup_zone = 'Brooklyn';

-- Equivalente mas conciso usando IN (preferible cuando hay muchos valores)
SELECT
  trip_id,
  pickup_zone,
  dropoff_zone,
  fare_usd
FROM viajes
WHERE pickup_zone IN ('Manhattan', 'Brooklyn');


-- ============================================================
-- EJERCICIO 6: WHERE combinando AND y OR con parentesis
-- Concepto: los parentesis controlan el orden de evaluacion logica
-- ============================================================

-- Viajes de Manhattan O Brooklyn, pero que ademas tengan tarifa > 10
-- Sin parentesis, el AND podria interpretar mal la logica
SELECT
  trip_id,
  pickup_zone,
  fare_usd
FROM viajes
WHERE (pickup_zone = 'Manhattan' OR pickup_zone = 'Brooklyn')
  AND fare_usd > 10;

-- Trampa clasica: sin parentesis, AND se evalua antes que OR
-- WHERE pickup_zone = 'Manhattan' OR pickup_zone = 'Brooklyn' AND fare_usd > 10
-- ...esto devolveria TODOS los de Manhattan (sin filtro de tarifa) + Brooklyn con tarifa > 10


-- ============================================================
-- EJERCICIO 7: CASE WHEN para segmentar datos en categorias
-- Concepto: crear una columna nueva con logica condicional por fila
-- ============================================================

-- Clasificar cada viaje segun la tarifa en tres segmentos
SELECT
  trip_id,
  pickup_zone,
  fare_usd,
  CASE
    WHEN fare_usd < 10              THEN 'economico'
    WHEN fare_usd BETWEEN 10 AND 25 THEN 'estandar'
    WHEN fare_usd > 25              THEN 'premium'
    ELSE 'sin clasificar'           -- cubre NULLs y casos no previstos
  END AS segmento_tarifa
FROM viajes
ORDER BY fare_usd;

-- BigQuery evalua las condiciones WHEN de arriba a abajo
-- y asigna el valor del primer WHEN que sea verdadero


-- ============================================================
-- EJERCICIO 8: CASE WHEN + ORDER BY + WHERE combinados
-- Concepto: aplicar todo lo del modulo en una query integrada
-- ============================================================

-- Viajes que no salieron de Staten Island, clasificados por distancia,
-- mostrando solo los de zona Manhattan o Brooklyn, ordenados por segmento
SELECT
  trip_id,
  pickup_zone,
  dropoff_zone,
  distance_km,
  fare_usd,
  CASE
    WHEN distance_km < 10  THEN 'corto'
    WHEN distance_km < 20  THEN 'medio'
    ELSE                        'largo'
  END AS tipo_viaje
FROM viajes
WHERE pickup_zone IN ('Manhattan', 'Brooklyn')
  AND fare_usd IS NOT NULL
ORDER BY tipo_viaje ASC, fare_usd DESC;
