-- ============================================================
-- MODULO 3 — AGREGAR DATOS
-- Curso: Google Data Analytics Certificate — Course 5
-- Conceptos: GROUP BY, HAVING, subconsultas, window functions
-- Herramienta: BigQuery
-- ============================================================


-- ------------------------------------------------------------
-- SETUP: tabla temporal de ventas por tienda y categoria
-- ------------------------------------------------------------

CREATE TEMP TABLE ventas AS
SELECT * FROM UNNEST([
  STRUCT('2024-01-01' AS fecha, 'Madrid'     AS ciudad, 'Electronica'  AS categoria, 350.00 AS importe, 2 AS unidades),
  STRUCT('2024-01-01',          'Barcelona',             'Ropa',                      85.00,             3),
  STRUCT('2024-01-02',          'Madrid',                'Electronica',               720.00,            4),
  STRUCT('2024-01-02',          'Sevilla',               'Hogar',                     140.00,            1),
  STRUCT('2024-01-03',          'Barcelona',             'Electronica',               210.00,            1),
  STRUCT('2024-01-03',          'Madrid',                'Ropa',                      95.00,             5),
  STRUCT('2024-01-04',          'Sevilla',               'Electronica',               180.00,            2),
  STRUCT('2024-01-04',          'Madrid',                'Hogar',                     310.00,            2),
  STRUCT('2024-01-05',          'Barcelona',             'Ropa',                      120.00,            4),
  STRUCT('2024-01-05',          'Sevilla',               'Ropa',                      55.00,             2),
  STRUCT('2024-01-06',          'Madrid',                'Electronica',               430.00,            3),
  STRUCT('2024-01-06',          'Barcelona',             'Hogar',                     200.00,            1),
  STRUCT('2024-01-07',          'Sevilla',               'Hogar',                     75.00,             1),
  STRUCT('2024-01-07',          'Madrid',                'Ropa',                      160.00,            6),
  STRUCT('2024-01-08',          'Barcelona',             'Electronica',               890.00,            5)
]);


-- ============================================================
-- EJERCICIO 1: GROUP BY con funciones de agregacion basicas
-- Concepto: resumir filas por grupo usando COUNT, SUM, AVG, MAX, MIN
-- ============================================================

-- Resumen de ventas por ciudad
SELECT
  ciudad,
  COUNT(*)        AS num_transacciones,
  SUM(importe)    AS ventas_totales,
  AVG(importe)    AS ticket_medio,
  MAX(importe)    AS venta_mayor,
  MIN(importe)    AS venta_menor
FROM ventas
GROUP BY ciudad
ORDER BY ventas_totales DESC;

-- Resumen por categoria
SELECT
  categoria,
  COUNT(*)           AS transacciones,
  SUM(unidades)      AS unidades_totales,
  ROUND(AVG(importe), 2) AS importe_medio
FROM ventas
GROUP BY categoria
ORDER BY unidades_totales DESC;


-- ============================================================
-- EJERCICIO 2: GROUP BY con multiples columnas
-- Concepto: agrupar por la combinacion de dos o mas columnas
-- ============================================================

-- Ventas por ciudad Y categoria (cada combinacion es un grupo distinto)
SELECT
  ciudad,
  categoria,
  COUNT(*)        AS transacciones,
  SUM(importe)    AS total
FROM ventas
GROUP BY ciudad, categoria
ORDER BY ciudad, total DESC;


-- ============================================================
-- EJERCICIO 3: WHERE antes de GROUP BY
-- Concepto: WHERE filtra filas ANTES de que se formen los grupos
-- Solo las filas que pasan el WHERE se incluyen en la agregacion
-- ============================================================

-- Ventas totales por ciudad, pero solo contando ventas de Electronica
-- WHERE se aplica primero: agrupa solo las filas de Electronica
SELECT
  ciudad,
  SUM(importe) AS ventas_electronica
FROM ventas
WHERE categoria = 'Electronica'
GROUP BY ciudad
ORDER BY ventas_electronica DESC;


-- ============================================================
-- EJERCICIO 4: HAVING — filtrar grupos despues de agregar
-- Concepto: HAVING se aplica DESPUES de GROUP BY, sobre los grupos
-- No se puede usar WHERE para filtrar por el resultado de COUNT o SUM
-- ============================================================

-- Solo ciudades con mas de 3 transacciones
SELECT
  ciudad,
  COUNT(*) AS num_transacciones
FROM ventas
GROUP BY ciudad
HAVING COUNT(*) > 3
ORDER BY num_transacciones DESC;

-- Solo categorias cuya suma de ventas supera 500 euros
SELECT
  categoria,
  SUM(importe) AS total
FROM ventas
GROUP BY categoria
HAVING SUM(importe) > 500
ORDER BY total DESC;

-- Combinacion de WHERE y HAVING:
-- WHERE filtra filas antes de agrupar, HAVING filtra grupos despues
-- Ciudades que, considerando solo ventas > 100 euros, tienen mas de 2 transacciones
SELECT
  ciudad,
  COUNT(*)     AS transacciones_grandes,
  SUM(importe) AS total
FROM ventas
WHERE importe > 100        -- se aplica primero: excluye filas con importe <= 100
GROUP BY ciudad
HAVING COUNT(*) > 2        -- se aplica despues: excluye grupos con 2 o menos transacciones
ORDER BY total DESC;


-- ============================================================
-- EJERCICIO 5: Subconsulta en FROM (tabla derivada)
-- Concepto: usar el resultado de una SELECT como si fuera una tabla
-- ============================================================

-- Calcular el promedio de ventas por ciudad, luego comparar cada ciudad
-- con el promedio general de esos promedios
SELECT
  ciudad,
  ROUND(promedio_ciudad, 2) AS promedio,
  ROUND(AVG(promedio_ciudad) OVER (), 2) AS promedio_general,
  CASE
    WHEN promedio_ciudad > AVG(promedio_ciudad) OVER () THEN 'por encima'
    ELSE 'por debajo o igual'
  END AS vs_media
FROM (
  -- Subconsulta: calcula el promedio por ciudad
  SELECT
    ciudad,
    AVG(importe) AS promedio_ciudad
  FROM ventas
  GROUP BY ciudad
) AS promedios_por_ciudad;


-- ============================================================
-- EJERCICIO 6: Subconsulta en WHERE
-- Concepto: filtrar filas cuyo valor supera un umbral calculado dinamicamente
-- ============================================================

-- Ver las ventas individuales que superan la media general de todas las ventas
SELECT
  fecha,
  ciudad,
  categoria,
  importe
FROM ventas
WHERE importe > (
  SELECT AVG(importe)
  FROM ventas
)
ORDER BY importe DESC;

-- El valor dentro de la subconsulta se calcula una vez y se usa como filtro
-- En este dataset la media es ~271 euros


-- ============================================================
-- EJERCICIO 7: RANK() y ROW_NUMBER() — window functions de ranking
-- Concepto: asignar un numero de orden a cada fila segun un criterio
-- Sin colapsar filas (a diferencia de GROUP BY, se ven todas las filas)
-- ============================================================

SELECT
  ciudad,
  categoria,
  importe,
  -- RANK: igual importe = mismo rango, el siguiente rango se salta
  RANK()       OVER (ORDER BY importe DESC) AS ranking_global,
  -- ROW_NUMBER: siempre numeros consecutivos, sin empates
  ROW_NUMBER() OVER (ORDER BY importe DESC) AS numero_fila,
  -- RANK por ciudad: ranking independiente dentro de cada ciudad
  RANK()       OVER (PARTITION BY ciudad ORDER BY importe DESC) AS ranking_en_ciudad
FROM ventas
ORDER BY importe DESC;

-- PARTITION BY reinicia el contador para cada valor distinto de ciudad


-- ============================================================
-- EJERCICIO 8: LAG() — acceder al valor de la fila anterior
-- Concepto: comparar cada fila con la fila anterior en el mismo grupo
-- ============================================================

-- Comparar cada venta con la venta anterior del mismo dia en la misma ciudad
-- Util para calcular variaciones dia a dia
SELECT
  fecha,
  ciudad,
  SUM(importe)                                                        AS venta_dia,
  LAG(SUM(importe)) OVER (PARTITION BY ciudad ORDER BY fecha)        AS venta_dia_anterior,
  SUM(importe) - LAG(SUM(importe)) OVER (PARTITION BY ciudad ORDER BY fecha) AS variacion
FROM ventas
GROUP BY fecha, ciudad
ORDER BY ciudad, fecha;

-- LAG devuelve NULL en la primera fila de cada particion (no hay fila anterior)


-- ============================================================
-- EJERCICIO 9: SUM() OVER() — acumulado (running total)
-- Concepto: calcular la suma acumulada dia a dia sin colapsar el resultado
-- ============================================================

-- Acumulado de ventas por ciudad a lo largo del tiempo
SELECT
  fecha,
  ciudad,
  importe,
  SUM(importe) OVER (
    PARTITION BY ciudad     -- acumulado independiente por ciudad
    ORDER BY fecha          -- acumulando en orden cronologico
  ) AS acumulado_ciudad
FROM ventas
ORDER BY ciudad, fecha;

-- Comparacion: SUM sin OVER vs SUM con OVER
-- SUM(importe) GROUP BY ciudad     → devuelve 1 fila por ciudad con el total
-- SUM(importe) OVER (PARTITION BY ciudad ORDER BY fecha) → devuelve TODAS las filas
-- con el acumulado hasta esa fecha
