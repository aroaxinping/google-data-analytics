# Dashboard Netflix en Tableau Public

**Curso:** Course 6 — Share Data Through the Art of Visualization
**Estado:** 🔄 En progreso — diseño definido, pendiente de construir en Tableau
**Dataset:** Netflix Movies and TV Shows (analizado en course-5)

> Cuando el dashboard esté publicado, añadiré el enlace de Tableau Public aquí.

---

El Course 6 fue el más cercano al diseño para mí. La pregunta "¿cómo presento
esta información para que quien la vea la entienda en 5 segundos?" conecta
con el diseño gráfico más que cualquier otra parte del certificado.

Lo que más me abrió la cabeza: **bonito ≠ efectivo**. Un donut con 12 sectores
puede ser visualmente impactante y absolutamente ilegible al mismo tiempo.
Barras horizontales simples suelen comunicar mejor aunque sean "más aburridas".

---

## Diseño del dashboard

Cuatro vistas que responden las preguntas del análisis SQL:

**Vista 1 — Donut: Películas vs Series**
Responde la pregunta principal de un vistazo. Posición: arriba izquierda
(la primera que ve el ojo al leer en F).

**Vista 2 — Área apilada: Crecimiento por año**
Muestra la evolución temporal con películas y series diferenciadas.
Anotación manual en 2019 (año pico).

**Vista 3 — Barras horizontales: Top 10 países**
Más fácil de leer que barras verticales cuando los nombres son largos.
Ordenado descendente.

**Vista 4 — Treemap: Géneros**
Comunica proporciones entre muchas categorías de forma compacta.

## Paleta de colores

| Uso | Color |
|-----|-------|
| Películas | `#E50914` (rojo Netflix) |
| Series | `#221F1F` (negro Netflix) |
| Fondo | `#FFFFFF` |

El mismo color para el mismo concepto en todas las vistas. Sin excepciones.

## Principios que aplico

- Cada gráfico responde una pregunta concreta, no "muestra datos"
- Sin decoración que no aporte información (chart junk)
- Etiquetas directas en lugar de leyenda separada donde sea posible
- Filtros interactivos que afectan a todas las hojas simultáneamente

## Preparación de datos necesaria antes de Tableau

El CSV de Netflix requiere estos pasos previos (query BigQuery del course-5):

1. Extraer año de `date_added` → columna `year_added`
2. Separar el primer país cuando hay múltiples en `country`
3. Separar géneros individuales de `listed_in` con `UNNEST(SPLIT(...))`
