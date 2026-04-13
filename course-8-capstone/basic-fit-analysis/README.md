# Basic Fit — Analisis de Expansion Europea

**Tipo:** Capstone propio — analisis voluntario sobre una empresa real
**Certificado:** Google Data Analytics Professional Certificate — Course 8
**Dataset:** Datos publicos de Basic Fit Annual Reports (Euronext: BFIT)
**Herramienta:** Python — pandas, matplotlib

## Motivacion

El caso estudio oficial del certificado usa Cyclistic (Divvy Bikes Chicago).
Este es un analisis adicional, hecho por interes propio, sobre una empresa
que conozco como usuario: Basic Fit, la cadena de gimnasios low-cost mas
grande de Europa.

Queria aplicar el mismo framework Ask-Prepare-Process-Analyze-Share a datos
reales de una compania cotizada — extraidos de sus informes anuales publicos —
y responder una pregunta que me parecia genuinamente interesante:
que mercados tienen mas recorrido y donde esta el mayor potencial sin explotar.

## Pregunta de negocio

En que paises esta creciendo mas Basic Fit y donde esta el mayor potencial sin explotar?

## Framework aplicado

El analisis sigue el proceso Ask → Prepare → Process → Analyze → Share → Act:

- **Ask:** Pregunta SMART definida, stakeholders identificados, metrica clave (clubs por millon de habitantes)
- **Prepare:** Datos de Annual Reports y FY press releases oficiales (2016-2024), evaluacion ROCCC
- **Process:** Calculos derivados — penetracion, tasa YoY, ratio miembros/club
- **Analyze:** 5 visualizaciones + correlacion de Pearson clubs vs miembros (r = 0.98)
- **Share:** Conclusiones y 3 recomendaciones estrategicas por mercado
- **Act:** Tabla de proximos pasos por mercado con KPIs de seguimiento

## Visualizaciones

| Archivo | Contenido |
|---------|-----------|
| `viz1_total_clubs.png` | Evolucion total de clubs por anio (2016-2024) |
| `viz2_clubs_by_country.png` | Clubs por pais (barras apiladas) |
| `viz3_penetration.png` | Penetracion por pais: clubs por millon de habitantes |
| `viz4_members_revenue.png` | Evolucion de miembros e ingresos (dual axis) |
| `viz5_emerging_markets.png` | Trayectoria de Espana y Alemania — mercados emergentes |

## Archivos

- `basic-fit-expansion.ipynb` — analisis completo ejecutado con todos los outputs
