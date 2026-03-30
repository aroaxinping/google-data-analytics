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

## Actividades del curso

**Modulo 1 — Data Types and Structures:**

Actividades practicas:
- Autorreflexion opcional: Datos no estructurados: reflexionar sobre ejemplos de datos no estructurados del entorno propio (emails, fotos, textos) y como se podrian estructurar

Lecturas clave:
- Formatos de datos en la practica: ejemplos reales de datos en formato CSV, JSON, bases de datos y hojas de calculo — como identificar el formato adecuado para cada caso
- Los efectos de las diferentes estructuras: por que importa elegir la estructura correcta (tabla, JSON, no estructurado) antes de recoger datos — impacto en el analisis posterior

Otras actividades:
- Introduccion a la exploracion de datos (video, 3 min): presentacion del modulo
- Recogida de datos en nuestro mundo (video, 3 min): como se generan y recogen datos en distintos contextos
- Determinar que datos recopilar (video, 3 min): criterios para elegir que datos recoger — relevancia, completitud, fiabilidad
- Descubra los formatos de datos (video, 5 min): datos estructurados vs no estructurados vs semi-estructurados con ejemplos visuales
- Seguir explorando los datos estructurados (video, 1 min): profundizacion en tablas, bases de datos y CSVs
- Desafio del modulo 1 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: recopilar datos: evalua conceptos de cookies, tipos de datos (primera, segunda y tercera parte) y el concepto de "poblacion" en datasets
- Pon a prueba tus conocimientos: formatos y estructuras de datos: evalua datos continuos vs discretos, fuentes de datos externos, caracteristicas de datos no estructurados y modelos de datos
- Pon a prueba tus conocimientos: tipos de datos, campos y valores: evalua atributos de tipos de datos, formato de texto/cadena, ubicacion de campos en tablas y estructura de datos largos

**Modulo 2 — Data Responsibility:**

Lecturas clave:
- Anonimizacion de datos: tecnicas de anonimizacion (generalizacion, supresion, perturbacion) y cuando aplicar cada una para proteger PII

Otras actividades:
- Introduccion al sesgo, la credibilidad, la privacidad y la Etica (video, 1 min): presentacion del modulo
- Sesgo: de las preguntas a las conclusiones (video, 3 min): como el sesgo puede entrar en cada fase del proceso de analisis
- Datos sesgados y no sesgados (video, 2 min): ejemplos de datasets con sesgo de muestreo y como identificarlo
- Comprender el sesgo de los datos (video, 3 min): sesgo de confirmacion, sesgo de observador y sesgo de interpretacion
- Identificar fuentes de datos correctas (video, 2 min): ROCCC — Reliable, Original, Comprehensive, Current, Cited
- Que son los Datos "malos" (video, 2 min): datos incorrectos, inconsistentes, duplicados o incompletos
- Etica de los datos esenciales (video, 4 min): consentimiento informado, privacidad, apertura y transparencia
- Dar prioridad a la privacidad de los datos (video, 1 min): diferencia entre anonimizacion y privacidad
- Desafio del modulo 2 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: datos imparciales y objetivos: evalua definiciones de sesgo, ejemplos de sesgo de muestreo, sesgo de confirmacion y terminologia del sesgo de observador
- Pon a prueba tus conocimientos: credibilidad de los datos: evalua fuentes de datos fiables, datasets verificados, evaluacion de citas y actualidad de la informacion
- Pon a prueba tus conocimientos: etica y privacidad de los datos: evalua estandares eticos, transparencia en transacciones, tecnicas de anonimizacion y procedimientos de consentimiento
- Pon a prueba tus conocimientos: datos abiertos: evalua principios de apertura, metodos de distribucion preferidos y requisitos de participacion universal

**Modulo 3 — Database Essentials:**

Actividades practicas:
- Actividad practica: Datos limpios en hojas de calculo con ordenacion y filtrado: ordenar un dataset en Sheets con Data > Sort range y aplicar filtros con Data > Create a filter para aislar subconjuntos de datos
- Actividad practica: Introduccion a BigQuery: navegar la interfaz de BigQuery, localizar un dataset publico (bigquery-public-data) y ejecutar la primera query SELECT * FROM tabla LIMIT 10
- Actividad practica: Crear una tabla personalizada en BigQuery: subir un CSV propio a BigQuery, crear un dataset y una tabla, y ejecutar queries sobre ella
- Actividad practica: Elegir la herramienta adecuada para el trabajo: dado un escenario de datos concreto, decidir si usar Sheets o BigQuery y justificarlo
- Actividad practica: Mas practica con SQL: escribir queries con WHERE, ORDER BY, LIMIT y funciones de agregacion sobre datasets publicos de BigQuery

Lecturas clave:
- Paso a paso: Importar datos de hojas de calculo y bases de datos: como importar un CSV a Sheets (File > Import), como conectar Sheets a BigQuery, y como exportar resultados de BigQuery a CSV
- Paso a paso: BigQuery en accion: navegar BigQuery, seleccionar un proyecto publico (bigquery-public-data), explorar un schema de tabla, y escribir una query SELECT basica con WHERE y ORDER BY
- Guia en profundidad: Las mejores practicas de SQL: convenciones de estilo SQL (mayusculas en keywords, indentacion), comentarios con --, como escribir queries legibles y como documentar el trabajo

Otras actividades:
- Todo sobre bases de datos (video, 2 min): introduccion a bases de datos relacionales
- Caracteristicas y componentes de la base de datos (video, 3 min): tablas, filas, columnas, primary key, foreign key
- Inspeccion de un Conjunto de datos: Una visita guiada y practica (lectura, 8 min): como explorar un dataset nuevo sistematicamente — schema, tipos de columnas, valores unicos, nulos
- Desmitificar los metadatos (video, 3 min): que son los metadatos y por que importan
- Los metadatos son tan importantes como los propios Datos (lectura, 8 min): tipos de metadatos (descriptivos, estructurales, administrativos) y su papel en la gestion de datos
- Repositorios de metadatos y metadatos (lectura, 8 min): catalogo de datos, data dictionaries y como usarlos para entender un dataset nuevo
- Tantos lugares donde encontrar datos (video, 3 min): fuentes publicas de datos — Google Dataset Search, Kaggle, datos.gob.es, BigQuery Public Datasets
- Importar datos de hojas de calculo y bases de datos (video, 3 min): importar CSV a BigQuery y conectar Sheets a datos externos
- Explorar conjuntos de datos publicos (lectura, 8 min): catalogo de datasets publicos en BigQuery y como localizarlos
- Ordenacion y filtrado para centrarse en los datos relevantes (video, 5 min): Data > Sort y Data > Filter en Sheets como primera exploracion de un dataset
- Conocza BigQuery, incluidas las opciones de sandbox y facturacion (video, 2 min): diferencias entre sandbox (gratuito) y cuenta de facturacion, limite de 1TB/mes en sandbox
- BigQuery en accion (video, 6 min): demostracion completa de una query SELECT-WHERE-ORDER BY en BigQuery
- Desafio del modulo 3 (quiz calificado — completado al 100%)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: trabajar con bases de datos: evalua tablas de bases de datos relacionales, claves primarias, procesos de normalizacion y escritura de queries
- Pon a prueba tus conocimientos: metadatos: evalua tipos de metadatos (administrativos, estructurales), evaluacion de calidad y gobierno de datos
- Pon a prueba tus conocimientos: acceder a fuentes de datos: evalua beneficios de datos abiertos, formatos de archivo CSV, importacion de datos y funciones de hojas de calculo
- Pon a prueba tus conocimientos: ordenar y filtrar: evalua tecnicas de organizacion de datos, filtrado y congelacion de filas de cabecera
- Pon a prueba tus conocimientos: usar SQL con grandes conjuntos de datos: evalua clausulas WHERE, convenciones de nomenclatura, tipos de escritura y componentes de queries

**Modulo 4 — Organize and Protect Data:**

Actividades practicas:
- Autorreflexion: Proteja sus Recursos: analizar un escenario de manejo de datos de empresa y proponer medidas de seguridad (permisos, cifrado, nomenclatura)

Lecturas clave:
- Pautas para la organizacion de archivos: estructura de carpetas recomendada para proyectos de datos (raw/, processed/, outputs/, docs/), y convencion de nombres YYYY-MM-DD_descripcion_v01

Otras actividades:
- Sientase seguro de sus datos (video, 53 seg): introduccion al modulo
- Organicemonos (video, 4 min): como crear una estructura de carpetas para un proyecto de datos y por que importa la consistencia
- Caracteristicas de seguridad en las hojas de calculo (video, 3 min): proteger hojas con contrasena en Sheets, bloquear celdas y gestionar permisos de colaboradores
- Equilibrio entre seguridad y analisis (lectura, 4 min): cuando aplicar restricciones de acceso sin bloquear el trabajo de analisis
- Desafio del modulo 4 (quiz calificado — completado al 93.75%)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: poner los datos en orden: evalua pautas consistentes para descripciones de archivos, organizacion en carpetas, estructuras jerarquicas y estrategias de nomenclatura efectiva
- Pon a prueba tus conocimientos: proteger los datos: evalua medidas de proteccion, algoritmos de cifrado, procesos de tokenizacion y seguimiento de versiones

**Modulo 5 — Engage in the Data Community:**

Actividades practicas:
- Autorreflexion: Anade Kaggle a su presencia en linea: crear o actualizar perfil de Kaggle y explorar notebooks publicos de otros analistas

Lecturas clave:
- Desarrollar una red: estrategias de networking para analistas de datos — LinkedIn, Kaggle, meetups, comunidades online

Otras actividades:
- Reflexionar y conectar con los companeros (lectura, 4 min): reflexion sobre lo aprendido en el curso y conexion con la comunidad del certificado
- Evaluacion del curso (quiz calificado final)

---

## Cuando usar X vs Y

**Datos internos vs externos:**
Los datos internos (generados por la propia empresa) son mas fiables porque conoces su origen y metodologia, pero tienen scope limitado a lo que la empresa ha medido. Los datos externos amplian el contexto pero hay que verificarlos con ROCCC antes de usarlos: su credibilidad y metodologia no siempre son transparentes.

**Fuente primaria vs secundaria:**
Usar fuente primaria cuando puedes recoger los datos directamente (encuestas propias, experimentos, logs propios) — son los mas fiables porque controlas la metodologia. Usar fuente secundaria cuando los datos primarios no estan disponibles o son demasiado costosos de obtener, pero documentando siempre quien los recogio y como.

**Nominal vs ordinal:**
Nominal cuando las categorias no tienen jerarquia entre si (colores, paises, tipos de producto) — no tiene sentido decir que "Espana es mayor que Francia". Ordinal cuando el orden entre categorias importa (satisfaccion del 1 al 5, nivel educativo, senior/mid/junior) — la posicion relativa tiene significado.

**Datos discretos vs continuos:**
Discreto cuando el valor es contable y no puede tomar cualquier valor intermedio (numero de pedidos: 3, no 3.7). Continuo cuando puede tomar cualquier valor dentro de un rango (temperatura, precio, duracion) — los decimales son validos.

**SQL vs Sheets para explorar datos:**
Sheets cuando el dataset cabe en memoria y la exploracion es visual y rapida. SQL (BigQuery) cuando el dataset tiene millones de filas, cuando los datos estan en una base de datos relacional, o cuando necesitas combinar multiples tablas.

---

## Errores comunes

- **Usar un dataset sin verificar ROCCC:** asumir que "esta en internet" o "lo usa mucha gente" significa que es fiable es uno de los errores mas frecuentes. Verificar sistematicamente cada criterio antes de usar los datos evita basar analisis en informacion incorrecta o sesgada.
- **Confundir primary key con foreign key:** la primary key identifica uniquamente cada fila en su propia tabla (no puede repetirse ni ser nula); la foreign key referencia la primary key de otra tabla para establecer la relacion entre ellas. Confundirlas rompe las queries de JOIN.
- **No documentar la fuente del dataset desde el principio:** es imposible auditar despues de donde vino un dato si no se documento al comenzar. En entornos profesionales, la trazabilidad de los datos es un requisito.
- **Hacer queries sin LIMIT en BigQuery durante exploracion:** BigQuery cobra por datos procesados, no por tiempo. Una query sin LIMIT sobre una tabla de terabytes puede procesar (y facturar) cantidades innecesarias de datos. Siempre usar LIMIT y WHERE para acotar durante la fase exploratoria.
- **Mezclar tipos de dato en la misma columna:** tener "2024-03-15" y "15/03/2024" en la misma columna de fecha hace que las funciones de fecha fallen. La estandarizacion de tipos es parte de la preparacion de datos, no de la limpieza.

---

## Conexion con otros cursos

- Los tipos de datos aprendidos en el modulo 1 (nominal, ordinal, discreto, continuo) determinan directamente que tipo de limpieza se aplica en el curso 4 y que tipo de grafico se elige en el curso 6.
- ROCCC del modulo 2 es el criterio que se aplica al dataset del capstone en el curso 8 al documentar la evaluacion de la fuente de datos.
- El SQL basico del modulo 3 (SELECT, FROM, WHERE) es la base sobre la que se construye todo el SQL avanzado del curso 4 (limpieza con SQL) y del curso 5 (JOINs, GROUP BY, window functions).
- La organizacion y nomenclatura de archivos del modulo 4 conecta con las buenas practicas de documentacion del curso 4 y con la presentacion del portfolio en el curso 8.
- Los sesgos del modulo 2 reaparecen en el curso 5 al interpretar resultados: un analisis tecnicamente correcto puede llevar a conclusiones sesgadas si no se tiene en cuenta el sesgo de confirmacion o de muestreo.

---

## Lo mas importante de este curso

**ROCCC** es la herramienta para no caer en la trampa de asumir que cualquier
dataset que encuentras es valido. Evaluarlo antes de analizar ahorra muchos
problemas despues.

**SQL** es la habilidad mas practicamente util de este curso. Una vez que
entiendes SELECT/FROM/WHERE/GROUP BY/ORDER BY, puedes responder el 80% de
las preguntas que te haran en un trabajo de analisis de datos. El resto
se construye sobre esta base.
