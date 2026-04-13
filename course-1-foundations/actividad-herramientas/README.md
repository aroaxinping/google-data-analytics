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

**Python / pandas / NumPy** — análisis de datos, visualizaciones con matplotlib,
automatización y manipulación de datasets. El mismo lenguaje que se usa en
machine learning, así que si profundizas no tienes que cambiar de herramienta.

**Tableau Public** — dashboards interactivos para presentar a stakeholders no
técnicos. Lo que haces en Tableau lo puede ver cualquiera sin saber de datos.

## El mapa mental que me quedé

```
Dataset pequeño, exploración rápida  → Sheets
Dataset grande, extraer datos         → SQL / BigQuery
Análisis de datos, visualizaciones    → Python (pandas, matplotlib)
Dashboard para presentar              → Tableau
```

No son excluyentes. Un flujo real típico: SQL para extraer → Python para analizar
→ Tableau para presentar.
