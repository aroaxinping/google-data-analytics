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
- Framework SMART para preguntas (video)
- Tipos de problemas que resuelve un analista (video)
- Pensamiento estructurado: problema, contexto, desafios (lectura)
- Actividad practica: formular preguntas SMART para un escenario real (hands-on)
- Desafio del modulo 1 (quiz calificado)

**Modulo 2 — Make Data-Driven Decisions:**
- Datos cualitativos vs cuantitativos (video)
- Reports vs dashboards: cuando usar cada uno (video)
- Metricas y KPIs (lectura)
- Actividad practica: explorar ejemplos de dashboards reales (hands-on)
- Desafio del modulo 2 (quiz calificado)

**Modulo 3 — Spreadsheet Magic:**
- Organizar datos en hojas de calculo (video)
- Funciones esenciales: SUM, AVERAGE, COUNT, IF, COUNTIF (video)
- VLOOKUP: buscar datos en otra tabla (video)
- Actividad practica: crear una hoja de calculo con funciones y VLOOKUP (hands-on)
- Tablas pivot (video + lectura)
- Actividad practica: crear una tabla pivot (hands-on)
- Errores comunes en Sheets (#DIV/0!, #N/A, #REF!) (lectura)
- Desafio del modulo 3 (quiz calificado)

**Modulo 4 — Always Remember the Stakeholder:**
- Tipos de stakeholders y como comunicar con cada uno (video)
- Lidiar con datos insuficientes (video)
- Actividad practica: preparar una comunicacion para stakeholders (hands-on)
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
