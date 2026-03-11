# Notas: Preguntas SMART

**Curso:** Course 2 — Ask Questions to Make Data-Driven Decisions

---

La sorpresa del Course 2 es que el trabajo de un analista empieza mucho antes
de tocar datos: en definir qué pregunta estás intentando responder.

Si la pregunta está mal planteada, da igual lo buena que sea tu SQL o tu ggplot2.
Vas a producir un análisis perfecto que no responde nada útil.

## El framework SMART

| Letra | Criterio | Pregunta a hacerse |
|-------|----------|--------------------|
| **S** | Specific | ¿Está enfocada en una sola cosa concreta? |
| **M** | Measurable | ¿Se puede responder con datos? |
| **A** | Action-oriented | ¿La respuesta lleva a una decisión? |
| **R** | Relevant | ¿Le importa a los stakeholders? |
| **T** | Time-bound | ¿Tiene un período de referencia claro? |

## Ejercicio: reescribir preguntas vagas

**Pregunta vaga:** *"¿Por qué bajan las ventas?"*

**Pregunta SMART:** *"¿En qué categorías de producto han caído las ventas
más de un 15% en Q1 2024 vs Q1 2023, y qué acciones podemos tomar antes del Q2?"*

---

**Pregunta vaga:** *"¿A los usuarios les gusta la app?"*

**Pregunta SMART:** *"¿Cuál es la tasa de retención a 7 días entre enero y
marzo de 2024, y qué funcionalidades usan más los usuarios que retienen vs
los que abandonan?"*

## Lo que entendí sobre los stakeholders

Los stakeholders suelen dar preguntas vagas porque no saben qué datos tienes
disponibles. Tu trabajo como analista es traducir su pregunta al lenguaje
de los datos:

```
"Necesito saber por qué perdemos clientes"
          ↓
"¿Cuál es la tasa de churn mensual del último año y qué
 características comparten los clientes que cancelan antes de 90 días?"
```

Al principio el framework SMART me pareció académico. Cuanto más avanzo,
más veo que la calidad de un análisis depende directamente de la calidad
de la pregunta inicial.
