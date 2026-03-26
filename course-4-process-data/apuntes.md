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
