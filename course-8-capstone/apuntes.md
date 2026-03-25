# Apuntes — Course 8: Google Data Analytics Capstone

**Duracion:** 11 horas
**Modulos:** 4

---

## Que cubre este curso

El proyecto final del certificado. No hay nuevo contenido tecnico — es
aplicar todo lo aprendido en los cursos 1-7 a un caso de negocio real.
El output es un case study que va directamente al portfolio.

---

## Modulo 1: Learn About Capstone Basics

**Que es un case study:**
Un case study es un analisis completo de un problema de negocio real,
documentado de forma que pueda presentarse a empleadores. Incluye:
- El problema y el contexto
- Los datos usados y como se evaluaron
- El proceso de limpieza
- El analisis y los hallazgos
- Las visualizaciones
- Las recomendaciones basadas en los datos

**Por que importa para el portfolio:**
Los reclutadores de datos quieren ver trabajo real, no solo certificados.
Un case study bien documentado en GitHub o Kaggle demuestra que puedes
hacer el trabajo — no solo que has estudiado como hacerlo.

**Que hace un buen case study:**
- Responde una pregunta de negocio clara
- Documenta las decisiones tomadas (por que se limpio de esta manera, por que
  se eligio este tipo de grafico...)
- Muestra el proceso completo, no solo el resultado
- Tiene conclusiones accionables, no solo descripciones

---

## Modulo 2: Build Your Portfolio — Las dos opciones

**Track 1: Caso proporcionado (recomendado para empezar)**

Dos casos disponibles:

**Caso A — Cyclistic Bike-Share:**
- Empresa ficticia de bicicletas en Chicago basada en datos reales de Divvy
- Pregunta: como se diferencian los usuarios casuales de los miembros anuales?
- Datos: 12 meses de viajes (millones de registros)
- Herramientas recomendadas: R o Python + Tableau
- Es el caso mas popular — hay mucha referencia disponible

**Caso B — Bellabeat:**
- Empresa de dispositivos wellness para mujeres
- Pregunta: que tendencias en el uso de dispositivos inteligentes son relevantes
  para la estrategia de marketing?
- Datos: Fitbit dataset de Kaggle (30 usuarios, 2 meses)
- Dataset mas pequeno — mas manejable si es el primer proyecto

**Track 2: Caso propio**
Eliges tu propio dataset y defines tu propia pregunta. Mas libertad pero
mas dificil porque tienes que encontrar un dataset de calidad y una pregunta
de negocio relevante. Recomendable si ya tienes experiencia.

---

## Modulo 3: Use Your Portfolio

Una vez hecho el case study, como presentarlo.

**Donde publicarlo:**
- **Kaggle Notebooks:** publico, indexado, con comunidad data science
- **GitHub:** estandar de la industria tech, necesario para portfolios
- **Tableau Public:** para el dashboard de visualizaciones
- **RPubs / Posit Connect:** para reportes R Markdown

**Como hablar del proyecto en entrevistas:**

Estructura STAR:
- **Situation:** el contexto del problema
- **Task:** que tenia que responder
- **Action:** como lo analice, que herramientas use, que decisiones tome
- **Result:** que encontre y que recomendaciones hice

El error mas comun: hablar solo de las herramientas ("use SQL y Tableau")
sin explicar el razonamiento detras de las decisiones.

---

## Modulo 4: Put Your Certificate to Work

Pasos practicos post-certificacion:
- Reclamar el badge de Google en Credly
- Anadirlo al perfil de LinkedIn
- Anadirlo al CV como certificacion
- Acceder a la plataforma Big Interview para practicar entrevistas

---

## El proceso de analisis aplicado al capstone

Todo el certificado gira en torno a este framework. El capstone lo aplica completo:

```
ASK
|-- Definir la pregunta de negocio
|-- Identificar a los stakeholders
|-- Definir que metricas responden la pregunta
|
PREPARE
|-- Descargar y evaluar los datos (ROCCC)
|-- Documentar la fuente, licencia y limitaciones
|-- Entender la estructura del dataset
|
PROCESS
|-- Combinar archivos si hay varios
|-- Limpiar: nulos, duplicados, formatos
|-- Transformar: nuevas columnas derivadas
|-- Documentar cada decision de limpieza
|
ANALYZE
|-- Calcular estadisticas descriptivas
|-- Identificar patrones y tendencias
|-- Comparar grupos
|-- Responder las preguntas de negocio con datos
|
SHARE
|-- Crear visualizaciones claras
|-- Construir el dashboard
|-- Estructurar el case study como narrativa
|
ACT
|-- Formular 3-5 recomendaciones concretas
|-- Basar cada recomendacion en un hallazgo especifico
|-- Proponer proximos pasos o analisis adicionales
```

---

## Notas sobre el caso Cyclistic

El dataset de Cyclistic (Divvy Bikes) contiene estas columnas clave:

| Columna | Descripcion |
|---------|-------------|
| ride_id | ID unico del viaje |
| rideable_type | classic_bike / electric_bike / docked_bike |
| started_at | Timestamp de inicio |
| ended_at | Timestamp de fin |
| start_station_name | Estacion de salida |
| end_station_name | Estacion de llegada |
| member_casual | Tipo de usuario: casual o member |

**Hallazgos tipicos que emergen del analisis:**
- Los miembros hacen viajes mas cortos y frecuentes (commuting)
- Los casuales hacen viajes mas largos y concentrados en fines de semana (ocio)
- El verano es el pico de uso para ambos grupos, especialmente para casuales
- Los miembros prefieren bicicletas clasicas; los casuales, electricas

**Recomendaciones derivadas:**
1. Campanas de conversion dirigidas a casuales activos en verano
2. Mostrar el ahorro acumulado en la app tras cada viaje (comparar precio
   de pase diario vs membresia anual)
3. Notificaciones push los fines de semana cuando los casuales ya usan el servicio

---

## Actividades del curso

**Modulo 1 — Learn About Capstone Basics:**
- Que es un case study y por que importa para el portfolio (video)
- Que hace bueno a un case study (lectura)
- Revisar ejemplos de case studies de analistas que han completado el certificado (lectura)
- Desafio del modulo 1 (quiz calificado)

**Modulo 2 — Build Your Portfolio:**
- Las dos opciones: Track 1 (caso proporcionado) vs Track 2 (caso propio) (video)
- Caso A — Cyclistic Bike-Share: descripcion del problema y dataset (lectura)
- Caso B — Bellabeat: descripcion del problema y dataset Fitbit (lectura)
- Descargar y explorar el dataset elegido (hands-on)
- Aplicar el framework ASK-PREPARE-PROCESS-ANALYZE-SHARE-ACT al caso (hands-on calificable — es el proyecto principal del curso)

**Modulo 3 — Use Your Portfolio:**
- Donde publicar el case study: Kaggle, GitHub, Tableau Public (video)
- Estructura STAR para hablar del proyecto en entrevistas (lectura)
- Actividad: publicar el case study y compartir el enlace (hands-on)
- Desafio del modulo 3 (quiz calificado)

**Modulo 4 — Put Your Certificate to Work:**
- Reclamar el badge de Google en Credly (lectura)
- Anadir el certificado a LinkedIn (lectura)
- Acceder a Big Interview para practicar entrevistas (lectura)
- Evaluacion final del certificado (quiz calificado final)

---

## Actividades practicas destacadas

El proyecto principal del capstone es el **case study completo**, que cubre todas las fases del proceso de analisis:
- ASK: definir la pregunta de negocio y los stakeholders
- PREPARE: descargar el dataset, evaluarlo con ROCCC, documentar la fuente
- PROCESS: combinar archivos si hay varios, limpiar nulos/duplicados/formatos, documentar cada decision
- ANALYZE: calcular estadisticas descriptivas, identificar patrones, comparar grupos, responder las preguntas de negocio
- SHARE: crear visualizaciones en Tableau o con Python/R, construir el dashboard o informe narrativo
- ACT: formular 3-5 recomendaciones accionables basadas en hallazgos especificos

---

## Errores comunes

- **Hacer el capstone demasiado rapido:** es la pieza principal del portfolio. Un case study hecho en un dia es visible — los reclutadores que revisan portfolios ven la diferencia entre un analisis superficial y uno riguroso.
- **Documentar solo el resultado, no las decisiones:** los reclutadores quieren ver el razonamiento. Por que se elimino este campo, por que se eligio este tipo de grafico, por que esta recomendacion. El proceso importa tanto como el output.
- **Describir los datos en lugar de responder la pregunta de negocio:** un case study que dice "el 65% de los usuarios son casuales" sin conectarlo a una recomendacion de negocio no demuestra habilidad analitica, solo capacidad de contar.
- **No reconocer las limitaciones del dataset:** el dataset de Cyclistic (Divvy) no incluye datos demograficos ni informacion de pago — estas son limitaciones reales que afectan a lo que se puede concluir. Ignorarlas parece poco profesional; mencionarlas proactivamente aumenta la credibilidad.
- **Publicar sin revisar el formato del notebook:** un Jupyter Notebook con celdas de error visibles, outputs sin ejecutar o markdown mal formateado da mala impresion. Ejecutar el notebook completo de arriba a abajo antes de publicarlo.

---

## Conexion con otros cursos

- Este curso es la aplicacion completa de los 7 cursos anteriores. No hay nuevo contenido tecnico: todo es integracion.
- La pregunta SMART del curso 2 define la pregunta de negocio del case study. Sin una pregunta bien definida, el analisis no tiene direccion.
- ROCCC del curso 3 se aplica al evaluar el dataset del caso — documentar esta evaluacion es parte del case study profesional.
- Las tecnicas de limpieza del curso 4 se usan en la fase PROCESS: ROW_NUMBER para duplicados, COALESCE para nulos, documentar cada decision en el log.
- Las habilidades de SQL del curso 5 (JOINs, GROUP BY, CTEs) son las herramientas del analisis si se elige SQL como herramienta principal.
- Las visualizaciones del curso 6 (Tableau o matplotlib) son el output de la fase SHARE. La narrativa con datos del curso 6 es la estructura de la presentacion del case study.
- Python del curso 7 es la herramienta recomendada para el caso Cyclistic si se elige el track de programacion.

---

## Lo mas importante de este curso

El capstone no tiene contenido nuevo — es la integracion de todo. Lo que
determina la calidad del resultado es:

1. **La claridad de la pregunta:** sin una pregunta bien definida, el analisis
   no tiene direccion
2. **La honestidad sobre las limitaciones:** un case study que ignora los
   problemas del dataset parece poco profesional
3. **Las recomendaciones accionables:** el objetivo no es describir los datos,
   es proponer que hacer con ellos

El case study es probablemente la cosa mas importante que sale del certificado
entero. Vale la pena hacerlo bien.
