# ============================================================
# SETUP — Cyclistic Case Study
# Ejecutar este archivo UNA VEZ antes de abrir el .Rmd
# ============================================================

# 1. Instalar paquetes necesarios
paquetes <- c("tidyverse", "lubridate", "scales", "ggthemes", "knitr")

instalar_si_falta <- function(pkg) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    install.packages(pkg)
    message(paste("Instalado:", pkg))
  } else {
    message(paste("Ya instalado:", pkg))
  }
}

invisible(sapply(paquetes, instalar_si_falta))

# 2. Crear carpeta de datos si no existe
if (!dir.exists("data")) {
  dir.create("data")
  message("Carpeta 'data/' creada.")
}

message("
✅ Setup completado. Pasos siguientes para el análisis REAL con datos de Divvy:

1. Ve a: https://divvy-tripdata.s3.amazonaws.com/index.html

2. Descarga los 12 archivos del año que quieras analizar.
   Ejemplo para 2023:
     202301-divvy-tripdata.zip
     202302-divvy-tripdata.zip
     ... (hasta 202312)

3. Descomprime y coloca los 12 CSV en la carpeta:
   course-8-capstone/cyclistic-case-study/data/

4. En cyclistic-analysis.Rmd, activa el bloque 'carga-datos'
   (cambia eval=FALSE a eval=TRUE) y desactiva el bloque
   'simular-datos' (cambia include=FALSE a eval=FALSE).

5. Haz clic en 'Knit' para generar el reporte HTML completo.

⚠️  Nota sobre tamaño: los 12 CSV de 2023 pesan ~1GB en total.
    No los subas a GitHub — están en .gitignore.
")
