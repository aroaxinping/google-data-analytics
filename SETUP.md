# Cómo replicar este repo desde cero

Guía para reproducir todos los ejercicios y proyectos del certificado.

---

## Herramientas necesarias

| Herramienta | Dónde conseguirla | Para qué curso |
|-------------|-------------------|----------------|
| Google Sheets | sheets.google.com (gratuito) | Course 1, 2, 4 |
| BigQuery | console.cloud.google.com (gratuito con límites) | Course 3, 4, 5 |
| Kaggle account | kaggle.com (gratuito) | Course 3 |
| R + RStudio | posit.co/download/rstudio-desktop | Course 7, 8 |
| Tableau Public | public.tableau.com/downloads (gratuito) | Course 6 |

---

## Datasets

Ningún dataset está incluido en el repo por tamaño. Descárgalos aquí:

| Dataset | URL | Usado en |
|---------|-----|----------|
| Netflix Movies & TV Shows | https://www.kaggle.com/datasets/shivamb/netflix-shows | Course 5, 6, 7 |
| Messy E-Commerce Sales | https://www.kaggle.com/datasets/kandeelai22/messy-e-commerce-sales-dataset | Course 4 |
| Animal Crossing NHNH | https://www.kaggle.com/datasets/jessicali9530/animal-crossing-new-horizons-nookplaza-dataset | Course 3 |
| Divvy Bikes Trip Data | https://divvy-tripdata.s3.amazonaws.com/index.html | Course 8 |
| Chicago Taxi Trips | BigQuery Public → `bigquery-public-data.chicago_taxi_trips` | Course 3 |

---

## Course 3 — BigQuery

1. Crear cuenta en [Google Cloud](https://console.cloud.google.com) (gratuito)
2. Crear un proyecto nuevo
3. Ir a BigQuery > SQL Workspace
4. En el panel izquierdo buscar `bigquery-public-data`
5. Ejecutar las queries del archivo `actividad-bigquery/README.md`

Para el dataset de taxis de Chicago ya está disponible en BigQuery sin
necesidad de descargarlo: `bigquery-public-data.chicago_taxi_trips.taxi_trips`

---

## Course 4 — Limpieza SQL

1. Descarga el dataset de Kaggle (enlace arriba)
2. En BigQuery: crear dataset → `Data > Import` → subir el CSV
3. Actualiza el nombre del proyecto/dataset en las queries:
   ```sql
   -- Cambia esto:
   FROM `proyecto.dataset.ecommerce_ventas`
   -- Por el nombre real de tu proyecto y dataset en BigQuery
   ```
4. Ejecuta `limpieza.sql` paso a paso (los 4 pasos en orden)

---

## Course 5 — Análisis SQL

Mismos pasos que Course 4 pero con el dataset de Netflix.

1. Descarga `netflix_titles.csv` de Kaggle
2. Súbelo a BigQuery
3. Actualiza el nombre del proyecto en `analisis-netflix.sql`
4. Ejecuta las queries en orden

---

## Course 7 — R Markdown

```bash
# 1. Clonar el repo
git clone https://github.com/aroaxinping/google-data-analytics.git

# 2. Ir a la carpeta
cd google-data-analytics/course-7-r-programming/proyecto-r/

# 3. Descargar netflix_titles.csv de Kaggle y colocarlo aquí

# 4. Abrir RStudio y ejecutar setup.R primero
source("setup.R")

# 5. Abrir analisis-netflix.Rmd y hacer clic en Knit
```

El output generado (`analisis-netflix.html`) no está en el repo porque
se genera localmente. Está en `.gitignore`.

---

## Course 8 — Capstone Cyclistic

```bash
# 1. Ir a la carpeta
cd google-data-analytics/course-8-capstone/cyclistic-case-study/

# 2. Ejecutar setup.R — crea la carpeta data/ e instala paquetes
source("setup.R")

# 3. Descargar los 12 CSV de Divvy del año elegido y colocarlos en data/

# 4. En cyclistic-analysis.Rmd:
#   - Cambiar eval=FALSE a eval=TRUE en el bloque "carga-datos"
#   - Cambiar include=FALSE a eval=FALSE en el bloque "simular-datos"

# 5. Knit → genera el case study completo en HTML
```

> Los CSV de Divvy pesan ~1GB en total y están en `.gitignore`.
> El `.Rmd` incluye un bloque de simulación de datos para que se pueda
> visualizar sin descargar los datos reales.

---

## Course 6 — Tableau

El diseño del dashboard está documentado en `proyecto-tableau/README.md`.
Para construirlo:
1. Descargar Tableau Public Desktop (gratuito)
2. Conectar el CSV de Netflix como fuente de datos
3. Seguir el diseño documentado (vistas, paleta, filtros)
