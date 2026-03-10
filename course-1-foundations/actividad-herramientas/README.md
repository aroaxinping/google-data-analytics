# Notas: Las herramientas del certificado

**Curso:** Course 1 — Foundations: Data, Data, Everywhere

---

El Course 1 presenta las cuatro herramientas del certificado sin entrar en
profundidad con ninguna. La idea es saber dónde vas antes de empezar el camino.

## Las herramientas y cuándo se usan

**Google Sheets** — datasets pequeños/medianos, análisis rápido, comunicar resultados
a personas no técnicas. Límite práctico: ~100k filas antes de que se vuelva lento.

**SQL / BigQuery** — cuando el dataset es demasiado grande para Sheets. Millones
de filas, combinar múltiples tablas, consultas repetibles y automatizables.

**R + RStudio** — análisis estadístico, visualizaciones complejas con ggplot2,
documentación reproducible con R Markdown. Más potente que Sheets para análisis.

**Tableau Public** — dashboards interactivos para presentar a stakeholders no
técnicos. Lo que haces en Tableau lo puede ver cualquiera sin saber de datos.

## El mapa mental que me quedé

```
Dataset pequeño, exploración rápida  → Sheets
Dataset grande, extraer datos         → SQL / BigQuery
Análisis estadístico, visualizaciones → R
Dashboard para presentar              → Tableau
```

No son excluyentes. Un flujo real típico: SQL para extraer → R para analizar
→ Tableau para presentar.
