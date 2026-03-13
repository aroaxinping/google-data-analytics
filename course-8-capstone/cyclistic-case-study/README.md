# Case Study: Cyclistic Bike-Share

**Curso:** Course 8 — Google Data Analytics Capstone
**Herramientas:** R, ggplot2, tidyverse
**Dataset:** Divvy Bikes Trip Data (datos reales de Chicago, ficcionalizados como "Cyclistic")
**Fuente datos:** https://divvy-tripdata.s3.amazonaws.com/index.html

---

## Mi perspectiva como estudiante

El capstone es el momento en el que todo lo que has aprendido en los 7 cursos
anteriores tiene que funcionar junto. Y es exactamente tan intimidante como suena.

La pregunta que más me rondó al empezar: *"¿Por dónde empiezo?"*. Tienes
12 archivos CSV, millones de filas, y una pregunta de negocio abierta. Es la
primera vez en el certificado en que no hay una actividad guiada — eres tú
sola con los datos y el proceso de análisis.

Lo que me ayudó fue volver al framework básico del Course 1: Ask → Prepare →
Process → Analyze → Share → Act. Cada fase tiene una salida concreta. Si
defines bien la salida de cada fase antes de empezar, el proyecto se
vuelve manejable.

Elegí el caso de **Cyclistic** (Track 1) en vez de proponer el mío propio
porque quería enfocarse en hacer bien el análisis, no en buscar el dataset
perfecto. El caso de Cyclistic tiene una pregunta de negocio muy clara y
datos de calidad, lo que te permite concentrarte en la parte analítica.

El hallazgo que más me gustó descubrir: los usuarios casuales hacen viajes
el doble de largos que los miembros, pero con mucha menos frecuencia y
concentrados en fines de semana. Eso dice muchísimo sobre el perfil de cada
grupo sin necesidad de saber nada más sobre ellos. Los miembros van al trabajo
en bici; los casuales la usan para pasear. Son necesidades completamente
distintas, y eso tiene que reflejarse en cómo les hablas en marketing.

Este proyecto es el que voy a poner en el portfolio.

---

## El escenario

Cyclistic es una empresa de bike-sharing en Chicago con más de 5,800 bicicletas
y 600 estaciones. Tiene dos tipos de usuarios:

- **Casual:** compradores de pases de un solo viaje o día completo
- **Member:** suscriptores anuales

La directora de marketing cree que el crecimiento futuro depende de **convertir
usuarios casuales en miembros anuales**. Para diseñar la estrategia, necesita
entender cómo cada grupo usa el servicio de forma diferente.

---

## Pregunta de negocio

> **¿En qué se diferencian los hábitos de uso entre ciclistas casuales y miembros anuales?**

---

## Proceso de análisis (6 fases)

### FASE 1 — Ask

**Tarea de negocio:** Identificar patrones de comportamiento que diferencian
a usuarios casuales de miembros anuales, para guiar una campaña de marketing
orientada a la conversión.

**Stakeholders:**
- Lily Moreno (directora de marketing)
- Equipo de análisis de marketing
- Equipo ejecutivo de Cyclistic

**Métricas clave a analizar:**
- Duración promedio de viaje por tipo de usuario
- Día de la semana preferido
- Mes del año con mayor actividad
- Tipo de bicicleta preferida
- Estaciones más usadas

---

### FASE 2 — Prepare

**Datos utilizados:** 12 meses de datos de viajes (enero 2023 - diciembre 2023)

Cada archivo mensual contiene:

| Columna | Descripción |
|---------|-------------|
| ride_id | ID único del viaje |
| rideable_type | classic_bike / electric_bike / docked_bike |
| started_at | Timestamp de inicio |
| ended_at | Timestamp de fin |
| start_station_name | Nombre estación de salida |
| end_station_name | Nombre estación de llegada |
| start_lat / start_lng | Coordenadas de inicio |
| end_lat / end_lng | Coordenadas de fin |
| member_casual | Tipo de usuario |

**Evaluación de credibilidad (ROCCC):**
- **Reliable:** Datos reales de Divvy (empresa de bike-share de Chicago)
- **Original:** Fuente primaria directa
- **Comprehensive:** 12 meses completos, millones de viajes
- **Current:** Datos del año en curso
- **Cited:** Licencia pública abierta por Motivate International Inc.

---

### FASE 3 — Process

Ver el archivo [`cyclistic-analysis.Rmd`](cyclistic-analysis.Rmd) para el
código completo de limpieza y transformación.

**Pasos de limpieza realizados:**
1. Combinar los 12 archivos CSV en un único dataframe
2. Eliminar filas con valores nulos en columnas críticas
3. Calcular `ride_length` (duración en minutos)
4. Eliminar viajes con duración negativa o menor a 1 minuto (errores de sistema)
5. Eliminar viajes de más de 24 horas (outliers)
6. Extraer componentes temporales: `day_of_week`, `month`, `hour`

---

### FASE 4 — Analyze

**Hallazgos principales:**

| Métrica | Casual | Member |
|---------|--------|--------|
| Duración media del viaje | ~24 min | ~12 min |
| Día de mayor uso | Sábado | Martes/Miércoles |
| Mes de mayor uso | Julio | Agosto |
| Bicicleta preferida | Electric > Classic | Classic > Electric |
| Patrón de uso | Ocio (fines de semana) | Commuting (días laborables) |

---

### FASE 5 — Share

Ver el archivo [`cyclistic-analysis.Rmd`](cyclistic-analysis.Rmd) para las
visualizaciones completas.

**Visualizaciones incluidas:**
1. Viajes por día de la semana (barras agrupadas: casual vs member)
2. Duración media por día (líneas)
3. Viajes por mes (área apilada)
4. Tipo de bicicleta preferida (barras apiladas al 100%)

---

### FASE 6 — Act

**Recomendaciones para convertir usuarios casuales en miembros:**

1. **Campaña de verano:** Los casuales tienen su pico en julio. Ofrecer
   descuento en membresía anual durante junio-julio cuando ya están usando
   el servicio activamente.

2. **Targeting en fines de semana:** Los casuales usan Cyclistic principalmente
   sábados y domingos. Mostrar anuncios de membresía en la app los viernes y
   enviar notificaciones push los domingos tras el viaje.

3. **Destacar el valor en viajes largos:** Los casuales hacen viajes el doble
   de largos que los miembros. Comunicar que con membresía anual los viajes
   de más de 45 min tienen descuento vs el precio de pase diario.

4. **Testimonios de usuarios convertidos:** Campañas con historias de usuarios
   que empezaron siendo casuales y calcularon el ahorro al hacerse miembros.

---

## Archivos del proyecto

| Archivo | Descripción |
|---------|-------------|
| `README.md` | Este documento — resumen del caso |
| `cyclistic-analysis.Rmd` | Código R completo (limpieza + análisis + visualizaciones) |
