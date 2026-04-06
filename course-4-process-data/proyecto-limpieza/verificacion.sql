-- ============================================================
-- VERIFICACION DE CALIDAD — Post-limpieza
-- Curso: Google Data Analytics Certificate — Course 4
-- Dataset: proyecto.dataset.ecommerce_ventas_limpio
-- ============================================================
--
-- Estas queries se ejecutan DESPUES de limpieza.sql para confirmar
-- que la tabla resultante cumple los criterios de calidad esperados.
-- Cada bloque verifica un problema distinto del dataset original.
-- Si alguna query devuelve filas, hay un problema pendiente de corregir.
-- ============================================================


-- ------------------------------------------------------------
-- VERIFICACION 1: Contar filas antes vs despues
-- Objetivo: confirmar cuantos registros se eliminaron en la limpieza
-- y que la reduccion es coherente con los problemas detectados
-- ------------------------------------------------------------

SELECT
  'original' AS tabla,
  COUNT(*)   AS total_filas
FROM `proyecto.dataset.ecommerce_ventas`

UNION ALL

SELECT
  'limpio'  AS tabla,
  COUNT(*) AS total_filas
FROM `proyecto.dataset.ecommerce_ventas_limpio`;

-- Interpretacion: la diferencia deberia corresponder a los duplicados
-- y registros con datos invalidos eliminados en el paso 3 de limpieza.sql


-- ------------------------------------------------------------
-- VERIFICACION 2: Confirmar que no quedan duplicados
-- Objetivo: la columna order_id debe ser unica en la tabla limpia
-- Resultado esperado: 0 filas
-- ------------------------------------------------------------

SELECT
  order_id,
  COUNT(*) AS veces
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Si esta query devuelve filas, hay order_ids duplicados todavia.


-- ------------------------------------------------------------
-- VERIFICACION 3: Confirmar que no quedan valores nulos criticos
-- Objetivo: los campos obligatorios (order_id, order_date, sale_price)
-- no deben tener NULLs en la tabla limpia
-- Resultado esperado: todos los contadores en 0
-- ------------------------------------------------------------

SELECT
  COUNTIF(order_id IS NULL)    AS nulos_order_id,
  COUNTIF(order_date IS NULL)  AS nulos_order_date,
  COUNTIF(sale_price IS NULL)  AS nulos_sale_price,
  COUNTIF(customer_name IS NULL) AS nulos_customer_name,
  COUNTIF(category IS NULL)    AS nulos_category,
  COUNTIF(region IS NULL)      AS nulos_region
FROM `proyecto.dataset.ecommerce_ventas_limpio`;

-- Si alguna columna obligatoria tiene nulos, revisar el WHERE del paso 3.


-- ------------------------------------------------------------
-- VERIFICACION 4: Confirmar que no quedan precios invalidos
-- Objetivo: sale_price debe ser positivo en todos los registros
-- Resultado esperado: 0 filas
-- ------------------------------------------------------------

SELECT
  order_id,
  sale_price
FROM `proyecto.dataset.ecommerce_ventas_limpio`
WHERE sale_price <= 0
   OR sale_price IS NULL;

-- Adicionalmente, revisar si hay valores extremos (posibles errores)
SELECT
  MIN(sale_price)              AS precio_minimo,
  MAX(sale_price)              AS precio_maximo,
  AVG(sale_price)              AS precio_medio,
  COUNTIF(sale_price > 10000)  AS precios_muy_altos   -- ajustar umbral segun el negocio
FROM `proyecto.dataset.ecommerce_ventas_limpio`;


-- ------------------------------------------------------------
-- VERIFICACION 5: Confirmar que las categorias son consistentes
-- Objetivo: no deben existir variantes de la misma categoria
-- (ej. 'electronics', 'Electronics', 'ELECTRONICS' deben ser una sola)
-- ------------------------------------------------------------

SELECT
  category,
  COUNT(*) AS n
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY category
ORDER BY n DESC;

-- Revision manual: si ves la misma categoria escrita de formas distintas,
-- el LOWER() del paso 3 no fue suficiente y hay que anadir mas normalizacion.


-- ------------------------------------------------------------
-- VERIFICACION 6: Confirmar que las regiones son consistentes
-- Objetivo: region se estandarizo con UPPER() — no debe haber minusculas
-- ------------------------------------------------------------

SELECT
  region,
  COUNT(*) AS n
FROM `proyecto.dataset.ecommerce_ventas_limpio`
GROUP BY region
ORDER BY region;


-- ------------------------------------------------------------
-- VERIFICACION 7: Confirmar que las fechas son coherentes
-- Objetivo: no debe haber fechas en el futuro ni fechas muy antiguas
-- (fuera del rango esperado del dataset)
-- ------------------------------------------------------------

SELECT
  MIN(order_date) AS fecha_mas_antigua,
  MAX(order_date) AS fecha_mas_reciente,
  COUNTIF(order_date > CURRENT_DATE()) AS fechas_en_el_futuro
FROM `proyecto.dataset.ecommerce_ventas_limpio`;

-- Si hay fechas en el futuro o fuera del rango esperado, el PARSE_DATE
-- del paso 3 puede haber convertido fechas mal formateadas incorrectamente.


-- ------------------------------------------------------------
-- VERIFICACION 8: Confirmar que no quedan espacios en customer_name
-- Objetivo: TRIM() e INITCAP() se aplicaron correctamente
-- Resultado esperado: 0 filas con espacios al inicio o al final
-- ------------------------------------------------------------

SELECT
  order_id,
  customer_name
FROM `proyecto.dataset.ecommerce_ventas_limpio`
WHERE customer_name != TRIM(customer_name)
   OR customer_name != INITCAP(customer_name);


-- ------------------------------------------------------------
-- RESUMEN EJECUTIVO: una sola query con todos los checks
-- Para monitoreo rapido — todos los valores deben ser 0
-- ------------------------------------------------------------

SELECT
  (SELECT COUNT(*) FROM `proyecto.dataset.ecommerce_ventas_limpio`
   WHERE order_id IS NULL)                    AS nulos_order_id,

  (SELECT COUNT(*) FROM (
     SELECT order_id FROM `proyecto.dataset.ecommerce_ventas_limpio`
     GROUP BY order_id HAVING COUNT(*) > 1))  AS duplicados,

  (SELECT COUNT(*) FROM `proyecto.dataset.ecommerce_ventas_limpio`
   WHERE sale_price <= 0 OR sale_price IS NULL) AS precios_invalidos,

  (SELECT COUNT(*) FROM `proyecto.dataset.ecommerce_ventas_limpio`
   WHERE order_date > CURRENT_DATE())          AS fechas_futuras;
