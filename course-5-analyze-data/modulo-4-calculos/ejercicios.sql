-- ============================================================
-- MODULO 4 — CALCULOS Y CTEs
-- Curso: Google Data Analytics Certificate — Course 5
-- Conceptos: CTEs (WITH), CREATE TEMP TABLE, queries encadenadas
-- Herramienta: BigQuery
-- ============================================================
--
-- Nota sobre ejecucion:
-- Los bloques con CREATE TEMP TABLE deben ejecutarse en orden dentro
-- de la misma sesion de BigQuery. Las CTEs (WITH) son autocontenidas
-- y se pueden ejecutar solas.
-- ============================================================


-- ------------------------------------------------------------
-- SETUP: datos de partida para todos los ejercicios
-- ------------------------------------------------------------

CREATE TEMP TABLE empleados AS
SELECT * FROM UNNEST([
  STRUCT('E001' AS emp_id, 'Ana Torres'    AS nombre, 'Ingenieria' AS departamento, 55000.0  AS salario, DATE '2020-03-15' AS fecha_entrada),
  STRUCT('E002',           'Luis Morales',             'Marketing',                  42000.0,             DATE '2021-06-01'),
  STRUCT('E003',           'Sara Diaz',                'Ingenieria',                 62000.0,             DATE '2019-11-20'),
  STRUCT('E004',           'Pedro Ruiz',               'Marketing',                  38000.0,             DATE '2022-01-10'),
  STRUCT('E005',           'Marta Lopez',              'Ventas',                     47000.0,             DATE '2020-08-05'),
  STRUCT('E006',           'Carlos Vega',              'Ingenieria',                 71000.0,             DATE '2018-04-22'),
  STRUCT('E007',           'Elena Castro',             'Ventas',                     44000.0,             DATE '2021-09-14'),
  STRUCT('E008',           'Jorge Reyes',              'Marketing',                  51000.0,             DATE '2019-07-30')
]);

CREATE TEMP TABLE bonus AS
SELECT * FROM UNNEST([
  STRUCT('E001' AS emp_id, 2024 AS anio, 3000.0 AS importe_bonus),
  STRUCT('E002',           2024,          1500.0),
  STRUCT('E003',           2024,          5000.0),
  STRUCT('E005',           2024,          2000.0),
  STRUCT('E006',           2024,          7500.0)
  -- E004, E007, E008 no tienen bonus en 2024
]);


-- ============================================================
-- EJERCICIO 1: CTE simple
-- Concepto: nombrar una subconsulta para referenciarla despues
-- Mas legible que anidar el SELECT dentro del FROM
-- ============================================================

-- Sin CTE (mas dificil de leer):
SELECT departamento, promedio_salario
FROM (
  SELECT departamento, AVG(salario) AS promedio_salario
  FROM empleados
  GROUP BY departamento
) AS sueldos_por_depto
ORDER BY promedio_salario DESC;

-- Con CTE (exactamente lo mismo, pero legible):
WITH sueldos_por_depto AS (
  SELECT
    departamento,
    AVG(salario) AS promedio_salario
  FROM empleados
  GROUP BY departamento
)

SELECT
  departamento,
  ROUND(promedio_salario, 2) AS promedio_salario
FROM sueldos_por_depto
ORDER BY promedio_salario DESC;


-- ============================================================
-- EJERCICIO 2: CTE para filtrar con un valor calculado
-- Concepto: calcular un umbral en la CTE y usarlo en el SELECT final
-- ============================================================

-- Empleados que cobran por encima del salario promedio de su departamento
WITH promedio_por_depto AS (
  SELECT
    departamento,
    AVG(salario) AS salario_medio_depto
  FROM empleados
  GROUP BY departamento
)

SELECT
  e.nombre,
  e.departamento,
  e.salario,
  ROUND(p.salario_medio_depto, 2) AS media_depto,
  e.salario - p.salario_medio_depto AS diferencia
FROM empleados AS e
INNER JOIN promedio_por_depto AS p
  ON e.departamento = p.departamento
WHERE e.salario > p.salario_medio_depto
ORDER BY diferencia DESC;


-- ============================================================
-- EJERCICIO 3: Multiples CTEs encadenadas
-- Concepto: cada CTE puede referenciar las CTEs definidas antes
-- Permite construir la logica en pasos claros y secuenciales
-- ============================================================

-- Paso 1: calcular antiguedad en anios de cada empleado
-- Paso 2: unir con bonus para ver quien cobra bonus segun antiguedad
-- Paso 3: calcular compensacion total (salario + bonus)

WITH antiguedad AS (
  -- CTE 1: calcular cuantos anios lleva cada empleado
  SELECT
    emp_id,
    nombre,
    departamento,
    salario,
    DATE_DIFF(DATE '2024-12-31', fecha_entrada, YEAR) AS anios_en_empresa
  FROM empleados
),

con_bonus AS (
  -- CTE 2: unir con la tabla de bonus
  -- LEFT JOIN (no INNER JOIN) porque queremos conservar TODOS los empleados,
  -- incluidos los que no tienen bonus en 2024 — con INNER JOIN desaparecerian del resultado
  SELECT
    a.emp_id,
    a.nombre,
    a.departamento,
    a.salario,
    a.anios_en_empresa,
    COALESCE(b.importe_bonus, 0) AS bonus_2024
    -- COALESCE: el LEFT JOIN produce NULL para empleados sin bonus; convertimos NULL a 0
    -- para que el calculo de compensacion_total sea valido (salario + NULL = NULL)
  FROM antiguedad AS a
  LEFT JOIN bonus AS b
    ON a.emp_id = b.emp_id
    AND b.anio = 2024
)

-- SELECT final: usa la segunda CTE para calcular compensacion total
SELECT
  nombre,
  departamento,
  anios_en_empresa,
  salario,
  bonus_2024,
  salario + bonus_2024                                 AS compensacion_total,
  ROUND((bonus_2024 / salario) * 100, 1)              AS bonus_pct_salario
FROM con_bonus
ORDER BY compensacion_total DESC;


-- ============================================================
-- EJERCICIO 4: CTE recursiva simple para generar una secuencia
-- Concepto: caso de uso avanzado — generar series de fechas o numeros
-- ============================================================

-- Generar los ultimos 7 dias como tabla para cruzar con datos
WITH dias AS (
  SELECT DATE '2024-12-25' AS dia
  UNION ALL SELECT DATE '2024-12-26'
  UNION ALL SELECT DATE '2024-12-27'
  UNION ALL SELECT DATE '2024-12-28'
  UNION ALL SELECT DATE '2024-12-29'
  UNION ALL SELECT DATE '2024-12-30'
  UNION ALL SELECT DATE '2024-12-31'
)

SELECT dia, FORMAT_DATE('%A', dia) AS dia_semana
FROM dias
ORDER BY dia;

-- En BigQuery tambien puedes usar GENERATE_DATE_ARRAY:
-- SELECT dia FROM UNNEST(GENERATE_DATE_ARRAY('2024-12-25', '2024-12-31')) AS dia


-- ============================================================
-- EJERCICIO 5: CREATE TEMP TABLE — guardar resultado para reutilizar
-- Concepto: a diferencia de la CTE, la TEMP TABLE persiste durante
-- la sesion y se puede usar en queries separadas
-- ============================================================

-- Crear tabla temporal con empleados de Ingenieria con bonus calculado
CREATE TEMP TABLE ingenieros_con_bonus AS
WITH base AS (
  SELECT
    e.emp_id,
    e.nombre,
    e.salario,
    DATE_DIFF(DATE '2024-12-31', e.fecha_entrada, YEAR) AS antiguedad,
    COALESCE(b.importe_bonus, 0) AS bonus
  FROM empleados AS e
  LEFT JOIN bonus AS b
    ON e.emp_id = b.emp_id
  WHERE e.departamento = 'Ingenieria'
)
SELECT *, salario + bonus AS total FROM base;

-- Una vez creada, se puede consultar en queries separadas en la misma sesion:
SELECT * FROM ingenieros_con_bonus ORDER BY total DESC;

SELECT
  AVG(salario)   AS salario_medio_ingenieria,
  AVG(bonus)     AS bonus_medio_ingenieria,
  COUNT(*)       AS num_ingenieros
FROM ingenieros_con_bonus;


-- ============================================================
-- EJERCICIO 6: Patron completo — CTE + TEMP TABLE encadenadas
-- Concepto: estructura real de un script de analisis en produccion
-- ============================================================

-- Paso 1: tabla temporal con metricas base por departamento
CREATE TEMP TABLE metricas_depto AS
SELECT
  departamento,
  COUNT(*)                                           AS num_empleados,
  ROUND(AVG(salario), 2)                            AS salario_medio,
  SUM(salario)                                       AS masa_salarial,
  MIN(DATE_DIFF(DATE '2024-12-31', fecha_entrada, YEAR)) AS min_antiguedad,
  MAX(DATE_DIFF(DATE '2024-12-31', fecha_entrada, YEAR)) AS max_antiguedad
FROM empleados
GROUP BY departamento;

-- Paso 2: query final que cruza metricas con los bonus pagados
WITH bonus_por_depto AS (
  SELECT
    e.departamento,
    SUM(b.importe_bonus)                              AS total_bonus_pagado,
    COUNT(DISTINCT b.emp_id)                          AS empleados_con_bonus
  FROM empleados AS e
  LEFT JOIN bonus AS b ON e.emp_id = b.emp_id
  GROUP BY e.departamento
)

SELECT
  m.departamento,
  m.num_empleados,
  m.salario_medio,
  m.masa_salarial,
  COALESCE(bd.total_bonus_pagado, 0)               AS total_bonus,
  COALESCE(bd.empleados_con_bonus, 0)              AS con_bonus,
  ROUND(COALESCE(bd.total_bonus_pagado, 0) / m.masa_salarial * 100, 2) AS bonus_pct_masa
FROM metricas_depto AS m
LEFT JOIN bonus_por_depto AS bd
  ON m.departamento = bd.departamento
ORDER BY m.masa_salarial DESC;
