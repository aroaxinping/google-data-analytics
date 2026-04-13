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

## Glosarios por modulo

**Glosario del modulo 1:**

| Termino | Definicion |
|---------|------------|
| Caso de exito (case study) | Un escenario de problemas de datos que los analistas de datos usan para practicar, aprender y demostrar habilidades para empleadores potenciales |
| Portfolio | Una coleccion de materiales que puede compartir con empleadores potenciales |
| Hoja de ruta del aprendizaje | Una guia personalizada con los pasos necesarios para lograr una meta de aprendizaje o carrera |
| Enunciado de la tarea empresarial | Una pregunta o problema que el analisis de datos responde para una empresa u organizacion |

**Glosario del modulo 2:**

| Termino | Definicion |
|---------|------------|
| Registro de limpieza | Un historial cronologico de las decisiones de limpieza tomadas sobre un conjunto de datos durante la fase de procesamiento |
| Metodologia | Un conjunto de principios y tecnicas que guian la forma de abordar un problema o tarea de analisis |
| Pregunta SMART | Una pregunta de analisis de datos que es especifica, medible, orientada a la accion, relevante y con limite de tiempo |
| Sesgo de los datos | Cuando una preferencia sesga sistematicamente los resultados del analisis de datos en una cierta direccion |
| Validacion | El proceso de confirmar que los datos y el analisis son correctos, completos y relevantes para responder la pregunta de negocio |

**Glosario del modulo 3:**

| Termino | Definicion |
|---------|------------|
| Elevator pitch | Una presentacion de aproximadamente 60 segundos de una persona, empresa, producto o propuesta de valor diseñada para despertar el interes del oyente |
| Estructura STAR | Un marco para responder preguntas de entrevista describiendo la Situacion, la Tarea, la Accion tomada y el Resultado obtenido |
| Entrevista tecnica | Un tipo de entrevista laboral en la que se evaluan las habilidades tecnicas del candidato mediante preguntas o ejercicios practicos |

**Glosario del modulo 4:**

| Termino | Definicion |
|---------|------------|
| IA generativa | Tecnologia de inteligencia artificial capaz de generar nuevo contenido (texto, codigo, imagenes) basandose en patrones aprendidos de grandes cantidades de datos |
| Prompt | Una instruccion o pregunta que se le da a una herramienta de IA para obtener una respuesta o resultado especifico |
| Insignia digital (badge) | Una certificacion digital verificable que acredita la consecucion de un logro educativo o profesional |

---

## Actividades del curso

**Modulo 1 — Learn About Capstone Basics:**

Actividades practicas:
- Diario de datos: Preparar su proyecto: reflexion escrita sobre el escenario elegido — que pregunta de negocio se va a responder, que datos se necesitan y como se va a estructurar el case study

Lecturas clave:
- Panorama del curso 8: estructura del capstone, los cuatro modulos y que se produce en cada uno
- Consejos y recursos utiles: recursos de apoyo para completar el capstone — documentacion de herramientas, ejemplos de case studies publicados, comunidades de ayuda
- Explorar Portfolio: ejemplos de portfolios reales de graduados del certificado — que incluyen, como estan estructurados, que herramientas usan
- Su Portfolio y la lista de control de casos de exito: checklist de los elementos que debe tener un case study completo — pregunta SMART, evaluacion ROCCC, log de limpieza, visualizaciones, recomendaciones
- Revisar las rutas de acceso a los Datos: resumen de los tracks disponibles (Cyclistic, Bellabeat, o caso propio) y criterios para elegir el mas adecuado

Otras actividades:
- Presentacion del proyecto final (video, 5 min): introduccion al capstone — que es, para que sirve, que se va a producir
- Rishie: Lo que buscan los empleadores en los analistas de datos (video, 3 min): perspectiva de reclutador sobre que diferencia un case study mediocre de uno que consigue entrevistas
- El mejor de su clase (video, 7 min): ejemplos de case studies de alta calidad — que tienen en comun
- Desafio del modulo 1 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: estudios de caso profesionales: evalua concepto de portfolio, estrategias para completar case studies, caracteristicas de calidad del portfolio y plataformas de almacenamiento (GitHub, Kaggle, Tableau)

**Modulo 2 — Build Your Portfolio:**

Actividades practicas:
- Actividad practica: Anadir su Portfolio a Kaggle: crear un perfil publico en Kaggle, subir el notebook del case study y configurar la visibilidad y descripcion del proyecto

Cuestionarios de practica:
- Pon a prueba tus conocimientos: completar un estudio de caso: evalua las seis fases del proceso de analisis aplicadas al case study — Ask (enunciado de la tarea empresarial), Prepare (fuentes de datos), Process (limpieza de datos), Analyze (resumen de hallazgos), Share (visualizaciones) y Act (recomendaciones y oportunidades futuras)

Lecturas clave:
- Introduccion a la creacion de su Portfolio: como estructurar el portfolio online — que plataformas usar, que proyectos incluir, como redactar las descripciones
- Elija el tema de su estudio de caso: criterios para elegir entre Cyclistic, Bellabeat o un caso propio — volumen de datos, herramientas preferidas, tiempo disponible
- Detalles del Seguimiento A: instrucciones detalladas para el caso Cyclistic — donde descargar los datos, que preguntas de negocio explorar, que herramientas usar
- CASO DE EXITO 1 — Como consigue un sistema de bicicletas compartidas un exito rapido: enunciado completo del caso Cyclistic con el contexto de negocio, los stakeholders y las preguntas a responder
- Estudio de caso 2 — Como puede una empresa de bienestar jugar de forma inteligente: enunciado del caso Bellabeat con el contexto, el dataset Fitbit y las preguntas de marketing a responder
- Detalles del Seguimiento B: instrucciones para el track de caso propio — como encontrar un dataset de calidad, como formular la pregunta de negocio, criterios de evaluacion
- Estudios de caso 3 — Siga su propia ruta de acceso a los casos de exito: orientaciones para crear un case study con datos propios o datasets publicos no incluidos en los tracks A y B
- Recursos para explorar otros estudios de caso: enlaces a Kaggle Datasets, Google Dataset Search, data.gov y otras fuentes para el track libre
- Hoja de ruta de Capstone: cronograma sugerido para completar el case study — cuanto tiempo dedicar a cada fase del proceso de analisis

Otras actividades:
- Comience con su caso de exito (video, 3 min): instrucciones para empezar el capstone — elegir el track, descargar los datos, configurar el entorno
- Potencial ilimitado con estudios de casos de analisis de datos (video, 1 min): motivacion para el proyecto final
- Comparta su Portfolio (video, 3 min): como publicar el case study en Kaggle o GitHub y compartirlo con reclutadores

**Modulo 3 — Use Your Portfolio:**

Lecturas clave:
- Introduccion a compartir su trabajo: cuando y como compartir el portfolio — LinkedIn, aplicaciones de empleo, redes de datos
- El proceso de la entrevista: fases tipicas de un proceso de seleccion para analista de datos junior — screening, entrevista tecnica, entrevista de competencias
- Introduccion de la serie de videos de escenarios: contexto de los videos de entrevista simulada — cuatro escenarios distintos con el mismo candidato (Connor)
- Negociar su contrato: como evaluar y negociar una oferta de trabajo — salario base, beneficios, horario, oportunidades de crecimiento

Otras actividades:
- Hablar de su Portfolio (video, 4 min): como describir el case study en 2 minutos — elevator pitch estructurado con el problema, el proceso y los resultados
- Video del escenario: Presentaciones (video, 7 min): entrevista simulada donde el candidato presenta su case study — buenas y malas practicas
- Video del escenario: Estudio de caso (video, 6 min): entrevista simulada con preguntas sobre decisiones metodologicas del case study — como justificar las herramientas y la limpieza
- Video de situacion: Resolucion de problemas (video, 3 min): entrevista simulada con un problema analitico nuevo — como estructurar el razonamiento en voz alta
- Video de situacion: Negociar las condiciones (video, 3 min): simulacion de negociacion salarial — como responder a una oferta y como pedir un numero
- Nathan: VetNet y dar consejos a los veterinarios (video, 3 min): testimonio de graduado del certificado sobre como uso el case study para conseguir su primer trabajo
- Autorreflexion: Pula su Portfolio: revision del case study propio con la checklist del modulo 1 — identificar que mejorar antes de compartirlo

Cuestionarios de practica:
- Pon a prueba tus conocimientos: tecnicas eficaces de entrevista: evalua creacion del elevator pitch, proposito de la presentacion del case study en entrevistas, como compartir contexto personal y estrategias de preparacion

**Modulo 4 — Put Your Certificate to Work:**

Actividades practicas:
- Actividad: Utilizar IA generativa para explorar visualizaciones de datos: usar herramientas de IA generativa (como Gemini) para generar ideas de visualizacion, mejorar el codigo de graficos y explorar enfoques alternativos para los datos del capstone

Lecturas clave:
- Introduccion a la IA en la Analitica de datos: como la IA generativa esta cambiando el rol del analista de datos — tareas que se automatizan y habilidades que se vuelven mas valiosas
- Utilice la IA generativa para trabajar de forma mas inteligente y rapida: casos de uso practicos de IA en analisis — generar codigo, depurar errores, resumir datasets, generar hipotesis
- Utiliza la IA para mejorar tu codigo Python: como usar prompts efectivos para mejorar scripts de pandas, depurar errores comunes y optimizar consultas
- Claves de la IA para la Analitica de datos: principios para usar IA de forma responsable — verificar los outputs, no compartir datos sensibles, documentar el uso de IA en el case study
- Da el siguiente paso con Google IA Essentials: introduccion al curso gratuito de Google sobre IA — como complementar el certificado con habilidades de IA
- Muestre su trabajo: instrucciones para publicar el case study definitivo y preparar el portfolio para aplicar a empleos
- Reclame su insignia de certificado de Google Analytics de datos: como reclamar el badge en Credly y anadirlo a LinkedIn
- Amplíe su experiencia profesional en Datos: recursos de busqueda de empleo — plataformas, como redactar el CV de analista de datos, como preparar entrevistas tecnicas
- Recursos para los graduados del Certificado en Analitica de datos de Google: acceso a Big Interview, Byteboard, red de graduados y ofertas de empleo de socios del programa

Otras actividades:
- Myles: Impulsar el impacto de la IA en el lugar de trabajo (video, 2 min): perspectiva de un analista de Google sobre como usar IA en el dia a dia sin perder rigor analitico
- Aumente sus conocimientos de analisis de datos con IA (video, 6 min): demostracion de casos de uso de IA en el flujo de trabajo de un analista
- Limpie y prepare los datos con ayuda de la IA (video, 3 min): como usar prompts para acelerar la limpieza de datos en Python o SQL
- Organizar datos y crear formulas mediante IA (video, 5 min): uso de IA para generar formulas en Sheets o consultas SQL
- Utilice la IA para formular preguntas mas eficaces (video, 2 min): como la IA puede ayudar a refinar la pregunta de negocio del case study
- Cree visualizaciones de datos atractivas con IA (video, 3 min): usar IA para sugerir tipos de grafico y generar codigo de visualizacion
- Enhorabuena por haber finalizado su Proyecto Capstone (video, 1 min): cierre del capstone
- Explore las oportunidades profesionales (video, 3 min): siguientes pasos post-certificacion — como buscar empleo, construir red profesional y seguir aprendiendo
- Evaluacion del curso (quiz calificado final)

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

Diferencia con los ejercicios del certificado: en el capstone no esta
predefinido que analizar. Decidir que columnas derivar, que comparar y
que visualizar es parte del trabajo analitico, no un paso previo.

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
