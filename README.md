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

## Proyectos destacados

| Proyecto | Herramienta | Descripcion |
|----------|-------------|-------------|
| [Basic Fit — Expansion Europea](./course-8-capstone/basic-fit-analysis/) | Python | Analisis de expansion por mercado con datos reales de annual reports (Euronext: BFIT). Penetracion por pais, potencial de crecimiento, recomendaciones estrategicas |
| [Cyclistic Bike-Share Case Study](./course-8-capstone/cyclistic-case-study/) | R | Capstone oficial del certificado. Analisis de comportamiento de usuarios casuales vs miembros anuales |
| [Analisis SQL Netflix](./course-5-analyze-data/proyecto-analisis/) | SQL / BigQuery | 7 queries ejecutables sobre el catalogo de Netflix: JOINs, window functions, CTEs, UNNEST |
| [Limpieza de datos e-commerce](./course-4-process-data/proyecto-limpieza/) | SQL / BigQuery | Pipeline completo de limpieza: deteccion de duplicados, nulos, tipos incorrectos y verificacion |
| [Visualizaciones Netflix — diseno](./course-6-visualize-data/proyecto-tableau/) | Tableau | Diseno documentado de dashboard Netflix: 4 vistas, paleta, criterios de eleccion de grafico y principios aplicados |
| [Ejercicios SQL avanzado](./course-5-analyze-data/) | SQL / BigQuery | 4 modulos con ejercicios ejecutables: ORDER BY, JOINs, window functions, CTEs |

---

## Progreso

| Curso | Titulo | Contenido en el repo |
|-------|--------|----------------------|
| 1 | Foundations: Data, Data, Everywhere | Apuntes, glosario, actividades de exploración |
| 2 | Ask Questions to Make Data-Driven Decisions | Apuntes, glosario, práctica Sheets |
| 3 | Prepare Data for Exploration | Apuntes, glosario, SQL básico, Kaggle datasets, ROCCC |
| 4 | Process Data from Dirty to Clean | Apuntes, glosario, limpieza SQL + verificación |
| 5 | Analyze Data to Answer Questions | Apuntes, glosario, ejercicios SQL por módulo, análisis Netflix |
| 6 | Share Data Through the Art of Visualization | Apuntes, glosario, diseno de dashboard Netflix en Tableau |
| 7 | Data Analysis with Python | Apuntes, glosario, ejercicios Python por módulo, análisis Netflix en R (versión anterior del curso) |
| 8 | Google Data Analytics Capstone | Apuntes, glosario, Cyclistic case study (R), Basic Fit expansion analysis (Python — datos reales) |
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
│   ├── proyecto-tableau/             <- diseño de dashboard Netflix (donut, area, barras, treemap)
│   └── tableau-dashboards/
├── course-7-python/
│   ├── modulo-1-python-basico/       <- ejercicios.py
│   ├── modulo-2-funciones-condicionales/ <- ejercicios.py
│   ├── modulo-3-bucles-strings/      <- ejercicios.py
│   ├── modulo-4-estructuras-pandas/  <- ejercicios.py
│   └── analisis-r-netflix/           <- analisis extra en R (anterior version del curso)
├── course-8-capstone/
│   ├── cyclistic-case-study/         <- cyclistic-analysis.Rmd
│   └── basic-fit-analysis/           <- expansion europea con datos reales (Python)
└── course-9-job-search/
```

---

## Herramientas

- **SQL / BigQuery** — cursos 3, 4, 5
- **Python / pandas / NumPy** — curso 7
- **R / RStudio / ggplot2** — curso 8 (Cyclistic capstone) + análisis legacy curso 7
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
