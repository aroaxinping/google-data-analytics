# ============================================================
# SETUP — Análisis de Netflix con R
# Ejecutar este archivo UNA VEZ antes de abrir el .Rmd
# ============================================================

# 1. Instalar paquetes necesarios (si no los tienes ya)
paquetes <- c("tidyverse", "lubridate", "scales", "ggthemes")

instalar_si_falta <- function(pkg) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    install.packages(pkg)
    message(paste("Instalado:", pkg))
  } else {
    message(paste("Ya instalado:", pkg))
  }
}

invisible(sapply(paquetes, instalar_si_falta))

# 2. Verificar que todo se carga correctamente
library(tidyverse)
library(lubridate)
library(scales)
library(ggthemes)

message("
 Setup completado. Pasos siguientes:

1. Descarga el dataset desde Kaggle:
   https://www.kaggle.com/datasets/shivamb/netflix-shows

2. Coloca 'netflix_titles.csv' en esta carpeta:
   course-7-r-programming/proyecto-r/

3. Abre 'analisis-netflix.Rmd' en RStudio

4. Haz clic en 'Knit' para generar el reporte HTML
")
