-- ============================================================
-- SQL BASICO — Course 3: Prepare Data for Exploration
-- Herramienta: BigQuery
-- Conceptos: SELECT, FROM, WHERE, ORDER BY, LIMIT, funciones de agregacion
-- ============================================================
--
-- Estos ejercicios usan una tabla temporal autocontenida.
-- Para trabajar con datos reales, sustituye la tabla temporal por:
-- FROM `bigquery-public-data.new_york_citibike.citibike_trips`
-- ============================================================


-- ------------------------------------------------------------
-- SETUP: tabla temporal con empleados de una empresa
-- Ejecuta este bloque primero
-- ------------------------------------------------------------

CREATE TEMP TABLE empleados AS
SELECT * FROM UNNEST([
  STRUCT('E001' AS emp_id, 'Ana Torres'    AS nombre, 'Ingenieria' AS departamento, 55000 AS salario, 2020 AS anio_entrada, 'Madrid'     AS ciudad),
  STRUCT('E002',           'Luis Morales',             'Marketing',                  42000,             2021,               'Barcelona'),
  STRUCT('E003',           'Sara Diaz',                'Ingenieria',                 62000,             2019,               'Madrid'),
  STRUCT('E004',           'Pedro Ruiz',               'Marketing',                  38000,             2022,               'Sevilla'),
  STRUCT('E005',           'Marta Lopez',              'Ventas',                     47000,             2020,               'Madrid'),
  STRUCT('E006',           'Carlos Vega',              'Ingenieria',                 71000,             2018,               'Barcelona'),
  STRUCT('E007',           'Elena Castro',             'Ventas',                     44000,             2021,               'Sevilla'),
  STRUCT('E008',           'Jorge Reyes',              'Marketing',                  51000,             2019,               'Madrid')
]);


-- ============================================================
-- EJERCICIO 1: SELECT * — ver todas las columnas
-- Concepto: la forma mas basica de explorar una tabla nueva
-- ============================================================

SELECT *
FROM empleados;

-- Con LIMIT: util para tablas grandes, solo ver los primeros registros
SELECT *
FROM empleados
LIMIT 3;


-- ============================================================
-- EJERCICIO 2: SELECT con columnas especificas
-- Concepto: elegir solo las columnas que necesitas (buena practica)
-- ============================================================

-- Solo nombre, departamento y salario
SELECT
  nombre,
  departamento,
  salario
FROM empleados;


-- ============================================================
-- EJERCICIO 3: AS — alias para renombrar columnas
-- Concepto: el alias cambia el nombre en el resultado, no en la tabla
-- ============================================================

SELECT
  nombre               AS nombre_empleado,
  departamento         AS area,
  salario              AS salario_anual_eur,
  anio_entrada         AS desde
FROM empleados;


-- ============================================================
-- EJERCICIO 4: WHERE — filtrar filas por condicion
-- Concepto: WHERE se aplica antes de devolver resultados
-- ============================================================

-- Solo empleados de Ingenieria
SELECT nombre, salario, ciudad
FROM empleados
WHERE departamento = 'Ingenieria';

-- Solo empleados con salario superior a 50000
SELECT nombre, departamento, salario
FROM empleados
WHERE salario > 50000;

-- Solo empleados de Madrid
SELECT nombre, departamento, salario
FROM empleados
WHERE ciudad = 'Madrid';


-- ============================================================
-- EJERCICIO 5: WHERE con texto — operador LIKE para buscar patrones
-- Concepto: % es comodin (cualquier cantidad de caracteres)
-- ============================================================

-- Empleados cuyo nombre empieza por 'M'
SELECT nombre, departamento
FROM empleados
WHERE nombre LIKE 'M%';

-- Empleados cuyo nombre contiene 'ar' en cualquier posicion
SELECT nombre
FROM empleados
WHERE nombre LIKE '%ar%';


-- ============================================================
-- EJERCICIO 6: ORDER BY — ordenar resultados
-- Concepto: ASC es el orden por defecto (ascendente)
-- ============================================================

-- Ordenar por salario de mayor a menor
SELECT nombre, departamento, salario
FROM empleados
ORDER BY salario DESC;

-- Ordenar por departamento alfabeticamente, luego por salario descendente
SELECT nombre, departamento, salario
FROM empleados
ORDER BY departamento ASC, salario DESC;


-- ============================================================
-- EJERCICIO 7: WHERE + ORDER BY + LIMIT combinados
-- Concepto: el orden de clausulas en SQL es siempre
-- SELECT → FROM → WHERE → ORDER BY → LIMIT
-- ============================================================

-- Los 3 empleados de Madrid con mayor salario
SELECT
  nombre,
  departamento,
  salario,
  ciudad
FROM empleados
WHERE ciudad = 'Madrid'
ORDER BY salario DESC
LIMIT 3;


-- ============================================================
-- EJERCICIO 8: COUNT(*) — contar filas
-- Concepto: funcion de agregacion que cuenta cuantas filas hay
-- ============================================================

-- Total de empleados en la tabla
SELECT COUNT(*) AS total_empleados
FROM empleados;

-- Cuantos empleados hay en Ingenieria
SELECT COUNT(*) AS ingenieros
FROM empleados
WHERE departamento = 'Ingenieria';


-- ============================================================
-- EJERCICIO 9: SUM, AVG, MAX, MIN — otras funciones de agregacion
-- Concepto: calculan un valor unico a partir de una columna entera
-- ============================================================

-- Estadisticas de salario de toda la empresa
SELECT
  COUNT(*)        AS num_empleados,
  SUM(salario)    AS masa_salarial,
  AVG(salario)    AS salario_medio,
  MAX(salario)    AS salario_maximo,
  MIN(salario)    AS salario_minimo
FROM empleados;

-- Las mismas estadisticas pero solo para el departamento de Ventas
SELECT
  COUNT(*)        AS num_empleados,
  AVG(salario)    AS salario_medio_ventas,
  MAX(salario)    AS salario_max_ventas
FROM empleados
WHERE departamento = 'Ventas';

-- Nota: para calcular estas estadisticas POR departamento (no solo para uno)
-- se necesita GROUP BY, que se cubre en el Course 5.
