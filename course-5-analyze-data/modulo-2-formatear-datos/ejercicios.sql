-- ============================================================
-- MODULO 2 — FORMATEAR DATOS
-- Curso: Google Data Analytics Certificate — Course 5
-- Conceptos: CAST, SAFE_CAST, fechas, INNER/LEFT/RIGHT/FULL OUTER JOIN
-- Herramienta: BigQuery
-- ============================================================


-- ------------------------------------------------------------
-- SETUP: tablas temporales para los ejercicios de CAST y fechas
-- ------------------------------------------------------------

-- Tabla con datos mal tipados (como llegan frecuentemente de CSVs)
CREATE TEMP TABLE pedidos_raw AS
SELECT * FROM UNNEST([
  STRUCT('P001' AS pedido_id, '2024-03-01' AS fecha_texto, '150.50'  AS monto_texto, '3'  AS cantidad_texto),
  STRUCT('P002',              '2024-03-05', '80.00',                                  '1'),
  STRUCT('P003',              '2024-03-10', '220.75',                                 '5'),
  STRUCT('P004',              '2024-03-15', 'error',                                  '2'),  -- monto invalido
  STRUCT('P005',              '2024-03-20', '95.00',                                  '4')
]);

-- Tabla de clientes (para los JOINs)
CREATE TEMP TABLE clientes AS
SELECT * FROM UNNEST([
  STRUCT('C001' AS cliente_id, 'Ana Torres'    AS nombre, 'Madrid'     AS ciudad),
  STRUCT('C002',               'Luis Morales',             'Barcelona'),
  STRUCT('C003',               'Sara Diaz',                'Sevilla'),
  STRUCT('C004',               'Pedro Ruiz',               'Madrid')
]);

-- Tabla de pedidos con cliente_id (algunos clientes no tienen pedidos,
-- algunos pedidos no tienen cliente valido)
CREATE TEMP TABLE pedidos AS
SELECT * FROM UNNEST([
  STRUCT('P001' AS pedido_id, 'C001' AS cliente_id, DATE '2024-03-01' AS fecha_pedido, 150.50 AS monto),
  STRUCT('P002',              'C002',               DATE '2024-03-05', 80.00),
  STRUCT('P003',              'C001',               DATE '2024-03-10', 220.75),
  STRUCT('P004',              'C099',               DATE '2024-03-15', 95.00),  -- cliente no existe
  STRUCT('P005',              'C003',               DATE '2024-03-20', 60.00)
  -- C004 (Pedro Ruiz) no tiene ningun pedido
]);


-- ============================================================
-- EJERCICIO 1: CAST — convertir tipos de datos
-- Concepto: cambiar el tipo de una columna para poder operar con ella
-- ============================================================

-- Convertir texto a numero para poder calcular
SELECT
  pedido_id,
  monto_texto,
  CAST(monto_texto AS FLOAT64)   AS monto_numero,
  cantidad_texto,
  CAST(cantidad_texto AS INT64)  AS cantidad_numero,
  -- Calcular total multiplicando (solo posible despues del CAST)
  CAST(monto_texto AS FLOAT64) * CAST(cantidad_texto AS INT64) AS total
FROM pedidos_raw
WHERE monto_texto != 'error';  -- excluimos el valor invalido primero

-- Convertir texto a DATE
SELECT
  pedido_id,
  fecha_texto,
  CAST(fecha_texto AS DATE) AS fecha_date
FROM pedidos_raw;


-- ============================================================
-- EJERCICIO 2: SAFE_CAST — conversion segura que no rompe la query
-- Concepto: devuelve NULL en lugar de error cuando el valor no se puede convertir
-- ============================================================

-- Con CAST normal, la fila 'error' romperia la query entera
-- SAFE_CAST devuelve NULL para esa fila y continua con el resto
SELECT
  pedido_id,
  monto_texto,
  SAFE_CAST(monto_texto AS FLOAT64)  AS monto_numero,  -- 'error' devuelve NULL
  cantidad_texto,
  SAFE_CAST(cantidad_texto AS INT64) AS cantidad_numero
FROM pedidos_raw;

-- Util para detectar cuantos valores no se pueden convertir
SELECT
  COUNTIF(SAFE_CAST(monto_texto AS FLOAT64) IS NULL) AS montos_invalidos,
  COUNT(*) AS total_filas
FROM pedidos_raw;


-- ============================================================
-- EJERCICIO 3: EXTRACT — sacar partes de una fecha
-- Concepto: extraer el ano, mes, dia, hora o dia de la semana de una columna DATE
-- ============================================================

SELECT
  pedido_id,
  fecha_pedido,
  EXTRACT(YEAR        FROM fecha_pedido)  AS anio,
  EXTRACT(MONTH       FROM fecha_pedido)  AS mes,
  EXTRACT(DAY         FROM fecha_pedido)  AS dia,
  EXTRACT(DAYOFWEEK   FROM fecha_pedido)  AS dia_semana  -- 1=domingo, 7=sabado en BigQuery
FROM pedidos
ORDER BY fecha_pedido;

-- Agrupar pedidos por mes (combinacion con GROUP BY del modulo 3)
SELECT
  EXTRACT(MONTH FROM fecha_pedido) AS mes,
  COUNT(*)                          AS total_pedidos,
  SUM(monto)                        AS total_ventas
FROM pedidos
GROUP BY mes
ORDER BY mes;


-- ============================================================
-- EJERCICIO 4: FORMAT_DATE — formatear fecha como texto legible
-- Concepto: presentar fechas en el formato que el usuario final necesita
-- ============================================================

SELECT
  pedido_id,
  fecha_pedido,
  FORMAT_DATE('%d/%m/%Y',       fecha_pedido)  AS formato_europeo,   -- 01/03/2024
  FORMAT_DATE('%B %d, %Y',      fecha_pedido)  AS formato_largo,     -- March 01, 2024
  FORMAT_DATE('%Y-%m',          fecha_pedido)  AS anio_mes           -- 2024-03
FROM pedidos;

-- Nota: FORMAT_DATE devuelve texto (STRING), no DATE.
-- Si necesitas operar con la fecha despues, usa EXTRACT en lugar de FORMAT_DATE.


-- ============================================================
-- EJERCICIO 5: DATE_DIFF — diferencia entre dos fechas
-- Concepto: calcular cuantos dias, meses o anos separan dos fechas
-- ============================================================

SELECT
  pedido_id,
  fecha_pedido,
  DATE_DIFF(DATE '2024-04-01', fecha_pedido, DAY)   AS dias_transcurridos,
  DATE_DIFF(DATE '2024-04-01', fecha_pedido, MONTH)  AS meses_transcurridos
FROM pedidos
ORDER BY dias_transcurridos DESC;


-- ============================================================
-- EJERCICIO 6: INNER JOIN — solo filas con coincidencia en ambas tablas
-- Concepto: combina filas donde la clave existe en las dos tablas
-- Resultado: 4 filas (P004 se excluye porque C099 no existe en clientes;
--            C004 se excluye porque no tiene pedidos)
-- ============================================================

SELECT
  p.pedido_id,
  c.nombre      AS cliente,
  c.ciudad,
  p.fecha_pedido,
  p.monto
FROM pedidos AS p
INNER JOIN clientes AS c
  ON p.cliente_id = c.cliente_id
ORDER BY p.fecha_pedido;


-- ============================================================
-- EJERCICIO 7: LEFT JOIN — todas las filas de la izquierda
-- Concepto: conserva TODOS los pedidos aunque no tengan cliente valido
-- Resultado: 5 filas (P004 aparece con NULLs en las columnas de cliente)
-- ============================================================

SELECT
  p.pedido_id,
  p.cliente_id,
  c.nombre      AS cliente,     -- NULL si no hay coincidencia
  c.ciudad,                     -- NULL si no hay coincidencia
  p.monto
FROM pedidos AS p
LEFT JOIN clientes AS c
  ON p.cliente_id = c.cliente_id
ORDER BY p.pedido_id;

-- Cuantos pedidos no tienen cliente valido:
SELECT
  COUNT(*) AS pedidos_sin_cliente
FROM pedidos AS p
LEFT JOIN clientes AS c
  ON p.cliente_id = c.cliente_id
WHERE c.cliente_id IS NULL;


-- ============================================================
-- EJERCICIO 8: RIGHT JOIN — todas las filas de la derecha
-- Concepto: conserva TODOS los clientes aunque no tengan pedidos
-- Resultado: 5 filas (C004 Pedro Ruiz aparece con NULLs en pedidos)
-- ============================================================

SELECT
  c.cliente_id,
  c.nombre,
  c.ciudad,
  p.pedido_id,   -- NULL si el cliente no tiene pedidos
  p.monto        -- NULL si el cliente no tiene pedidos
FROM pedidos AS p
RIGHT JOIN clientes AS c
  ON p.cliente_id = c.cliente_id
ORDER BY c.cliente_id;

-- Nota: RIGHT JOIN es equivalente a invertir el orden de las tablas y usar LEFT JOIN.
-- En la practica, LEFT JOIN es mas comun — el orden de las tablas en la query
-- refleja mejor la logica del analisis.


-- ============================================================
-- EJERCICIO 9: FULL OUTER JOIN — todas las filas de ambas tablas
-- Concepto: no se excluye ninguna fila de ninguna de las dos tablas
-- Resultado: 6 filas (5 pedidos + C004 que no tiene pedido)
-- Filas sin coincidencia tienen NULL en las columnas de la otra tabla
-- ============================================================

SELECT
  c.cliente_id,
  c.nombre,
  p.pedido_id,
  p.monto
FROM pedidos AS p
FULL OUTER JOIN clientes AS c
  ON p.cliente_id = c.cliente_id
ORDER BY c.cliente_id, p.pedido_id;

-- Util para auditar: ver tanto registros huerfanos de un lado como del otro
