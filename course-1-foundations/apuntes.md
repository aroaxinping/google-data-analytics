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

## Lo mas importante de este curso

El framework Ask -> Prepare -> Process -> Analyze -> Share -> Act es la columna
vertebral de todo el certificado. Cada curso cubre una o dos fases de este
proceso. Entenderlo bien aqui facilita todo lo que viene despues.

El otro concepto que vale la pena interiorizar: los analistas no solo saben
usar herramientas, piensan de una manera especifica. Las herramientas se pueden
aprender en semanas; la forma de pensar analitica se desarrolla con practica.
