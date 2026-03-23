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
- Introduccion al analisis de datos (video)
- Pensamiento analitico: los 5 aspectos (video)
- Reflexion: como piensas sobre los datos (lectura)
- Cuestionario de practica: pensamiento analitico (quiz)
- Desafio del modulo 1 (quiz calificado)

**Modulo 2 — The Wonderful World of Data:**
- El ciclo de vida del dato (video)
- El proceso de analisis Ask-Prepare-Process-Analyze-Share-Act (video)
- Actividad practica: explorar conjuntos de datos reales (hands-on)
- Glosario del modulo 2 (lectura)
- Desafio del modulo 2 (quiz calificado)

**Modulo 3 — Set Up Your Data Analytics Toolbox:**
- Introduccion a las hojas de calculo (video)
- Introduccion a SQL y BigQuery (video)
- Actividad practica: crear una cuenta BigQuery y explorar datos publicos (hands-on)
- Actividad practica: explorar herramientas de visualizacion (hands-on)
- Desafio del modulo 3 (quiz calificado)

**Modulo 4 — Become a Fair and Impactful Data Professional:**
- Etica de datos: los 6 aspectos (video)
- Privacidad y anonimizacion (video)
- Tipos de analista segun tipo de empresa (lectura)
- Desafio del modulo 4 (quiz calificado)
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
