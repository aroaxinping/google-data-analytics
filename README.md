# Google Data Analytics Certificate

Documentación de mi progreso en el Google Data Analytics Professional Certificate de Coursera.

---

## Sobre este repositorio

Recoge notas de aprendizaje, ejercicios prácticos y el proyecto final (capstone)
de los 8 cursos del certificado. No es solo un seguimiento — es un recurso para
poder rehacer cualquier ejercicio desde cero.

Para instrucciones de instalación y cómo replicar cada proyecto, ver [SETUP.md](./SETUP.md).

---

## Progreso

| Curso | Titulo | Estado | Contenido en el repo |
|-------|--------|--------|----------------------|
| 1 | Foundations: Data, Data, Everywhere | Completado | Notas de exploración en Sheets e intro a herramientas |
| 2 | Ask Questions to Make Data-Driven Decisions | Completado | Preguntas SMART y ejercicios de Sheets |
| 3 | Prepare Data for Exploration | En progreso | Kaggle datasets, BigQuery, ROCCC |
| 4 | Process Data from Dirty to Clean | Ejercicio | Limpieza SQL con BigQuery |
| 5 | Analyze Data to Answer Questions | Ejercicio | Análisis SQL de Netflix |
| 6 | Share Data Through the Art of Visualization | Pendiente | Diseño de dashboard (Tableau WIP) |
| 7 | Data Analysis with R Programming | Proyecto | R Markdown con ggplot2 (ejecutable) |
| 8 | Google Data Analytics Capstone | Proyecto | Cyclistic case study (R Markdown completo) |

---

## Estructura del repo

```
google-data-analytics/
├── SETUP.md                          <- Instrucciones para reproducir desde cero
├── course-1-foundations/
│   ├── actividad-explorar-datos/     <- Notas: primera exploración en Sheets
│   └── actividad-herramientas/       <- Notas: las 4 herramientas del certificado
├── course-2-ask-questions/
│   ├── actividad-smart-questions/    <- Notas: framework SMART
│   └── actividad-spreadsheets/       <- Notas: Sheets (filtros, pivot, VLOOKUP)
├── course-3-prepare-data/
│   ├── week-3-kaggle-datasets/       <- Actividad completa: Kaggle + notebooks
│   ├── actividad-bigquery/           <- Notas: primera vez con BigQuery y SQL
│   └── actividad-roccc/              <- Notas: credibilidad de datos con ROCCC
├── course-4-process-data/
│   └── proyecto-limpieza/            <- limpieza.sql (BigQuery, ejecutable)
├── course-5-analyze-data/
│   └── proyecto-analisis/            <- analisis-netflix.sql (BigQuery, ejecutable)
├── course-6-visualize-data/
│   └── proyecto-tableau/             <- Diseño del dashboard (Tableau, WIP)
├── course-7-r-programming/
│   └── proyecto-r/                   <- analisis-netflix.Rmd + setup.R
└── course-8-capstone/
    └── cyclistic-case-study/         <- cyclistic-analysis.Rmd + setup.R
```

---

## Herramientas

- **Sheets / Excel** — cursos 1, 2, 4
- **SQL / BigQuery** — cursos 3, 4, 5
- **R / RStudio / ggplot2** — cursos 7, 8
- **Tableau Public** — curso 6

---

## El proceso de análisis (Ask → Act)

Todo el certificado gira en torno a este framework:

```
Ask → Prepare → Process → Analyze → Share → Act
```

Cada curso cubre una o dos fases. El capstone (curso 8) las integra todas
en un caso de negocio real.
