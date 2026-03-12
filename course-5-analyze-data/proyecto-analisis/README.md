# Ejercicio: Análisis de Netflix con SQL

**Curso:** Course 5 — Analyze Data to Answer Questions
**Dataset:** Netflix Movies and TV Shows (Kaggle — CC0 Public Domain)
**Herramienta:** SQL (BigQuery)

> El mismo dataset del Course 3 (Kaggle activity), ahora analizado a fondo
> con SQL. Tener contexto previo sobre los datos acelera mucho el análisis.

---

El Course 5 es donde el SQL deja de ser "extraer datos" y se convierte en
"responder preguntas". La diferencia más grande con el Course 3: las funciones
de ventana (`OVER`). La primera vez que vi `SUM(COUNT(*)) OVER (ORDER BY year)`
pensé que me había saltado algo importante. Cuando entendí que es "calcula este
valor considerando todas las filas, no solo el grupo actual"... eso cambia lo
que puedes hacer.

## Preguntas que respondo

1. ¿Películas o series dominan el catálogo?
2. ¿Qué países producen más contenido?
3. ¿Cómo ha crecido el catálogo año a año?
4. ¿Cuáles son los géneros más frecuentes?
5. ¿Cuánto duran de media las películas?

---

## Las queries

### Películas vs Series

```sql
SELECT
  type,
  COUNT(*) AS total,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS porcentaje
FROM `proyecto.dataset.netflix_titles`
GROUP BY type
ORDER BY total DESC;
```

**Resultado:** 69.6% películas, 30.4% series.

`SUM(COUNT(*)) OVER ()` — esta es la función de ventana. Sin `OVER()`, cada
fila solo sabe su propio COUNT. Con `OVER()`, cada fila también sabe el total
global, lo que permite calcular porcentajes en una sola query.

### Top 10 países

```sql
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
```

`UNNEST(SPLIT(...))` — divide los valores separados por coma en filas
independientes. Necesario porque muchos títulos tienen múltiples países
de producción en la misma celda.

### Crecimiento año a año (con acumulado)

```sql
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
```

### Géneros más frecuentes

```sql
SELECT
  TRIM(genero) AS genero,
  COUNT(*) AS apariciones
FROM `proyecto.dataset.netflix_titles`,
UNNEST(SPLIT(listed_in, ', ')) AS genero
GROUP BY genero
ORDER BY apariciones DESC
LIMIT 12;
```

### Duración media de películas

```sql
SELECT
  ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS INT64)), 0) AS media_minutos,
  MIN(CAST(REPLACE(duration, ' min', '') AS INT64))           AS minimo,
  MAX(CAST(REPLACE(duration, ' min', '') AS INT64))           AS maximo
FROM `proyecto.dataset.netflix_titles`
WHERE type = 'Movie'
  AND duration LIKE '%min%';
```

---

## Hallazgos

| Pregunta | Respuesta |
|----------|-----------|
| ¿Películas o series? | 69.6% películas, 30.4% series |
| País que más produce | Estados Unidos (3,690 títulos) |
| Año de mayor crecimiento | 2019 |
| Género más frecuente | International Movies |
| Duración media de películas | ~99 minutos |

---

## Lo que aprendí sobre funciones de ventana

Las funciones de ventana (`OVER`) son lo más potente que aprendí en este curso.
Permiten calcular agregaciones sin colapsar las filas — puedes tener en la
misma fila tanto el dato individual como el total, el acumulado o el ranking.

Equivalente en Sheets: no hay. Ahí tendrías que hacer dos pasos separados.
En SQL lo puedes hacer en una sola query.
