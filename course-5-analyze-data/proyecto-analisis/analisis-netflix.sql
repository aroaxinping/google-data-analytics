-- ============================================================
-- ANÁLISIS DE NETFLIX — Netflix Movies and TV Shows
-- Curso: Google Data Analytics Certificate — Course 5
-- Herramienta: BigQuery (Google Cloud)
-- Dataset: proyecto.dataset.netflix_titles
-- Fuente: https://www.kaggle.com/datasets/shivamb/netflix-shows
-- ============================================================


-- ------------------------------------------------------------
-- 1. Películas vs Series
-- ------------------------------------------------------------

SELECT
  type,
  COUNT(*) AS total,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS porcentaje
FROM `proyecto.dataset.netflix_titles`
GROUP BY type
ORDER BY total DESC;


-- ------------------------------------------------------------
-- 2. Top 10 países productores
-- (maneja celdas con múltiples países separados por coma)
-- ------------------------------------------------------------

SELECT
  TRIM(country_split) AS country,
  COUNT(*) AS titulos
FROM `proyecto.dataset.netflix_titles`,
  UNNEST(SPLIT(country, ', ')) AS country_split
WHERE country IS NOT NULL
  AND TRIM(country_split) != ''
GROUP BY country
ORDER BY titulos DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 3. Crecimiento del catálogo por año (con total acumulado)
-- ------------------------------------------------------------

SELECT
  EXTRACT(YEAR FROM PARSE_DATE('%B %d, %Y', date_added)) AS anio,
  COUNT(*) AS titulos_ese_anio,
  SUM(COUNT(*)) OVER (
    ORDER BY EXTRACT(YEAR FROM PARSE_DATE('%B %d, %Y', date_added))
  ) AS total_acumulado
FROM `proyecto.dataset.netflix_titles`
WHERE date_added IS NOT NULL
GROUP BY anio
ORDER BY anio;


-- ------------------------------------------------------------
-- 4. Géneros más frecuentes
-- (cada título puede tener varios géneros separados por coma)
-- ------------------------------------------------------------

SELECT
  TRIM(genero) AS genero,
  COUNT(*) AS apariciones
FROM `proyecto.dataset.netflix_titles`,
  UNNEST(SPLIT(listed_in, ', ')) AS genero
WHERE listed_in IS NOT NULL
GROUP BY genero
ORDER BY apariciones DESC
LIMIT 15;


-- ------------------------------------------------------------
-- 5. Clasificación de edad más frecuente
-- ------------------------------------------------------------

SELECT
  rating,
  COUNT(*) AS total,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS porcentaje
FROM `proyecto.dataset.netflix_titles`
WHERE rating IS NOT NULL
  AND rating NOT IN ('74 min', '84 min', '66 min')  -- errores de datos
GROUP BY rating
ORDER BY total DESC;


-- ------------------------------------------------------------
-- 6. Duración media de películas
-- ------------------------------------------------------------

SELECT
  ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS INT64)), 0) AS media_minutos,
  MIN(CAST(REPLACE(duration, ' min', '') AS INT64))           AS minimo,
  MAX(CAST(REPLACE(duration, ' min', '') AS INT64))           AS maximo,
  COUNT(*) AS total_peliculas
FROM `proyecto.dataset.netflix_titles`
WHERE type = 'Movie'
  AND duration LIKE '%min%';


-- ------------------------------------------------------------
-- 7. Query combinada para dashboard (tipo + año)
-- ------------------------------------------------------------

SELECT
  type,
  EXTRACT(YEAR FROM PARSE_DATE('%B %d, %Y', date_added)) AS anio,
  COUNT(*) AS titulos
FROM `proyecto.dataset.netflix_titles`
WHERE date_added IS NOT NULL
GROUP BY type, anio
ORDER BY anio, type;
