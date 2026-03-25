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
