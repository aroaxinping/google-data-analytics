# Notas: Evaluar credibilidad de datos con ROCCC

**Curso:** Course 3 — Prepare Data for Exploration

---

Antes de analizar datos hay que hacerse una pregunta que es fácil de saltarse:
**¿de dónde vienen estos datos y puedo confiar en ellos?**

El framework ROCCC es la herramienta del curso para hacer esa evaluación.

## El framework

| Letra | Criterio | Pregunta |
|-------|----------|----------|
| **R** | Reliable | ¿La fuente es conocida y de confianza? |
| **O** | Original | ¿Es la fuente primaria o una copia de terceros? |
| **C** | Comprehensive | ¿Tiene todo lo necesario para responder la pregunta? |
| **C** | Current | ¿Los datos son suficientemente recientes? |
| **C** | Cited | ¿La fuente original está identificada y verificable? |

## Evaluaciones prácticas

### Divvy Bikes Trip Data — ✅ Pasa todo
Datos reales publicados por la empresa que opera el sistema de bicicletas.
Fuente primaria, actualización mensual, licencia pública identificada.
Limitación: no incluye datos demográficos del usuario por privacidad.

### Netflix Movies and TV Shows (Kaggle) — ⚠️ Con matices
Bueno para prácticas y portfolio. **No** adecuado para analizar el catálogo
*actual* de Netflix — la última actualización es de 2021. Los datos no son
fuente primaria (scraping de datos públicos), pero la metodología está documentada.

### Encuesta compartida en un foro sin identificar — ❌ No usable
Sin fuente verificable, sin fecha, sin contexto de cómo se recogió.
Puede servir para practicar técnicas, nunca para tomar decisiones reales.

## First, second y third-party data

Algo que no sabía antes del curso:

- **First-party:** la empresa recoge sus propios datos (Divvy sobre sus bicis)
- **Second-party:** otra empresa comparte sus datos directamente contigo
- **Third-party:** datos recogidos por externos y publicados o vendidos

Los de primera parte son los más fiables porque la empresa controla cómo
se recogen. Los de tercera parte son los más arriesgados — no siempre sabes
si se modificaron o cómo se seleccionó la muestra.

## El sesgo es más sutil de lo que parece

Un dataset puede pasar ROCCC y aun así tener sesgos:

- **Sesgo de muestreo:** la encuesta se hizo solo a usuarios activos → los que
  abandonaron antes no están representados
- **Sesgo de tiempo:** datos de 2019 no representan el comportamiento post-pandemia
  aunque sean del mismo producto

ROCCC no elimina todos los sesgos, pero te obliga a pensar en ellos antes
de empezar a analizar.
