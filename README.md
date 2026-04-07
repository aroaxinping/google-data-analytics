# Google Data Analytics Certificate

Certificado completado. Documentación de notas, ejercicios prácticos y capstone
del Google Data Analytics Professional Certificate de Coursera (9 cursos).

[Ver certificado en Coursera](https://coursera.org/share/2e785f372f9331fb825a475c6e21e682)

---

## Sobre este repositorio

Recoge notas de aprendizaje, ejercicios prácticos y el proyecto final (capstone)
de los 9 cursos del certificado. No es solo un seguimiento — es un recurso para
poder rehacer cualquier ejercicio desde cero.

Para instrucciones de instalación y cómo replicar cada proyecto, ver [SETUP.md](./SETUP.md).

---

## Progreso

| Curso | Titulo | Contenido en el repo |
|-------|--------|----------------------|
| 1 | Foundations: Data, Data, Everywhere | Apuntes, glosario, actividades de exploración |
| 2 | Ask Questions to Make Data-Driven Decisions | Apuntes, glosario, práctica Sheets |
| 3 | Prepare Data for Exploration | Apuntes, glosario, SQL básico, Kaggle datasets, ROCCC |
| 4 | Process Data from Dirty to Clean | Apuntes, glosario, limpieza SQL + verificación |
| 5 | Analyze Data to Answer Questions | Apuntes, glosario, ejercicios SQL por módulo, análisis Netflix |
| 6 | Share Data Through the Art of Visualization | Apuntes, glosario, documentación Tableau |
| 7 | Data Analysis with Python | Apuntes, glosario, ejercicios Python por módulo, análisis Netflix en R |
| 8 | Google Data Analytics Capstone | Apuntes, glosario, Cyclistic case study (R Markdown) |
| 9 | Accelerate Your Job Search with AI | Apuntes, glosario |

---

## Estructura del repo

```
google-data-analytics/
├── SETUP.md
├── course-1-foundations/
├── course-2-ask-questions/
│   └── practica-sheets/
├── course-3-prepare-data/
│   ├── practica-sql/                 <- consultas-basicas.sql (BigQuery)
│   ├── actividad-roccc/
│   └── week-3-kaggle-datasets/
├── course-4-process-data/
│   └── proyecto-limpieza/            <- limpieza.sql + verificacion.sql
├── course-5-analyze-data/
│   ├── modulo-1-organizar-datos/     <- ejercicios.sql (ORDER BY, WHERE, CASE)
│   ├── modulo-2-formatear-datos/     <- ejercicios.sql (CAST, fechas, JOINs)
│   ├── modulo-3-agregar-datos/       <- ejercicios.sql (GROUP BY, window functions)
│   ├── modulo-4-calculos/            <- ejercicios.sql (CTEs, tablas temporales)
│   └── proyecto-analisis/            <- analisis-netflix.sql
├── course-6-visualize-data/
│   └── tableau-dashboards/
├── course-7-python/
│   ├── modulo-1-python-basico/       <- ejercicios.py
│   ├── modulo-2-funciones-condicionales/ <- ejercicios.py
│   ├── modulo-3-bucles-strings/      <- ejercicios.py
│   ├── modulo-4-estructuras-pandas/  <- ejercicios.py
│   └── proyecto-r/                   <- analisis-netflix.Rmd
├── course-8-capstone/
│   └── cyclistic-case-study/         <- cyclistic-analysis.Rmd
└── course-9-job-search/
```

---

## Herramientas

- **SQL / BigQuery** — cursos 3, 4, 5
- **Python / pandas / NumPy** — curso 7
- **R / RStudio / ggplot2** — cursos 7, 8
- **Sheets / Excel** — cursos 1, 2, 4
- **Tableau Public** — curso 6

---

## El proceso de análisis (Ask → Act)

Todo el certificado gira en torno a este framework:

```
Ask → Prepare → Process → Analyze → Share → Act
```

Cada curso cubre una o dos fases. El capstone (curso 8) las integra todas
en un caso de negocio real.
