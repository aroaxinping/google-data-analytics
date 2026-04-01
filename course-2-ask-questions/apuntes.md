# Apuntes — Course 2: Ask Questions to Make Data-Driven Decisions

**Duracion:** 15 horas
**Modulos:** 4

---

## Que cubre este curso

La fase "Ask" del proceso de analisis y como comunicarse con stakeholders.
Tambien introduce Sheets con mas profundidad: no solo calculos basicos, sino
pensar en tablas, estructuras y herramientas como VLOOKUP y pivot tables.

---

## Modulo 1: Ask Effective Questions

El trabajo del analista empieza mucho antes de tocar datos. Empieza por
formular bien la pregunta.

**Framework SMART para preguntas:**

| Letra | Criterio | Ejemplo malo | Ejemplo bueno |
|-------|----------|--------------|---------------|
| S - Specific | Especifica | "Hay problemas con ventas?" | "Que productos bajaron >15% en Q1?" |
| M - Measurable | Medible | "Va bien la app?" | "Cual es la retencion a 7 dias?" |
| A - Action-oriented | Orientada a accion | "Que paso?" | "Que podemos hacer para mejorar X?" |
| R - Relevant | Relevante | (no aporta a la decision) | (directamente util para el negocio) |
| T - Time-bound | Acotada en tiempo | "En general" | "En Q1 2024 vs Q1 2023" |

**Tipos de problemas que resuelve un analista:**

1. Hacer predicciones
2. Categorizar cosas
3. Detectar anomalias
4. Identificar temas
5. Descubrir conexiones
6. Encontrar patrones

**Pensamiento estructurado:** antes de analizar, definir claramente
el problema, el contexto disponible, los desafios y la solucion esperada.

---

## Modulo 2: Make Data-Driven Decisions

Como los datos influyen en las decisiones de negocio y la diferencia entre
decisiones basadas en datos vs basadas en intuicion.

**Datos cualitativos vs cuantitativos:**

- **Cuantitativos:** numericos, medibles (ventas, edad, tiempo)
- **Cualitativos:** descriptivos, no numericos (opinion, categoria, texto)

Los dos tipos se usan juntos. Los cuantitativos responden "cuanto/cuantos",
los cualitativos responden "por que" y "como".

**Metricas:**
Una metrica es una medicion unica que se puede usar para evaluar rendimiento.
Ejemplo: tasa de conversion, NPS, tiempo en pagina.

**Reports vs Dashboards:**

| Report | Dashboard |
|--------|-----------|
| Estatico, para un momento concreto | Dinamico, se actualiza en tiempo real |
| Historico | Presente y tendencias |
| Para una audiencia especifica | Para monitoreo continuo |
| Mas detallado | Mas visual y resumido |

---

## Modulo 3: Spreadsheet Magic

El modulo mas largo del curso (7 horas). Sheets como herramienta real de
analisis, no solo para escribir listas.

**Organizar datos en Sheets:**
- Cada columna = un atributo (nombre, fecha, precio...)
- Cada fila = un registro/observacion
- Primera fila = cabeceras descriptivas
- Sin celdas combinadas en datos (rompen los filtros y formulas)

**Funciones esenciales:**

```
=SUM(rango)          -> sumar
=AVERAGE(rango)      -> media
=COUNT(rango)        -> contar celdas con numeros
=COUNTA(rango)       -> contar celdas no vacias
=MAX(rango)          -> valor maximo
=MIN(rango)          -> valor minimo
=IF(condicion, si, no)  -> logica condicional
=COUNTIF(rango, criterio)  -> contar con condicion
=SUMIF(rango, criterio, suma_rango)  -> sumar con condicion
```

**VLOOKUP — buscar en otra tabla:**
```
=VLOOKUP(valor_buscado, rango_tabla, columna_retorno, FALSE)
```
- El ultimo parametro: FALSE = coincidencia exacta (siempre asi para IDs)
- La columna_retorno es relativa al rango, no a la hoja completa

**Tablas pivot:**
- Insert > Pivot table
- Rows: dimension por la que agrupar
- Values: metrica a calcular (SUM, COUNT, AVERAGE...)
- Filters: para segmentar
- Equivalente en SQL: GROUP BY

**Errores comunes en Sheets:**

| Error | Causa |
|-------|-------|
| #DIV/0! | Division entre cero o celda vacia |
| #VALUE! | Tipo de dato incorrecto en formula |
| #REF! | Referencia a celda que no existe |
| #N/A | VLOOKUP no encuentra el valor |
| #NAME? | Nombre de funcion mal escrito |

---

## Modulo 4: Always Remember the Stakeholder

Comunicacion con stakeholders: una de las habilidades menos tecnicas pero
mas importantes de un analista.

**Tipos de stakeholders:**
- **Ejecutivos:** quieren el resumen, impacto en negocio, sin tecnicismos
- **Managers:** quieren contexto, proceso, pueden entender algo de tecnico
- **Equipo analitico:** pueden ver todo el detalle tecnico

**Reglas de comunicacion:**
- Adaptar el nivel tecnico a la audiencia
- Dar contexto antes de los datos (por que importa esto)
- Ser proactivo con las limitaciones de los datos
- No esperar a que pregunten: anticipar las dudas mas probables

**Lidiar con datos insuficientes:**
- Comunicarlo a tiempo, no al final
- Proponer alternativas (proxies, periodos distintos, fuentes adicionales)
- Documentar las limitaciones en el analisis final

---

## Esquema resumido del curso

```
COURSE 2: ASK QUESTIONS
|
+-- Formular la pregunta correcta
|     Framework SMART
|     Tipos de problemas analiticos
|
+-- Datos y decisiones
|     Cualitativo vs cuantitativo
|     Metricas
|     Reports vs Dashboards
|
+-- Sheets como herramienta de analisis
|     Estructura de datos en tabla
|     Funciones: SUM, IF, COUNTIF, VLOOKUP
|     Tablas pivot = GROUP BY visual
|
+-- Comunicacion con stakeholders
      Adaptar el mensaje a la audiencia
      Ser proactivo con limitaciones
```

---

## Glosarios por modulo

**Glosario del modulo 1:**

| Termino | Definicion |
|---------|------------|
| Pregunta orientada a la accion | Una pregunta cuyas respuestas llevan a un cambio |
| Habilidades analiticas | Cualidades y caracteristicas asociadas con usar hechos para resolver problemas |
| Pensamiento analitico | Identificar y definir un problema y luego resolverlo usando datos de forma organizada y paso a paso |
| Atributo | Una caracteristica o cualidad de datos usada para etiquetar una columna en una tabla |
| Tarea empresarial | La pregunta o problema que el analisis de datos resuelve para una empresa |
| Nube | Un lugar para guardar datos en linea, en lugar de en el disco duro de un ordenador |
| Contexto | La condicion en la que algo existe o sucede |
| Datos | Una coleccion de hechos |
| Analisis de datos | La recopilacion, transformacion y organizacion de datos para sacar conclusiones, hacer predicciones y tomar decisiones informadas |
| Analista de datos | Alguien que recopila, transforma y organiza datos para ayudar a tomar decisiones informadas |
| Analitica de datos | La ciencia de los datos |
| Base de datos | Una coleccion de datos almacenados en un sistema informatico |
| Toma de decisiones basada en datos | Usar hechos para guiar la estrategia de negocio |
| Ecosistema de datos | Los distintos elementos que interactuan entre si para producir, gestionar, almacenar, organizar, analizar y compartir datos |
| Ciclo de vida del dato | La secuencia de fases que experimentan los datos: planificar, capturar, gestionar, analizar, archivar y destruir |
| Ciencia de datos | Crear nuevas formas de modelar y entender lo desconocido usando datos en bruto |
| Estrategia de datos | La gestion de las personas, procesos y herramientas usados en analisis de datos |
| Equidad | Una cualidad del analisis de datos que no crea ni refuerza sesgos |
| Formula | Un conjunto de instrucciones que realiza un calculo usando datos en una hoja de calculo |
| Funcion | Un comando preestablecido que realiza automaticamente un proceso o tarea especifica usando datos en una hoja de calculo |
| Analisis de brechas | Metodo para examinar y evaluar como funciona un proceso actualmente para llegar al lugar deseado en el futuro |
| Pregunta orientadora | Una pregunta que lleva a las personas a responder de cierta manera |
| Pregunta medible | Una pregunta cuyas respuestas pueden cuantificarse y evaluarse |
| Observacion | Todos los atributos de algo contenidos en una fila de una tabla de datos |
| Tipos de problemas | Los distintos tipos de tareas que encuentran los analistas de datos: hacer predicciones, categorizar cosas, detectar algo inusual, identificar temas, descubrir conexiones y encontrar patrones |
| Consulta | La forma en que usamos SQL para comunicarnos con la base de datos |
| Lenguaje de consulta | Un lenguaje de programacion que permite recuperar y manipular datos de una base de datos |
| Pregunta relevante | Una pregunta que tiene significado para el problema a resolver |
| Causa raiz | La razon por la que ocurre un problema |
| Metodologia SMART | Un metodo para determinar la eficacia de una pregunta. Una pregunta eficaz es Especifica, Medible, Orientada a la accion, Relevante y Acotada en el tiempo |
| Pregunta especifica | Una pregunta que es simple, significativa y centrada en un solo tema o unas pocas ideas estrechamente relacionadas |
| Hoja de calculo | Un documento electronico en el que los datos se organizan en filas y columnas de una cuadricula |
| Partes interesadas | Personas que han invertido tiempo, interes y recursos en los proyectos en los que trabajaras como analista de datos |
| Pensamiento estructurado | El proceso de reconocer el problema o situacion actual, organizar la informacion disponible, revelar brechas y oportunidades, e identificar opciones |
| Mentalidad tecnica | La capacidad de descomponer las cosas en pasos o piezas mas pequenas y trabajar con ellas de forma ordenada y logica |
| Pregunta acotada en el tiempo | Una pregunta que especifica el periodo de tiempo que se va a estudiar |
| Pregunta injusta | Una pregunta que hace suposiciones o es dificil de responder honestamente |
| Visualizacion | La representacion grafica de informacion |

**Glosario del modulo 2:**

| Termino | Definicion |
|---------|------------|
| Algoritmo | Un proceso o conjunto de reglas a seguir para una tarea especifica |
| Datos grandes | Conjuntos de datos grandes y complejos que tipicamente abarcan largos periodos de tiempo y permiten a los analistas abordar problemas empresariales de gran alcance |
| Panel de control | Monitorea datos entrantes en tiempo real |
| Toma de decisiones inspirada en datos | Explorar diferentes fuentes de datos para descubrir que tienen en comun |
| Metrica | Un tipo de dato unico y cuantificable que se puede usar para la medicion |
| Objetivo de metrica | Un objetivo medible establecido por una empresa y evaluado usando metricas |
| Tabla dinamica | Una herramienta de resumen de datos usada en el procesamiento de datos para resumir, ordenar, reorganizar, agrupar, contar, sumar o promediar datos almacenados en una base de datos |
| Grafico dinamico | Un grafico creado a partir de los campos de una tabla dinamica |
| Datos cualitativos | Medidas subjetivas o explicativas de cualidades y caracteristicas |
| Datos cuantitativos | Medidas especificas y objetivas de hechos numericos |
| Informe | Una coleccion estatica de datos que se entrega periodicamente a las partes interesadas |
| Retorno de la inversion (ROI) | Una formula disenada usando metricas que permite a una empresa saber que tan bien va una inversion |
| Datos pequenos | Puntos de datos especificos que tipicamente involucran un corto periodo de tiempo y son utiles para la toma de decisiones diarias |

**Glosario del modulo 3:**

| Termino | Definicion |
|---------|------------|
| AVERAGE | Una funcion de hoja de calculo que devuelve un promedio de los valores de un rango seleccionado |
| Borders | Lineas que se pueden agregar alrededor de dos o mas celdas en una hoja de calculo |
| Referencia de celda | Una celda o rango de celdas en una hoja de calculo tipicamente usada en formulas y funciones |
| COUNT | Una funcion de hoja de calculo que cuenta el numero de celdas en un rango que contienen valores |
| Fill handle | Un cuadro en la esquina inferior derecha de una celda seleccionada que se puede arrastrar por celdas vecinas para continuar una instruccion |
| Filtrado | El proceso de mostrar solo los datos que cumplen los criterios especificados |
| Encabezado | La primera fila en una hoja de calculo que etiqueta el tipo de dato en cada columna |
| Expresion matematica | Un calculo que involucra suma, resta, multiplicacion o division |
| Funcion matematica | Una funcion que se usa como parte de una formula matematica |
| MAX | Una funcion de hoja de calculo que devuelve el valor numerico mas grande de un rango de celdas |
| MIN | Una funcion de hoja de calculo que devuelve el valor numerico mas pequeno de un rango de celdas |
| Datos abiertos | Datos que estan disponibles para el publico |
| Operador | Un simbolo que nombra el tipo de operacion o calculo a realizar |
| Orden de operaciones | Usar parentesis para agrupar valores de hoja de calculo para clarificar el orden en que deben realizarse las operaciones |
| Dominio del problema | El area especifica de analisis que engloba toda actividad que afecta o se ve afectada por el problema |
| Rango | Una coleccion de dos o mas celdas en una hoja de calculo |
| Alcance del trabajo (SOW) | Un esquema acordado de las tareas a realizar durante un proyecto |
| Ordenacion | El proceso de organizar datos en un orden significativo |
| SQL | Lenguaje de consulta estructurado |
| SUM | Una funcion de hoja de calculo que suma los valores de un rango seleccionado de celdas |
| Variables | Tipicamente la primera fila en una hoja de calculo que etiqueta el tipo de dato en cada columna |

**Glosario del modulo 4:**

| Termino | Definicion |
|---------|------------|
| Reencuadre | El proceso de replantear un problema o desafio y redirigirlo hacia una posible resolucion |
| TLDR | Acronimo especifico de Google que significa "Demasiado largo, no lo lei" y recuerda a las personas ser claras y concisas en su comunicacion |
| Tasa de rotacion | La tasa a la que los empleados dejan voluntariamente una empresa |

---

## Actividades del curso

**Modulo 1 — Ask Effective Questions:**

Actividades practicas:
- Autorreflexion: Preguntas SMART en accion: redactar preguntas SMART para un escenario de negocio dado (restaurante que quiere entender sus ventas)

Lecturas clave:
- Seis tipos de problemas comunes: descripcion detallada de los seis tipos de problemas analiticos (prediccion, categorizacion, anomalias, temas, conexiones, patrones) con ejemplos por tipo
- Del Problema a la Accion: Las seis fases del Analisis de datos: recordatorio de Ask-Prepare-Process-Analyze-Share-Act y como conecta con el trabajo real

Otras actividades:
- Introduccion a la resolucion de problemas y al interrogatorio eficaz (video, 3 min): presentacion del modulo
- Datos en accion (video, 5 min): ejemplo de como los datos resolvieron un problema de negocio real
- Tipos de problemas comunes (video, 5 min): los seis tipos de problemas con ejemplos
- Seguir explorando las aplicaciones empresariales (video, 6 min): casos de uso de analisis de datos en distintos sectores
- Preguntas SMART (video): introduccion al framework — Specific, Measurable, Action-oriented, Relevant, Time-bound
- Desafio del modulo 1 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: actuar a partir de los datos: evalua identificacion de audiencia objetivo y fases del proceso de analisis de datos
- Pon a prueba tus conocimientos: resolver problemas con datos: evalua categorizacion de problemas, identificacion de patrones y descubrimiento de conexiones
- Pon a prueba tus conocimientos: elaborar preguntas eficaces: evalua la metodologia SMART y la claridad en la formulacion de preguntas

**Modulo 2 — Make Data-Driven Decisions:**

Actividades practicas:
- Autorreflexion: Profundice en los cuadros de mando: analizar un dashboard real e identificar las metricas que muestra y las decisiones que apoya

Lecturas clave:
- Datos cualitativos y cuantitativos en el Negocio a negocio: ejemplos concretos de como se usan datos cualitativos (entrevistas, encuestas) y cuantitativos (ventas, clicks) en decisiones de negocio
- Herramientas para la visualizacion de datos: comparativa de herramientas (Sheets charts, Tableau, Looker) y para que sirve cada una
- Disene cuadros de mando atractivos: principios de diseno de dashboards — minimalismo, contexto, jerarquia visual

Otras actividades:
- Datos y decisiones (video, 1 min): introduccion al modulo
- Como los Datos potencian las decisiones (video, 5 min): del instinto al dato — como los datos mejoran la toma de decisiones
- Datos cualitativos y cuantitativos (video, 4 min): diferencias y como se complementan
- La gran revelacion: Comparta sus hallazgos (video, 5 min): como presentar datos a una audiencia no tecnica
- Datos frente a Metricas (video, 3 min): que es una metrica, que es un KPI y como se relacionan
- Pensamiento matematico (video, 4 min): como pensar en terminos de porcentajes, ratios y comparaciones para comunicar datos
- Big data y small data (video): diferencias de escala y herramientas segun el volumen de datos
- Desafio del modulo 2 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: el poder de los datos: evalua tipos de datos (cuantitativos y cualitativos) y fundamentos de algoritmos
- Pon a prueba tus conocimientos: seguir la evidencia: evalua reports, dashboards y frameworks para tomar decisiones basadas en datos
- Pon a prueba tus conocimientos: conectar los puntos de datos: evalua diferencias entre small data y big data y las cuatro V del big data

**Modulo 3 — Spreadsheet Magic:**

Actividades practicas:
- Actividad practica: Introduccion a Google Sheets: crear una hoja de calculo desde cero, introducir datos, dar formato a celdas y usar auto-fill
- Actividad practica: Analisis de datos y formulas — Estadisticas de ventas en panaderia: usar SUM, AVERAGE, MAX, MIN y formulas aritmeticas sobre datos de ventas de una panaderia ficticia
- Actividad practica: Funciones para el analisis de hojas de calculo: usar IF, COUNTIF y SUMIF sobre un dataset para responder preguntas especificas

Lecturas clave:
- Paso a paso: Tareas basicas con hojas de calculo: como navegar Sheets, seleccionar rangos, usar auto-fill, congelar filas/columnas con View > Freeze, y ordenar con Data > Sort range
- Paso a paso: Formulas para el exito: formulas de calculo basicas (=SUM, =AVERAGE, =MAX, =MIN, =COUNT), referencias absolutas vs relativas ($A$1 vs A1), y como escribir una formula con multiples operaciones

Otras actividades:
- La asombrosa hoja de calculo (video, 1 min): introduccion al modulo
- Pongase a trabajar con hojas de calculo (video, 2 min): casos de uso de Sheets en analisis de datos
- Tareas basicas de hoja de calculo (video, 4 min): navegar Sheets, editar celdas, dar formato
- Formulas para el exito (video, 7 min): demostracion de formulas basicas en Sheets
- Hoja de calculo errores y correcciones (video, 7 min): #DIV/0!, #VALUE!, #REF!, #N/A, #NAME? — causas y soluciones
- Desafio del modulo 3 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: usar formulas en hojas de calculo: evalua sintaxis de formulas, referencias de celdas y resolucion de errores
- Pon a prueba tus conocimientos: usar funciones en hojas de calculo: evalua aplicaciones de SUM, AVERAGE, MIN y MAX
- Pon a prueba tus conocimientos: pensamiento estructurado: evalua dominios de problemas y documentacion del alcance del trabajo

**Modulo 4 — Always Remember the Stakeholder:**

Lecturas clave:
- Trabajar con las partes interesadas: tipos de stakeholders (ejecutivos, managers, equipo tecnico, otros departamentos) y como adaptar la comunicacion a cada uno
- Utilice multiples estrategias de Comunicacion para llegar a su publico: email, reuniones, documentos, dashboards — cuando usar cada canal
- Limitaciones de los datos: como comunicar cuando los datos son insuficientes, tienen sesgo o no responden la pregunta exacta

Otras actividades:
- Comunicacion con su Equipo (video, 1 min): introduccion al modulo
- Equilibre las necesidades y expectativas de todo su Equipo (video, 4 min): como gestionar expectativas distintas de diferentes stakeholders a la vez
- Centrese en lo importante (video, 4 min): como priorizar cuando hay multiples peticiones y datos limitados
- La clave es una Comunicacion clara (video, 4 min): estructura de una comunicacion efectiva — contexto, hallazgo, siguiente accion
- Consejos para una comunicacion eficaz (video, 5 min): como presentar datos sin perder la audiencia
- Navegar por las expectativas y los objetivos realistas del Proyecto (video, 4 min): como negociar alcance y timeline con stakeholders
- El compromiso de los Datos: Velocidad frente a Exactitud (video, 4 min): cuando es aceptable entregar un analisis rapido vs cuando hay que ser riguroso
- Piense en su proceso y en el resultado (video): reflexion sobre documentar el proceso de analisis, no solo los resultados
- Desafio del modulo 4 (quiz calificado — completado)
- Evaluacion del curso (quiz calificado final)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: comunicacion clara: evalua expectativas de stakeholders y estrategias de entrega de mensajes
- Pon a prueba tus conocimientos: trabajo en equipo: evalua resolucion colaborativa de problemas y gestion de reuniones

---

## Cuando usar X vs Y

**Report vs Dashboard:**
Usar report cuando necesitas un analisis estatico para una decision concreta o para documentar hallazgos de un periodo especifico. Usar dashboard cuando necesitas monitoreo continuo de metricas que cambian con el tiempo y la audiencia consulta los datos con regularidad.

**Cualitativo vs cuantitativo:**
No son opciones excluyentes — se usan juntos. Los datos cuantitativos responden "cuanto" y "cuantos" y permiten calcular; los cualitativos responden "por que" y "como" y aportan contexto. Un analisis solo cuantitativo puede identificar que algo baja pero no por que; un analisis solo cualitativo no puede generalizar.

**VLOOKUP vs JOIN:**
VLOOKUP en Sheets para datasets pequenos que ya tienes en hojas de calculo y cuando la logica es sencilla (buscar un valor en una tabla). JOIN en SQL cuando los datasets son grandes, cuando hay multiples tablas relacionadas, o cuando necesitas combinar datos de una base de datos.

**Metrica vs KPI:**
Una metrica es cualquier medicion cuantificable. Un KPI (Key Performance Indicator) es una metrica vinculada directamente a un objetivo de negocio. Todas las KPIs son metricas, pero no todas las metricas son KPIs.

---

## Errores comunes

- **Hacer preguntas demasiado amplias:** preguntas como "por que bajan las ventas?" sin acotar tiempo, segmento ni magnitud llevan a analisis indefinidos. Una buena pregunta SMART ya contiene las condiciones de respuesta: que, cuanto, cuando y para quien.
- **Confundir metricas con KPIs:** una metrica es cualquier medicion; un KPI es una metrica vinculada a un objetivo estrategico. Reportar metricas que no conectan con ningun objetivo es trabajo que no ayuda a tomar decisiones.
- **No identificar a todos los stakeholders antes de empezar:** descubrir a mitad del analisis que hay un stakeholder clave con requisitos distintos obliga a rehacerlo. Dedicar tiempo al principio a mapear quienes tienen interes en el resultado ahorra mucho mas tiempo despues.
- **Asumir que el stakeholder quiere detalle tecnico:** ejecutivos y managers suelen necesitar el impacto en negocio, no la metodologia. Presentar demasiado detalle tecnico a la audiencia incorrecta es tan problematico como presentar demasiado poco.
- **Ignorar errores de Sheets sin entenderlos:** ver #N/A en un VLOOKUP y dejarlo sin investigar es un error de validacion. Cada error tiene una causa especifica y hay que resolverla antes de continuar con el analisis.

---

## Conexion con otros cursos

- Las preguntas SMART del modulo 1 definen directamente que datos necesitas preparar en el curso 3. Una pregunta mal formulada en esta fase lleva a preparar datos que no responden el problema real.
- La distincion report vs dashboard del modulo 2 conecta con el curso 6 (visualizacion): entender para que sirve cada formato es prerequisito para elegir el tipo de grafico correcto.
- VLOOKUP del modulo 3 es el precursor directo de los JOINs del curso 5. La logica es identica; cambia la herramienta y la escala de datos.
- El modulo 4 (comunicacion con stakeholders) conecta directamente con el curso 6 (presentaciones de analisis) y con el curso 8 (como presentar el case study del capstone).
- Las tablas pivot de Sheets del modulo 3 son el equivalente visual de GROUP BY en SQL, que se explora en profundidad en el curso 5.

---

## Lo mas importante de este curso

Dos cosas que se llevan de este curso y se usan en todos los demas:

1. **SMART questions:** si la pregunta no esta bien definida, el analisis no
   tiene direccion. Vale la pena invertir tiempo en esto antes de tocar datos.

2. **VLOOKUP / JOIN:** la capacidad de combinar datos de fuentes distintas es
   probablemente la habilidad mas usada en el dia a dia de un analista junior.
   En Sheets es VLOOKUP, en SQL es JOIN — mismo concepto, distinta sintaxis.
