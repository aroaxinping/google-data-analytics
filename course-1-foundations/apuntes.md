# Apuntes — Course 1: Foundations: Data, Data, Everywhere

**Duracion:** 13 horas
**Modulos:** 4

---

## Que cubre este curso

Introduccion al mundo del analisis de datos: que hace un analista, como piensa,
que herramientas usa y como encaja el trabajo en una empresa. No hay codigo
todavia, es todo conceptual.

---

## Modulo 1: Introducing Data Analytics and Analytical Thinking

Lo primero que hace el curso es definir que es exactamente el analisis de datos
y por que importa. Mas util de lo que parece, porque mucha gente empieza a
aprender herramientas sin tener clara la respuesta a "para que sirvo yo como
analista en una empresa".

**Conceptos clave:**

- **Analisis de datos:** recopilar, transformar y organizar datos para sacar
  conclusiones, hacer predicciones y tomar decisiones informadas
- **Analista de datos vs cientifico de datos:** el analista responde preguntas
  con datos existentes; el cientifico crea modelos nuevos y trabaja con ML
- **Pensamiento analitico:** cinco aspectos clave que definen como piensa un
  buen analista:
  1. Visualizacion (ver los datos de formas diferentes)
  2. Estrategia (planificar el proceso antes de ejecutarlo)
  3. Orientacion al problema (no perder de vista la pregunta original)
  4. Correlacion (identificar relaciones entre variables)
  5. Pensamiento de gran cuadro y detalle (ver el conjunto y los detalles)

---

## Modulo 2: The Wonderful World of Data

El ciclo de vida del dato y el proceso de analisis. Dos cosas distintas que
es facil confundir.

**El ciclo de vida del dato (6 fases):**

```
Planificar -> Capturar -> Gestionar -> Analizar -> Archivar -> Destruir
```

- **Planificar:** que datos necesito, como los voy a recoger, quienes los usaran
- **Capturar:** recopilar datos de fuentes primarias o secundarias
- **Gestionar:** como se almacenan, que herramientas se usan, quien tiene acceso
- **Analizar:** usar los datos para responder preguntas y tomar decisiones
- **Archivar:** guardar datos relevantes para referencias futuras
- **Destruir:** eliminar datos con metodos seguros (especialmente datos sensibles)

**El proceso de analisis (6 fases) - el que usamos en el certificado:**

```
Ask -> Prepare -> Process -> Analyze -> Share -> Act
```

La diferencia: el ciclo de vida del dato es sobre los datos en si; el proceso
de analisis es sobre lo que hace el analista con esos datos.

---

## Modulo 3: Set Up Your Data Analytics Toolbox

Presentacion de las herramientas. No se aprende a usarlas aqui, solo se
entiende para que sirve cada una.

**Las 4 herramientas del certificado:**

| Herramienta | Tipo | Para que |
|-------------|------|----------|
| Google Sheets / Excel | Hoja de calculo | Datasets pequenos, analisis rapido |
| SQL / BigQuery | Lenguaje de consulta | Datasets grandes, extraer datos |
| Tableau | Visualizacion | Dashboards interactivos |
| Python | Programacion | Analisis avanzado, automatizacion |

**Formula basica de hoja de calculo:**
- Siempre empieza con `=`
- Ejemplo: `=SUM(A1:A10)`, `=AVERAGE(B2:B20)`

**Query SQL basica:**
```sql
SELECT columna1, columna2
FROM tabla
WHERE condicion;
```

---

## Modulo 4: Become a Fair and Impactful Data Professional

El lado humano del analisis de datos: etica, impacto, y donde encaja este
trabajo en diferentes tipos de empresa.

**Etica de datos — los 6 aspectos:**

1. **Propiedad:** los individuos son duenos de sus propios datos
2. **Transparencia de transacciones:** hay que documentar como se usan los datos
3. **Consentimiento:** pedir permiso antes de usar datos personales
4. **Privacidad:** proteger la informacion sensible de las personas
5. **Apertura:** compartir datos cuando sea beneficioso y etico
6. **Anonimizacion:** eliminar informacion identificable cuando sea posible

**Tipos de analista segun empresa:**
- Startup: generalista, hace de todo, mucha autonomia
- PYME: mas especializado, colabora con equipos pequenos
- Gran empresa: rol muy especifico dentro de un equipo de datos

---

## Esquema resumido del curso

```
COURSE 1: FOUNDATIONS
|
+-- Que hace un analista de datos
|     - Define preguntas de negocio
|     - Recopila y limpia datos
|     - Analiza y comunica resultados
|
+-- Como piensa (pensamiento analitico)
|     - Visualizacion + Estrategia
|     - Orientacion al problema
|     - Correlacion + Gran cuadro/detalle
|
+-- El proceso de analisis
|     Ask -> Prepare -> Process -> Analyze -> Share -> Act
|
+-- Las herramientas
|     Sheets -> SQL -> Tableau -> Python
|
+-- Etica de datos
      Propiedad, consentimiento, privacidad, anonimizacion
```

---

## Actividades del curso

**Modulo 1 — Introducing Data Analytics and Analytical Thinking:**

Actividades practicas:
- Identificar tipos de datos en una hoja de calculo: explorar una hoja de calculo real e identificar que tipo de dato hay en cada columna (numerico, texto, booleano, fecha)

Lecturas clave:
- Nuevas perspectivas de datos: como distintos roles de empresa usan los mismos datos de formas distintas
- Como abordan las tareas los analistas de datos: el flujo mental tipico de un analista al recibir un problema de negocio

Otras actividades:
- Bienvenido al certificado de Google Analytics de datos (video, 1 min): presentacion del programa
- Introduccion al curso (video, 4 min): que se va a aprender en este curso
- Analitica de datos en la vida cotidiana (video, 4 min): ejemplos de analisis de datos en decisiones del dia a dia
- Cassie: Dimensiones de la Analitica de datos (video): perspectiva de una data scientist de Google
- Que es el ecosistema de datos (video, 4 min): diferencias entre datos, bases de datos, datasets y ecosistema de datos
- Como informan los Datos para tomar mejores decisiones (video): datos orientados a objetivos vs datos orientados a intuicion
- Descubra los conjuntos de competencias de datos (video): habilidades tecnicas y no tecnicas del analista
- Competencias clave de analista de datos (video, 6 min): los cinco aspectos del pensamiento analitico
- Todo sobre el pensamiento analitico (video, 5 min): profundizacion en los cinco aspectos
- Explore las Destrezas analiticas basicas (video, 4 min): como aplicar el pensamiento analitico en situaciones reales
- Los datos impulsan el exito (video, 4 min): casos de negocio donde los datos generaron impacto medible
- La magia de los datos testigo (video, 5 min): entrevista con profesional que uso datos para resolver un problema real
- Desafio del modulo 1 (quiz calificado — completado)

**Modulo 2 — The Wonderful World of Data:**

Lecturas clave:
- Variaciones del Ciclo de vida de los datos: como distintas organizaciones (gobierno, sanidad, finanzas) adaptan el ciclo de vida del dato a sus necesidades
- Mas sobre las fases del Analisis de datos y este Programa: como cada fase de Ask-Prepare-Process-Analyze-Share-Act se corresponde con un curso del certificado

Otras actividades:
- Conozca las fases y herramientas de los Datos (video, 2 min): introduccion rapida al modulo
- Etapas del Ciclo de vida de los datos (video, 4 min): Plan-Capture-Manage-Analyze-Archive-Destroy con ejemplos
- Las fases del Analisis de datos y este Programa (video, 6 min): Ask-Prepare-Process-Analyze-Share-Act explicado fase a fase
- Molly: Ejemplo del proceso de analisis de datos (video, 6 min): caso practico real de una analista siguiendo el proceso
- Explore las herramientas del analista de datos (video, 6 min): hojas de calculo, SQL, herramientas de visualizacion
- Autorreflexion: Repasar conceptos anteriores (quiz de practica, 20 min): autoevaluacion de conceptos del modulo 1
- Desafio del modulo 2 (quiz calificado — completado al 90%)

**Modulo 3 — Set Up Your Data Analytics Toolbox:**

Actividades practicas:
- Actividad practica: Generar un grafico a partir de una hoja de calculo: abrir un dataset en Google Sheets, seleccionar datos y crear un grafico basico con Insert > Chart

Lecturas clave:
- Paso a paso: Haga de las hojas de calculo su amigo: tutorial de primeros pasos en Google Sheets — abrir un dataset, entender filas/columnas/celdas, y crear un grafico de barras basico
- Guia SQL: Comenzar: estructura basica de una query SELECT-FROM-WHERE y como leer los resultados en BigQuery
- Infinitas posibilidades SQL: casos de uso de SQL en el mundo real mas alla de las queries basicas
- Planificacion de una visualizacion de datos: como elegir el tipo de grafico correcto segun el tipo de pregunta (comparacion, tendencia, proporcion, relacion)

Otras actividades:
- Los entresijos de las herramientas de datos basicos (video, 2 min): presentacion del modulo
- Haga de las hojas de calculo su amigo (video, 8 min): interfaz de Sheets, tipos de datos, formulas basicas =SUM =AVERAGE
- SQL en accion (video, 3 min): demostracion de una query sencilla en BigQuery
- Conviertase en un genio de la visualizacion de Datos (video, 5 min): introduccion a Tableau y a por que la visualizacion importa
- Lilah: El poder de una visualizacion (video, 2 min): caso real de como un grafico comunico algo que los numeros no podian
- Desafio del modulo 3 (quiz calificado — completado)

**Modulo 4 — Become a Fair and Impactful Data Professional:**

Lecturas clave:
- Considere la equidad: definicion de fairness en analisis de datos, sesgos comunes en datasets y como mitigarlos

Otras actividades:
- Pongamonos manos a la obra (video, 49 seg): introduccion al modulo
- El trabajo de un analista de datos (video, 4 min): que hace un analista en un dia tipico de trabajo
- El poder de los Datos en los Negocios (video, 4 min): como los datos influyen en decisiones de negocio reales
- Comprender los Datos y la Equidad (video, 5 min): sesgos en datos, como identificarlos y como tomar decisiones mas justas
- Alex: Decisiones justas y eticas sobre los datos (video, 3 min): testimonio de analista sobre etica en su trabajo diario
- Autorreflexion: Uso empresarial de los Datos (practica, 20 min): reflexion sobre como usaria datos en un escenario de negocio real
- Autorreflexion: Casos de negocio (practica, 20 min): analizar casos practicos de uso de datos en empresas reales
- Desafio del modulo 4 (quiz calificado — completado)
- Evaluacion del curso (quiz calificado final)

---

## Errores comunes

- **Confundir el ciclo de vida del dato con el proceso de analisis:** son dos marcos distintos. El ciclo de vida del dato describe lo que le pasa al dato (planificar, capturar, gestionar, analizar, archivar, destruir); el proceso de analisis describe lo que hace el analista (Ask, Prepare, Process, Analyze, Share, Act). Mezclarlos genera confusion sobre en que fase del trabajo estas.
- **Asumir que correlacion implica causalidad:** el error estadistico mas frecuente en analisis de datos. Que dos variables se muevan juntas no significa que una cause la otra. Siempre hay que buscar factores de confusion y ser cuidadoso con como se comunican los hallazgos.
- **Pensar que el analisis empieza con las herramientas:** el instinto de "voy a abrir Sheets y ver que hay" lleva a analisis sin direccion. El analisis empieza con una pregunta clara. Sin pregunta, los datos no tienen contexto y los hallazgos no tienen utilidad.
- **Ignorar la etica desde el principio:** la privacidad y el consentimiento no son un paso final, son consideraciones que afectan a como recoges los datos, como los almacenas y como los presentas.

---

## Conexion con otros cursos

- El framework Ask-Prepare-Process-Analyze-Share-Act introducido aqui es la columna vertebral de todos los cursos siguientes. Cada curso del certificado cubre una fase: curso 2 = Ask, curso 3 = Prepare, curso 4 = Process, curso 5 = Analyze, curso 6 = Share, curso 8 = Act (capstone).
- Las herramientas presentadas en el modulo 3 (Sheets, SQL, Tableau, Python) se aprenden en profundidad en los cursos 2-3 (Sheets), 3-5 (SQL), 6 (Tableau) y 7 (Python).
- Los principios de etica de datos del modulo 4 reaparecen en el curso 3 al evaluar fuentes con ROCCC y en el curso 8 al documentar las limitaciones del capstone.
- El pensamiento analitico descrito en el modulo 1 es el marco mental que se aplica a cada decision de los cursos posteriores: formular la pregunta correcta (curso 2), evaluar credibilidad de datos (curso 3), elegir como limpiar (curso 4), interpretar hallazgos (curso 5).

---

## Lo mas importante de este curso

El framework Ask -> Prepare -> Process -> Analyze -> Share -> Act es la columna
vertebral de todo el certificado. Cada curso cubre una o dos fases de este
proceso. Entenderlo bien aqui facilita todo lo que viene despues.

El otro concepto que vale la pena interiorizar: los analistas no solo saben
usar herramientas, piensan de una manera especifica. Las herramientas se pueden
aprender en semanas; la forma de pensar analitica se desarrolla con practica.
