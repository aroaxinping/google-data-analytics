# Apuntes — Course 3: Prepare Data for Exploration

**Duracion:** 19 horas
**Modulos:** 5

---

## Que cubre este curso

La fase "Prepare" del proceso de analisis: como se generan los datos, como
se estructuran, como evaluarlos, como acceder a bases de datos con SQL
y como organizar y proteger datos correctamente.

---

## Modulo 1: Data Types and Structures

Antes de analizar hay que entender que tipo de dato tienes y como esta
organizado.

**Datos estructurados vs no estructurados:**

| Tipo | Descripcion | Ejemplo |
|------|-------------|---------|
| Estructurado | Formato fijo, tabla con filas y columnas | Base de datos, CSV, hoja de calculo |
| No estructurado | Sin formato predefinido | Email, imagen, audio, video, texto libre |
| Semi-estructurado | Algo de estructura, pero flexible | JSON, XML, HTML |

**Tipos de datos mas comunes:**

- **String / Texto:** caracteres alfanumericos ("Madrid", "activo")
- **Numerico:** enteros (34) o decimales (3.14)
- **Booleano:** solo true/false (1/0)
- **Fecha / Timestamp:** valores temporales (2024-03-15, 2024-03-15 14:30:00)

**Datos internos vs externos:**
- **Internos:** generados por la propia empresa (ventas, usuarios, logs)
- **Externos:** procedentes de fuera (encuestas, datos publicos, APIs)

**Datos discretos vs continuos:**
- **Discretos:** valores contables, sin decimales (numero de clientes: 340)
- **Continuos:** cualquier valor en un rango (temperatura: 23.7 grados)

**Datos nominales vs ordinales:**
- **Nominales:** categorias sin orden (pais, tipo de producto)
- **Ordinales:** categorias con orden (valoracion 1-5, nivel junior/mid/senior)

---

## Modulo 2: Data Responsibility

Antes de usar un dataset hay que evaluarlo criticamente.

**Framework ROCCC para evaluar credibilidad:**

| Criterio | Pregunta |
|----------|----------|
| Reliable (Fiable) | La fuente es conocida y de confianza? |
| Original | Es la fuente primaria o una copia de terceros? |
| Comprehensive | Tiene todo lo necesario para responder la pregunta? |
| Current | Los datos son suficientemente recientes? |
| Cited | La fuente original esta identificada y verificable? |

**Tipos de sesgo en datos:**

- **Sesgo de muestreo:** la muestra no representa bien a la poblacion total
- **Sesgo de observador:** el analista inconscientemente influye en como
  recoge o interpreta los datos
- **Sesgo de confirmacion:** buscar datos que confirmen lo que ya crees
- **Sesgo de interpretacion:** dos personas ven los mismos datos y sacan
  conclusiones distintas

**Etica de datos — principios:**

1. **Consentimiento informado:** la persona sabe que sus datos se usan y acepta
2. **Privacidad:** proteger informacion personal identificable (PII)
3. **Anonimizacion:** eliminar o enmascarar datos identificables
4. **Transparencia:** documentar como se recopilaron y procesaron los datos

**Datos abiertos (open data):** datos disponibles publicamente sin restricciones.
Ejemplos: datos del gobierno, BigQuery Public Datasets, Kaggle.

---

## Modulo 3: Database Essentials

El modulo mas largo del curso (casi 9 horas). Introduce SQL y las bases de
datos relacionales.

**Que es una base de datos relacional:**
Conjunto de tablas relacionadas entre si mediante claves (keys). Cada tabla
tiene filas (registros) y columnas (atributos).

**Conceptos clave:**

- **Primary key:** identificador unico de cada fila en una tabla
- **Foreign key:** columna que referencia la primary key de otra tabla
- **Schema:** estructura/diseno de la base de datos (que tablas hay y como se relacionan)
- **Metadata:** datos sobre los datos (quien creo el archivo, cuando, que significa cada columna)

**SQL basico — estructura de una query:**

```sql
SELECT columna1, columna2    -- que quiero ver
FROM nombre_tabla            -- de donde
WHERE condicion              -- filtro (opcional)
ORDER BY columna DESC        -- orden (opcional)
LIMIT 10;                    -- limitar filas (opcional)
```

**Funciones de agregacion:**

```sql
COUNT(*)           -- contar filas
SUM(columna)       -- suma
AVG(columna)       -- media
MAX(columna)       -- maximo
MIN(columna)       -- minimo
```

**Filtrar con WHERE:**

```sql
WHERE edad > 18
WHERE pais = 'Spain'
WHERE fecha BETWEEN '2024-01-01' AND '2024-12-31'
WHERE nombre IS NOT NULL
WHERE categoria IN ('A', 'B', 'C')
WHERE nombre LIKE 'Mar%'    -- empieza por "Mar"
```

**Ordenar y combinar condiciones:**

```sql
ORDER BY ventas DESC         -- mayor a menor
ORDER BY fecha ASC           -- mas antiguo primero
WHERE condicion1 AND condicion2
WHERE condicion1 OR condicion2
WHERE NOT condicion
```

**BigQuery — la plataforma de Google:**
- SQL en la nube, para datasets de millones de filas
- Cobra por datos procesados (no por tiempo)
- Siempre usar LIMIT y WHERE para acotar antes de explorar

---

## Modulo 4: Organize and Protect Data

Buenas practicas de organizacion y seguridad.

**Convencion de nombres de archivos:**

```
YYYY-MM-DD_descripcion_version.extension
Ejemplo: 2024-03-15_ventas-madrid_v2.xlsx
```

Por que: facilita ordenar cronologicamente, identificar el contenido
y saber que version es sin abrir el archivo.

**Niveles de acceso a datos:**
- **Privado:** solo el propietario
- **Interno:** solo empleados de la empresa
- **Confidencial:** equipo especifico con autorizacion
- **Publico:** cualquiera puede verlo

**Seguridad basica:**
- No compartir credenciales de bases de datos
- Usar permisos minimos necesarios (principio de minimo privilegio)
- Cifrar datos sensibles
- Hacer copias de seguridad regularmente

---

## Modulo 5: Engage in the Data Community

El modulo mas corto (~44 min). Sobre networking y presencia profesional.

- Crear perfil en LinkedIn con el progreso del certificado
- Participar en comunidades de Kaggle
- Seguir a profesionales del sector
- Documentar el aprendizaje publicamente (GitHub, blogs)

---

## Esquema resumido del curso

```
COURSE 3: PREPARE DATA
|
+-- Tipos de datos y estructuras
|     Estructurado / no estructurado / semi-estructurado
|     String, numerico, booleano, fecha
|     Discreto vs continuo | Nominal vs ordinal
|
+-- Evaluar credibilidad (ROCCC)
|     Reliable, Original, Comprehensive, Current, Cited
|     Tipos de sesgo: muestreo, observador, confirmacion
|     Etica: consentimiento, privacidad, anonimizacion
|
+-- Bases de datos y SQL
|     Modelo relacional: primary key, foreign key, schema
|     SELECT, FROM, WHERE, ORDER BY, LIMIT
|     Funciones de agregacion: COUNT, SUM, AVG, MAX, MIN
|     BigQuery: SQL en la nube para datos masivos
|
+-- Organizar y proteger
      Nombres de archivo consistentes
      Niveles de acceso
      Seguridad y copias de seguridad
```

---

## Lo mas importante de este curso

**ROCCC** es la herramienta para no caer en la trampa de asumir que cualquier
dataset que encuentras es valido. Evaluarlo antes de analizar ahorra muchos
problemas despues.

**SQL** es la habilidad mas practicamente util de este curso. Una vez que
entiendes SELECT/FROM/WHERE/GROUP BY/ORDER BY, puedes responder el 80% de
las preguntas que te haran en un trabajo de analisis de datos. El resto
se construye sobre esta base.
