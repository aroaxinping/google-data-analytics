# Apuntes — Course 4: Process Data from Dirty to Clean

**Duracion:** 16 horas
**Modulos:** 6

---

## Que cubre este curso

La fase "Process" del proceso de analisis. Como detectar datos sucios, limpiarlos
con Sheets y con SQL, verificar que la limpieza fue correcta y documentar todo
el proceso.

---

## Modulo 1: The Importance of Integrity

La integridad de los datos es la condicion de que los datos sean completos,
precisos, consistentes y confiables. Sin integridad, el analisis produce
resultados incorrectos — a veces sin que te des cuenta.

**Tipos de problemas de integridad:**

| Problema | Descripcion | Ejemplo |
|----------|-------------|---------|
| Datos insuficientes | Faltan registros para responder la pregunta | Solo tienes datos de 3 meses cuando necesitas 12 |
| Datos incorrectos | Valores erroneos o malinterpretados | Fecha en formato incorrecto |
| Datos inconsistentes | El mismo valor representado de formas distintas | "ES", "Spain", "Espana" |
| Datos duplicados | Mismo registro repetido | Pedido con el mismo ID dos veces |
| Datos desactualizados | Informacion que ya no refleja la realidad | Precios de hace 3 anos |

**Muestreo aleatorio:**
Cuando el dataset completo es demasiado grande para analizar, se trabaja con
una muestra representativa. El muestreo aleatorio garantiza que cada elemento
tenga igual probabilidad de ser seleccionado (elimina el sesgo de seleccion).

**Sesgo de muestreo:** ocurre cuando la muestra no representa bien a la
poblacion total. Ejemplo: encuestar solo a usuarios premium para sacar
conclusiones sobre todos los usuarios.

---

## Modulo 2: Clean Data for More Accurate Insights

La limpieza en Sheets: como identificar y corregir problemas manualmente
y con funciones.

**Tipos de datos sucios:**

- **Errores tipograficos:** "Madrd" en lugar de "Madrid"
- **Espacios extra:** " Juan" en lugar de "Juan"
- **Mayusculas inconsistentes:** "electronics", "Electronics", "ELECTRONICS"
- **Formatos de fecha mezclados:** "15/03/2024" y "2024-03-15" en la misma columna
- **Valores nulos:** celdas vacias donde deberia haber dato
- **Duplicados:** filas identicas o casi identicas repetidas
- **Outliers:** valores extremos que pueden ser errores o casos reales

**Funciones de limpieza en Sheets:**

```
=TRIM(texto)           -> elimina espacios extra al inicio y fin
=LOWER(texto)          -> convierte a minusculas
=UPPER(texto)          -> convierte a mayusculas
=PROPER(texto)         -> Primera Letra En Mayuscula
=LEN(texto)            -> longitud del texto (util para detectar errores)
=SUBSTITUTE(texto, buscar, reemplazar)  -> reemplazar texto
=SPLIT(texto, delimitador)  -> dividir texto en columnas
=CONCATENATE(a, b)     -> unir textos
```

**Eliminar duplicados en Sheets:**
Data > Data cleanup > Remove duplicates

**Congelar cabeceras para trabajar mejor:**
View > Freeze > 1 row

---

## Modulo 3: Data Cleaning with SQL

El mismo proceso de limpieza pero en BigQuery, para datasets que no caben en Sheets.

**Detectar problemas:**

```sql
-- Contar nulos por columna
SELECT
  COUNTIF(columna IS NULL) AS nulos
FROM tabla;

-- Ver valores unicos (para detectar inconsistencias)
SELECT DISTINCT categoria
FROM tabla
ORDER BY categoria;

-- Detectar duplicados
SELECT id, COUNT(*) AS veces
FROM tabla
GROUP BY id
HAVING COUNT(*) > 1;
```

**Limpiar en SQL:**

```sql
-- Estandarizar texto
SELECT
  TRIM(nombre)           AS nombre,
  LOWER(categoria)       AS categoria,
  UPPER(pais)            AS pais
FROM tabla;

-- Manejar nulos
SELECT
  COALESCE(region, 'Sin region') AS region  -- reemplaza NULL por valor por defecto
FROM tabla;

-- Eliminar duplicados (quedarse con uno por id)
SELECT *
FROM (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY fecha) AS fila
  FROM tabla
)
WHERE fila = 1;

-- Convertir tipo de dato
SELECT CAST(precio_texto AS FLOAT64) AS precio
FROM tabla;

-- Estandarizar fecha
SELECT PARSE_DATE('%d/%m/%Y', fecha_texto) AS fecha
FROM tabla;
```

**Funciones SQL de texto mas usadas:**

```sql
TRIM(col)                          -- quitar espacios
LOWER(col) / UPPER(col)           -- cambiar capitalización
REPLACE(col, 'viejo', 'nuevo')    -- reemplazar texto
SUBSTR(col, inicio, longitud)     -- extraer parte del texto
CONCAT(col1, ' ', col2)           -- unir textos
LENGTH(col)                        -- longitud del texto
```

---

## Modulo 4: Verify and Report on Cleaning Results

Limpiar sin verificar no es suficiente. El paso de verificacion confirma
que los cambios son correctos y que no se introdujeron nuevos errores.

**Proceso de verificacion:**

1. Comparar conteo de filas antes y despues de la limpieza
2. Confirmar que no quedan duplicados
3. Comprobar que los valores nulos se manejaron correctamente
4. Validar que los tipos de dato son los esperados
5. Revisar estadisticas descriptivas (min, max, media) para detectar outliers

```sql
-- Comparar antes vs despues
SELECT 'antes' AS estado, COUNT(*) FROM tabla_original
UNION ALL
SELECT 'despues', COUNT(*) FROM tabla_limpia;

-- Estadisticas de verificacion
SELECT
  MIN(precio)  AS precio_min,
  MAX(precio)  AS precio_max,
  AVG(precio)  AS precio_medio,
  STDDEV(precio) AS desviacion
FROM tabla_limpia;
```

**Documentar el proceso:**
Un log de limpieza incluye:
- Que problemas se encontraron y cuantos registros afectaban
- Que se hizo para corregir cada problema
- Cuantas filas se eliminaron y por que
- Que decisiones se tomaron sobre los nulos (eliminar, reemplazar, mantener)

Esto es importante: si alguien reproduce el analisis, tiene que poder
entender exactamente que se hizo con los datos.

---

## Modulo 5: Add Data to Your Resume

Consejos para reflejar habilidades de datos en el curriculum. El punto
relevante: los proyectos del certificado (especialmente el capstone) pueden
ir directamente al portfolio y al CV.

---

## Esquema resumido del curso

```
COURSE 4: PROCESS (CLEAN)
|
+-- Integridad de datos
|     Insuficientes, incorrectos, inconsistentes, duplicados, desactualizados
|     Muestreo aleatorio y sesgo de muestreo
|
+-- Limpieza en Sheets
|     TRIM, LOWER, UPPER, PROPER, SUBSTITUTE, SPLIT
|     Eliminar duplicados con Data > Remove duplicates
|
+-- Limpieza en SQL
|     TRIM, LOWER, REPLACE, COALESCE
|     ROW_NUMBER() para eliminar duplicados
|     CAST para conversiones de tipo
|     PARSE_DATE para estandarizar fechas
|
+-- Verificacion y documentacion
      Comparar antes/despues
      Estadisticas de validacion
      Log del proceso de limpieza
```

---

## Glosarios por modulo

**Glosario del modulo 1:**

| Termino | Definicion |
|---------|------------|
| Exactitud | El grado en que los datos se ajustan a la entidad real que se esta midiendo |
| Integridad de datos | La exactitud, completitud, consistencia y confiabilidad de los datos a lo largo de su ciclo de vida |
| Completitud | El grado en que los datos contienen todos los componentes o medidas deseados |
| Consistencia | El grado en que los datos son repetibles desde diferentes puntos de entrada o recopilacion |
| Intervalo de confianza | Un rango de valores que indica que tan probable es que una estimacion estadistica refleje la poblacion |
| Nivel de confianza | La probabilidad de que un tamano de muestra refleje con precision la poblacion mayor |
| Validacion cruzada de campos | Un proceso que garantiza que se cumplan ciertas condiciones para multiples campos de datos |
| Restricciones de datos | Los criterios que determinan si un dato es limpio y valido |
| Manipulacion de datos | El proceso de cambiar datos para hacerlos mas organizados y faciles de leer |
| Rango de datos | Valores numericos que caen entre valores maximos y minimos predefinidos |
| Replicacion de datos | El proceso de almacenar datos en multiples ubicaciones |
| DATEDIF | Una funcion de hoja de calculo que calcula el numero de dias, meses o anos entre dos fechas |
| Tasa de respuesta estimada | El numero promedio de personas que tipicamente completan una encuesta |
| Prueba de hipotesis | Un proceso para determinar si los resultados de una encuesta o experimento son significativos |
| Obligatorio | Un valor de datos que no puede dejarse en blanco o vacio |
| Margen de error | La cantidad maxima que se espera que los resultados de la muestra difieran de los de la poblacion real |
| Muestreo aleatorio | Una forma de seleccionar una muestra de una poblacion de manera que cada tipo posible tenga igual probabilidad de ser elegido |
| Expresion regular (RegEx) | Una regla que dice que los valores en una tabla deben coincidir con un patron prescrito |

**Glosario del modulo 2:**

| Termino | Definicion |
|---------|------------|
| Datos limpios | Datos que estan completos, correctos y relevantes para el problema que se esta resolviendo |
| Compatibilidad | Que tan bien funcionan juntos dos o mas conjuntos de datos |
| CONCATENATE | Una funcion de hoja de calculo que une dos o mas cadenas de texto |
| Formato condicional | Una herramienta de hoja de calculo que cambia como aparecen las celdas cuando los valores cumplen condiciones especificas |
| Ingeniero de datos | Un profesional que transforma datos en un formato util para el analisis y les da una infraestructura confiable |
| Mapeo de datos | El proceso de hacer coincidir campos de una fuente de datos con otra |
| Fusion de datos | El proceso de combinar dos o mas conjuntos de datos en un unico conjunto de datos |
| Validacion de datos | Una herramienta para verificar la exactitud y calidad de los datos |
| Especialista en almacenamiento de datos | Un profesional que desarrolla procesos y procedimientos para almacenar y organizar datos de manera eficaz |
| Delimitador | Un caracter que indica el inicio o fin de un elemento de datos |
| Datos sucios | Datos que estan incompletos, incorrectos o irrelevantes para el problema a resolver |
| Datos duplicados | Cualquier registro que inadvertidamente comparte datos con otro registro |
| Longitud de campo | Una herramienta para determinar cuantos caracteres pueden ingresarse en un campo de hoja de calculo |
| Datos incompletos | Datos a los que les faltan campos importantes |
| Datos inconsistentes | Datos que usan diferentes formatos para representar lo mismo |
| Datos incorrectos | Datos que estan completos pero son inexactos |
| LEFT | Una funcion que devuelve un numero establecido de caracteres del lado izquierdo de una cadena de texto |
| LEN | Una funcion que devuelve la longitud de una cadena de texto contando el numero de caracteres que contiene |
| Longitud | El numero de caracteres en una cadena de texto |
| Fusion empresarial | Un acuerdo que une dos organizaciones en una sola nueva |
| MID | Una funcion que devuelve un segmento del medio de una cadena de texto |
| Nulo | Una indicacion de que un valor no existe en un conjunto de datos |
| Datos desactualizados | Cualquier dato que ha sido superado por informacion mas nueva y precisa |
| Eliminar duplicados | Una herramienta de hoja de calculo que busca y elimina automaticamente entradas duplicadas |
| SPLIT | Una funcion de hoja de calculo que divide texto alrededor de un caracter especificado |
| Subcadena | Un subconjunto de una cadena de texto |
| Cadena de texto | Un grupo de caracteres dentro de una celda |
| TRIM | Una funcion que elimina espacios iniciales, finales y repetidos en datos |
| Unico | Un valor que no puede tener duplicados |

**Glosario del modulo 3:**

| Termino | Definicion |
|---------|------------|
| CAST | Una funcion SQL que convierte datos de un tipo de dato a otro |
| COALESCE | Una funcion SQL que devuelve valores no nulos en una lista |
| CONCAT | Una funcion SQL que agrega cadenas para crear nuevas cadenas de texto que pueden usarse como claves unicas |
| DISTINCT | Una palabra clave que se agrega a una instruccion SELECT de SQL para recuperar solo entradas no duplicadas |
| Float | Un numero que contiene un decimal |
| Conversion de tipos | Convertir datos de un tipo a otro |

**Glosario del modulo 4:**

| Termino | Definicion |
|---------|------------|
| CASE | Una instruccion SQL que devuelve registros que cumplen condiciones al incluir una instruccion if/then en una consulta |
| Registro de cambios | Un archivo que contiene una lista cronologicamente ordenada de modificaciones realizadas en un proyecto |
| COUNTA | Una funcion de hoja de calculo que cuenta el numero total de valores dentro de un rango especificado |
| Buscar y reemplazar | Una herramienta que encuentra un termino de busqueda especificado y lo reemplaza por otro |
| Verificacion | Un proceso para confirmar que un esfuerzo de limpieza de datos fue bien ejecutado y que los datos resultantes son exactos y confiables |

---

## Actividades del curso

**Modulo 1 — The Importance of Integrity:**

Lecturas clave:
- Mas informacion sobre integridad y conformidad de los datos: como la integridad de datos afecta al cumplimiento normativo (GDPR, HIPAA) y que significa "data compliance" en entornos profesionales
- Objetivos y Datos bien alineados: como verificar que los datos que tienes responden realmente la pregunta de negocio formulada

Otras actividades:
- Introduccion a la integridad de datos (video, 3 min): presentacion del modulo
- Por que es importante la integridad de los datos (video, 2 min): consecuencias reales de usar datos con integridad comprometida
- Equilibrio entre los objetivos y la integridad de los datos (video, 3 min): como gestionar el tension entre lo que quieres analizar y la calidad de los datos disponibles
- Desafio del modulo 1 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: integridad de datos y objetivos de analisis: evalua conceptos de integridad de datos, manipulacion de datos, estandarizacion e identificacion de duplicados
- Pon a prueba tus conocimientos: datos insuficientes: evalua estrategias para manejar datasets limitados, sesgo de muestreo y tecnicas de representacion de la poblacion
- Pon a prueba tus conocimientos: probar tus datos: evalua pruebas de hipotesis, significacion estadistica, niveles de confianza y requisitos de tamano de muestra
- Pon a prueba tus conocimientos: margen de error: evalua calculos de margen de error, intervalos de confianza y predicciones sobre la poblacion

**Modulo 2 — Clean Data for More Accurate Insights:**

Lecturas clave:
- Que son los datos sucios (lectura, 8 min): catalogo completo de tipos de datos sucios — duplicados, desactualizados, incompletos, incorrectos, inconsistentes, no relevantes

Otras actividades:
- Limpialo (video, 2 min): introduccion al modulo
- Por que es fundamental depurar los datos (video, 5 min): impacto de datos sucios en decisiones de negocio, con casos reales
- Reconocer y remediar los datos sucios (video, 5 min): como identificar cada tipo de dato sucio en un dataset real
- Herramientas y tecnicas de limpieza de datos (video, 6 min): funciones de Sheets para limpieza — TRIM, CLEAN, PROPER, SUBSTITUTE
- Datos limpios de multiples fuentes (video, 5 min): problemas especificos al combinar datos de distintas fuentes — tipos inconsistentes, naming diferente, unidades distintas
- Desafio del modulo 2 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: limpieza de datos: evalua roles de profesionales de datos, valores nulos, formateo de datos y procedimientos de validacion
- Pon a prueba tus conocimientos: los primeros pasos hacia datos limpios: evalua consistencia de formato, fusion de datos, evaluacion de compatibilidad y documentacion de errores
- Pon a prueba tus conocimientos: limpiar datos en hojas de calculo: evalua cadenas de texto, sintaxis de COUNTIF, operaciones TRIM y funcionalidad de VLOOKUP

**Modulo 3 — Data Cleaning with SQL:**

Actividades practicas:
- Actividad practica: Tiempo de proceso con SQL: medir tiempo de procesamiento de queries y usar LIMIT para optimizar
- Actividad practica: Limpiar datos usando SQL: aplicar TRIM, LOWER, REPLACE, CAST y ROW_NUMBER sobre el dataset de clientes en BigQuery

Lecturas clave:
- Dialectos SQL y sus usos: diferencias entre BigQuery (Standard SQL), MySQL, PostgreSQL y SQL Server — funciones que difieren entre dialectos
- Ampliamente usadas consultas SQL (widely-used-sql-queries): referencia de las queries de limpieza mas comunes — DISTINCT, TRIM, CAST, COALESCE, ROW_NUMBER()
- Funciones avanzadas de limpieza de datos parte 1 y 2: REGEXP_CONTAINS, REGEXP_EXTRACT, REGEXP_REPLACE para limpiar texto con patrones — por ejemplo, detectar emails invalidos o extraer codigos postales de texto libre

Otras actividades:
- Utilice SQL para limpiar datos (video, 45 seg): introduccion al modulo
- Comprender las capacidades de SQL (video, 3 min): que puede hacer SQL en limpieza que Sheets no puede a escala
- Hojas de calculo frente a SQL (video, 4 min): guia de cuando elegir cada herramienta para limpiar datos
- Limpiar variables de cadena usando SQL (video): demostracion de TRIM, LOWER, REPLACE en BigQuery sobre el dataset de clientes
- Desafio del modulo 3 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: consultas SQL: evalua ventajas de SQL, uso de la funcion SUBSTR, clausula DISTINCT y funciones LENGTH

**Modulo 4 — Verify and Report on Cleaning Results:**

Actividades practicas:
- Autorreflexion: Creacion de un registro de cambios: crear un changlog documentando cada operacion de limpieza realizada en el dataset del modulo 3

Lecturas clave:
- Paso a paso: Verificacion de la limpieza de datos: proceso sistematico de verificacion — comparar COUNT(*) antes/despues, usar SELECT DISTINCT para verificar estandarizacion, comprobar que no quedan NULLs donde no deberian, y validar rangos con MIN/MAX
- Lista de comprobacion de la limpieza de datos: checklist de 6 puntos que debe pasarse antes de dar un dataset por limpio: nulos, duplicados, tipos de dato, consistencia de formato, outliers, conteo de filas
- Registros de cambios (changelogs): estructura de un changelog — fecha, tipo de cambio, descripcion, numero de registros afectados, quien lo hizo

Otras actividades:
- Verificar e informar de los resultados (video, 3 min): introduccion al modulo
- Confirmar que la limpieza de datos cumple las expectativas de la empresa (video): como presentar los resultados de limpieza a un stakeholder no tecnico
- Verificacion de la limpieza de datos (video, 8 min): demostracion del proceso de verificacion paso a paso en BigQuery
- Capturar los cambios de limpieza (video, 5 min): como estructurar y mantener un changelog de limpieza
- Desafio del modulo 4 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: limpieza de datos manual: evalua procesos de verificacion, funcion COUNTA, documentacion en changelogs y correcciones con la clausula CASE
- Pon a prueba tus conocimientos: documentar el proceso de limpieza: evalua documentacion de la evolucion del dataset, sincronizacion de control de versiones, contenido del changelog y procedimientos de revision de codigo

**Modulo 5 — Add Data to Your Resume:**

Lecturas clave:
- Anade Habilidades tecnicas a tu Curriculum: como describir habilidades de SQL, Sheets y limpieza de datos en un CV de analista junior — con ejemplos de bullet points reales
- La importancia de la diversidad en un equipo de Analisis de datos: perspectivas sobre inclusion en el sector de datos

Otras actividades:
- Haz que tu Curriculum sea unico (video, 3 min): consejos para diferenciarse en el CV como analista de datos junior
- Donde radica su interes (video, 3 min): reflexion sobre especializacion dentro del analisis de datos

**Modulo 6 — Course Wrap-Up:**

- Reflexionar y conectar con los companeros (lectura, 4 min): reflexion sobre lo aprendido en el curso
- Glosario del curso 4 (lectura, 4 min): terminos clave del curso
- Enhorabuena: Resumen del curso (video, 1 min): cierre del curso
- Evaluacion del curso (quiz calificado final)

---

## Cuando usar X vs Y

**Eliminar vs rellenar nulos:**
Eliminar la fila cuando el registro sin ese dato no tiene valor analitico y su ausencia no distorsiona la muestra. Rellenar cuando el nulo tiene un significado interpretable (cero ventas, valor mas frecuente, mediana) y eliminar esas filas reduciria la muestra de forma significativa o introduciria sesgo.

**TRIM vs CLEAN en Sheets:**
TRIM elimina espacios extra al inicio, fin y entre palabras (los dobles espacios). CLEAN elimina caracteres no imprimibles que a veces vienen de exportaciones de otros sistemas. Usarlos juntos cubre ambos casos: primero CLEAN para limpiar caracteres invisibles, luego TRIM para los espacios.

**ROW_NUMBER vs DISTINCT para duplicados:**
DISTINCT es mas simple pero elimina todas las filas duplicadas indiscriminadamente, sin control sobre cual conservar. ROW_NUMBER() OVER (PARTITION BY id ORDER BY fecha) te permite especificar exactamente cual fila de cada grupo de duplicados quieres conservar (la mas reciente, la mas completa, la primera), lo que es necesario cuando las filas duplicadas tienen diferencias entre si.

**Documentar en el script vs en un documento externo:**
Preferible documentar directamente en el script como comentarios. Si el codigo y la documentacion estan separados, siempre acaban desincronizados: se actualiza el codigo y se olvida actualizar la documentacion, o viceversa. Un comentario inline en el script es imposible de desincronizar.

**CAST vs SAFE_CAST:**
CAST falla con un error si el valor no puede convertirse al tipo destino. SAFE_CAST devuelve NULL en lugar de error cuando la conversion falla. Usar SAFE_CAST cuando el dato puede ser inconsistente (texto mezclado con numeros en una columna que deberia ser numerica); usar CAST solo cuando estas seguro de que todos los valores son convertibles.

---

## Errores comunes

- **Limpiar sin documentar las decisiones:** si no hay registro de que se elimino, que se reemplazo y por que, el analisis no es reproducible ni auditable. Un analisis cuya limpieza no se puede explicar no es un analisis profesional.
- **Eliminar datos que deberian analizarse:** los valores nulos a veces son el hallazgo, no el problema. Un nulo en "fecha de baja" puede significar "cliente activo". Eliminar esas filas sin entender su significado destruye informacion valiosa.
- **No verificar despues de limpiar:** la limpieza puede introducir errores nuevos. Reemplazar NULLs con un valor incorrecto, o convertir un tipo de dato con CAST de forma incorrecta, produce datos erroneos que parecen limpios. Siempre verificar estadisticas descriptivas despues de cada operacion de limpieza.
- **Limpiar y analizar en el mismo paso:** mezclar las fases hace el proceso opaco. Si el analisis final es incorrecto, es imposible saber si el error viene de una decision de limpieza o de un error de analisis.
- **Ignorar outliers en lugar de investigarlos:** un outlier puede ser un error de datos (hay que limpiar) o un caso real extremo (hay que conservar y mencionar). La decision de que hacer con el requiere entender el contexto del negocio.

---

## Conexion con otros cursos

- La integridad de datos del modulo 1 conecta directamente con ROCCC del curso 3: ROCCC evalua la fuente antes de empezar; la verificacion de integridad evalua el dataset una vez que lo tienes.
- Las funciones de limpieza de Sheets del modulo 2 (TRIM, LOWER, SUBSTITUTE) tienen equivalentes directos en SQL del modulo 3, que se usan de nuevo en el curso 5 al preparar datos para el analisis.
- ROW_NUMBER() OVER() del modulo 3 es la primera window function del certificado. La misma sintaxis OVER() se usa en el curso 5 para calculos mucho mas complejos como totales acumulados, rankings y LAG.
- El log de limpieza del modulo 4 es la base de la seccion "Process" del case study del capstone en el curso 8. Los reclutadores miran especificamente como se documenta la limpieza en el portfolio.
- Las decisiones de limpieza tomadas aqui afectan directamente a la validez de los hallazgos del curso 5: si se limpiaron mal los datos, el analisis producira resultados incorrectos aunque las queries sean perfectas.

---

## Lo mas importante de este curso

**ROW_NUMBER() OVER (PARTITION BY id ORDER BY fecha)** es la tecnica SQL
mas util para eliminar duplicados conservando el registro correcto. Vale la
pena entenderla bien.

**COALESCE** es la forma estandar de manejar NULLs en SQL. Mucho mas limpio
que un CASE WHEN largo.

Y lo mas importante de todo: **documentar siempre el proceso de limpieza**.
Un analisis sin documentacion de limpieza no es reproducible, y eso lo hace
poco util en un entorno profesional.
