-- ============================================================
-- LIMPIEZA DE DATOS — E-Commerce Sales Dataset
-- Curso: Google Data Analytics Certificate — Course 4
-- Herramienta: BigQuery (Google Cloud)
-- Dataset: proyecto.dataset.ecommerce_ventas
-- ============================================================


-- ------------------------------------------------------------
-- PASO 1: Inspección inicial
-- ------------------------------------------------------------

-- Total de filas
SELECT COUNT(*) AS total_filas
FROM `proyecto.dataset.ecommerce_ventas`;

-- Muestra de los datos
SELECT *
FROM `proyecto.dataset.ecommerce_ventas`
LIMIT 10;

-- Contar nulos por columna
SELECT
  COUNTIF(order_id IS NULL)       AS nulos_order_id,
  COUNTIF(customer_name IS NULL)  AS nulos_customer_name,
  COUNTIF(order_date IS NULL)     AS nulos_order_date,
  COUNTIF(category IS NULL)       AS nulos_category,
  COUNTIF(sale_price IS NULL)     AS nulos_sale_price,
  COUNTIF(region IS NULL)         AS nulos_region
FROM `proyecto.dataset.ecommerce_ventas`;


-- ------------------------------------------------------------
-- PASO 2: Detectar duplicados
-- ------------------------------------------------------------

-- Ver order_ids repetidos
SELECT
  order_id,
  COUNT(*) AS veces
FROM `proyecto.dataset.ecommerce_ventas`
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY veces DESC;

-- Ver las filas duplicadas completas
SELECT *
FROM `proyecto.dataset.ecommerce_ventas`
WHERE order_id IN (
  SELECT order_id
  FROM `proyecto.dataset.ecommerce_ventas`
  GROUP BY order_id
  HAVING COUNT(*) > 1
)
ORDER BY order_id;


-- ------------------------------------------------------------
-- PASO 3: Crear tabla limpia
-- ------------------------------------------------------------

CREATE OR REPLACE TABLE `proyecto.dataset.ecommerce_ventas_limpio` AS

WITH sin_duplicados AS (
  SELECT *
  FROM (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_date) AS fila_num
    FROM `proyecto.dataset.ecommerce_ventas`
  )
  WHERE fila_num = 1
)

SELECT
  order_id,
  INITCAP(TRIM(customer_name))        AS customer_name,
  PARSE_DATE('%d/%m/%Y', order_date)  AS order_date,
  LOWER(TRIM(category))               AS category,
  UPPER(TRIM(region))                 AS region,
  CASE
    WHEN sale_price > 0 THEN sale_price
    ELSE NULL
  END                                 AS sale_price,
  quantity,
  country
FROM sin_duplicados
WHERE order_id IS NOT NULL
  AND order_date IS NOT NULL
  AND sale_price > 0;


-- ------------------------------------------------------------
-- PASO 4: Verificar resultado
-- ------------------------------------------------------------

-- Antes vs despues
SELECT 'antes'   AS estado, COUNT(*) AS filas FROM `proyecto.dataset.ecommerce_ventas`
UNION ALL
SELECT 'despues' AS estado, COUNT(*) AS filas FROM `proyecto.dataset.ecommerce_ventas_limpio`;

-- Confirmar que no quedan duplicados
SELECT order_id, COUNT(*) AS veces
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Confirmar precios validos
SELECT
  MIN(sale_price)              AS precio_minimo,
  MAX(sale_price)              AS precio_maximo,
  COUNTIF(sale_price IS NULL)  AS precios_nulos
FROM `proyecto.dataset.ecommerce_ventas_limpio`;

-- Confirmar categorias consistentes
SELECT
  category,
  COUNT(*) AS n
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY category
ORDER BY n DESC;
