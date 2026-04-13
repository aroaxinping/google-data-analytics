# Proyecto: Análisis de Netflix con R

**Curso:** Course 7 (versión anterior — R) | El curso actual usa Python
> Este proyecto usa R porque fue desarrollado con la versión anterior del certificado (antes de la actualización de 2024 a Python). El temario actual del Course 7 cubre Python; este análisis se conserva como ejercicio práctico complementario.
**Dataset:** Netflix Movies and TV Shows
**Herramientas:** R, RStudio, ggplot2, tidyverse, lubridate
**Entregable:** R Markdown → HTML report

---

## Mi perspectiva como estudiante

R fue la herramienta que más me asustaba antes de empezar. Venía de Sheets
y SQL que tienen interfaz visual o al menos se leen casi como inglés.
R parecía... otro mundo.

La revelación fue el `tidyverse`. Una vez que entiendes el pipe (`%>%`) todo
tiene sentido: tomas unos datos, los pasas por un filtro, luego por otro,
luego los agregas, luego los visualizas. Es exactamente la misma lógica que
SQL pero más expresiva para análisis complejos.

`ggplot2` fue lo que me enganchó a R. La lógica de capas (cada `+` añade
una capa al gráfico) tarda un poco en entrar, pero cuando entra, construir
un gráfico complejo se convierte en algo casi intuitivo. Además los gráficos
quedan preciosos por defecto — hay algo muy satisfactorio en eso.

Lo que más me costó: entender la diferencia entre un `factor` y un `character`
en R, y por qué importa a la hora de ordenar categorías en un gráfico. Si el
día de la semana es `character`, R lo ordena alfabéticamente (Friday, Monday,
Saturday...). Si es `factor` con el orden correcto, lo ordena como esperas
(Monday, Tuesday...). Eso me comió mucho tiempo al principio.

R Markdown fue una sorpresa positiva. La idea de mezclar texto, código y
resultados en un solo documento que genera un HTML o PDF es exactamente
lo que necesitas para comunicar un análisis de forma profesional.

---

## Cómo ejecutar

1. Descargar `netflix_titles.csv` desde Kaggle y colocarlo en esta carpeta
2. Abrir `analisis-netflix.Rmd` en RStudio
3. Instalar dependencias si es necesario:

```r
install.packages(c("tidyverse", "lubridate", "scales", "ggthemes"))
```

4. Clic en **Knit** → genera el reporte en HTML

---

## Contenido del análisis

| Sección | Visualización |
|---------|--------------|
| Películas vs Series | Donut chart |
| Evolución por año | Área apilada |
| Top 10 países | Barras horizontales |
| Géneros | Barras con gradiente de color |
| Duración películas | Histograma |

---

## Librerías usadas

| Librería | Para qué |
|----------|----------|
| `tidyverse` | Manipulación y visualización de datos |
| `lubridate` | Parseo y manejo de fechas |
| `scales` | Formato de números y ejes |
| `ggthemes` | Temas adicionales para ggplot2 |
| `tidyr` | `separate_rows()` para géneros múltiples |
