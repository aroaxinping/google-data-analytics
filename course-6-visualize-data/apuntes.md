# Apuntes — Course 6: Share Data Through the Art of Visualization

**Duracion:** 19 horas
**Modulos:** 4

---

## Que cubre este curso

La fase "Share" del proceso de analisis. Como convertir datos en historias
visuales claras y efectivas. Usa Tableau como herramienta principal y
termina con presentaciones y como comunicar resultados a stakeholders.

---

## Modulo 1: Visualize Data

Fundamentos de visualizacion: por que funciona, que tipos existen y
como elegir el correcto para cada pregunta.

**Por que la visualizacion importa:**
El cerebro procesa imagenes 60.000 veces mas rapido que texto. Una
buena visualizacion comunica en segundos lo que una tabla de datos
tarda minutos en transmitir.

**Tipos de visualizacion y cuando usarlos:**

| Tipo | Cuando usarlo | Ejemplo |
|------|--------------|---------|
| Barras verticales | Comparar categorias | Ventas por producto |
| Barras horizontales | Categorias con nombres largos, rankings | Top 10 paises |
| Linea | Evolucion temporal | Ventas por mes |
| Area | Evolucion + volumen acumulado | Crecimiento de usuarios |
| Dispersion (scatter) | Relacion entre dos variables numericas | Precio vs demanda |
| Mapa de calor | Patrones en matriz de datos | Actividad por hora y dia |
| Treemap | Proporciones entre muchas categorias | Cuota de mercado |
| Histograma | Distribucion de una variable | Distribucion de edades |
| Donut / Pie | Composicion (pocas categorias, max 5-6) | % peliculas vs series |

**Cuando NO usar un pie chart:**
- Mas de 5-6 categorias (imposible de leer)
- Las diferencias son pequenas (el ojo no distingue bien angulos similares)
- Necesitas precision (usar barras en ese caso)

**Principios de diseno para visualizacion:**

1. **Pre-atentivo:** el ojo capta color, tamano y posicion antes de leer.
   Usarlos con proposito, no decorativamente.
2. **Accesibilidad:** usar paletas que funcionen para daltonismo. Evitar
   rojo/verde como unico diferenciador.
3. **Simplicidad (chart junk):** eliminar todo lo que no aporte informacion.
   Fondos, sombras, bordes innecesarios = ruido visual.
4. **Jerarquia visual:** lo mas importante debe verse primero (arriba izquierda,
   mayor tamano, color mas llamativo).
5. **Consistencia:** el mismo color siempre para el mismo concepto en todo
   el dashboard.

**Design thinking aplicado a datos:**
Empatia con la audiencia -> Definir la pregunta -> Idear visualizaciones ->
Prototipar rapidamente -> Testear si funciona

---

## Modulo 2: Create Data Visualizations with Tableau

Tableau es la herramienta estandar del sector para dashboards interactivos.
La version gratuita (Tableau Public) publica directamente en la web.

**Conceptos clave de Tableau:**

- **Dimensions:** variables categoricas (texto, fechas) — van en filas/columnas
- **Measures:** variables numericas — van en valores
- **Marks card:** controla color, tamano, forma y etiqueta de los elementos
- **Shelves:** donde arrastras campos (Columns, Rows, Filters, Pages)
- **Show Me:** panel de tipos de grafico recomendados segun los campos seleccionados

**Flujo basico en Tableau:**

```
1. Connect a fuente de datos (CSV, Excel, BigQuery...)
2. Arrastrar dimension a Rows o Columns
3. Arrastrar measure a Rows o Columns (o a Marks > Size/Color)
4. Elegir tipo de grafico (Show Me o manualmente)
5. Filtrar si necesario
6. Formatear (colores, titulos, ejes)
```

**Calculos en Tableau:**
- Medidas calculadas: Analysis > Create Calculated Field
- Ejemplo: `SUM([Ventas]) / SUM([Pedidos])` para ticket medio
- LOD (Level of Detail): calculos a nivel distinto al de la vista
  - `{FIXED [Region] : SUM([Ventas])}` — suma por region independiente de otros filtros

---

## Modulo 3: Craft Data Stories

Los datos por si solos no convencen. Hay que construir una narrativa.

**Los 3 elementos de una historia de datos:**

1. **Personajes:** los stakeholders y quien se ve afectado por los datos
2. **Contexto:** la situacion actual y por que importa
3. **Tension:** el problema o pregunta que los datos responden

Lo que mas cuesta al principio: ir al hallazgo directamente en lugar de
contar todo el proceso. La audiencia no necesita saber como llegaste —
necesita saber que encontraste y que hacer con ello.

**Estructura clasica para presentar resultados:**

```
1. El contexto: "Estamos viendo que las ventas caen en Q2"
2. Los datos: "Segun el analisis, la caida es del 18% en producto X"
3. El hallazgo: "La caida coincide con el lanzamiento del competidor Y"
4. La implicacion: "Si no actuamos, perderemos el 23% de clientes en 6 meses"
5. La recomendacion: "Propongo tres acciones concretas..."
```

**Dashboards en Tableau:**

- Un dashboard = varias hojas combinadas en una vista
- Los filtros pueden afectar a todas las hojas a la vez (filtros de dashboard)
- Usar acciones (Actions) para que clicar en un grafico filtre otro
- Layout: organizar para que el ojo siga el flujo de la historia

**Contexto para los numeros:**
Un numero sin contexto no significa nada. "Las ventas son 50.000" es
irrelevante sin saber si es bueno, malo, si sube o baja, y comparado con que.

---

## Modulo 4: Develop Presentations and Slideshows

Comunicar resultados en presentaciones: como estructurar, que incluir y
como manejar las preguntas dificiles.

**Estructura de una presentacion de analisis:**

1. **Titulo y contexto:** la pregunta que se respondio y para quien
2. **Metodologia breve:** que datos, que periodo, que herramientas
3. **Hallazgos principales:** 3-5 puntos clave con visualizaciones
4. **Limitaciones:** que no puedes concluir con estos datos
5. **Recomendaciones:** acciones concretas basadas en el analisis
6. **Proximos pasos:** que analisis adicionales podrian profundizar

**Manejar limitaciones de los datos:**
No ocultarlas — mencionarlas proactivamente aumenta la credibilidad.
"Los datos solo cubren usuarios registrados, por lo que no podemos
extrapolar al comportamiento de usuarios anonimos."

**Preguntas dificiles:**
- Preparar respuestas para las preguntas mas probables antes de presentar
- Si no sabes algo: "No tengo ese dato pero puedo buscarlo" es mejor que
  inventarse una respuesta

---

## Esquema resumido del curso

```
COURSE 6: SHARE (VISUALIZE)
|
+-- Fundamentos de visualizacion
|     Tipos de grafico y cuando usar cada uno
|     Principios: pre-atentivo, accesibilidad, simplicidad
|     Jerarquia visual, consistencia de colores
|
+-- Tableau
|     Dimensions vs Measures
|     Marks card, Shelves, Show Me
|     Medidas calculadas y LOD
|
+-- Storytelling con datos
|     Personajes, contexto, tension
|     Estructura: contexto -> datos -> hallazgo -> implicacion -> recomendacion
|     Dashboards interactivos con filtros y acciones
|
+-- Presentaciones
      Estructura de presentacion de analisis
      Comunicar limitaciones
      Anticipar preguntas
```

---

## Glosarios por modulo

**Glosario del modulo 1:**

| Termino | Definicion |
|---------|------------|
| Texto alternativo | Texto que proporciona una version alternativa basada en texto de la informacion transmitida por una imagen |
| Anotacion | Texto que acompana y explica brevemente los datos de las visualizaciones |
| AVERAGEIF | Una funcion de hoja de calculo que devuelve el promedio de todos los valores de celda de un rango que cumplen ciertos criterios |
| Balance | El principio de diseno que describe cuando los elementos de una visualizacion de datos estan distribuidos de manera uniforme |
| Grafico de barras | Tipo de grafico que usa el tamano para contrastar y comparar dos o mas valores |
| Calculo | Una rama de las matematicas que implica calcular limites, integrales y derivadas |
| Causalidad | Ocurre cuando una accion conduce directamente a un resultado, como una relacion causa-efecto |
| Canal | Un elemento visual que puede representar caracteristicas de los datos o valores |
| Grafico | Una forma de representar graficamente los datos |
| Cluster | Una coleccion de puntos de datos en una visualizacion de datos |
| CONVERT | Una funcion de hoja de calculo que convierte un numero de un sistema de medicion a otro |
| Correlacion | La medida del grado en que dos variables se mueven entre si |
| CREATE TABLE | Una instruccion SQL que agrega una tabla temporal a una base de datos que puede usar cualquier persona conectada a esa base de datos |
| Composicion de datos | El proceso de combinar los elementos individuales de una visualizacion y presentarlos juntos como un todo |
| Arbol de decision | Una herramienta de toma de decisiones que permite al usuario tomar decisiones de forma esquematica y visual |
| Design thinking | Un proceso centrado en el usuario para resolver problemas |
| Grafico de distribucion | Grafico que visualiza donde los datos se agrupan o distribuyen en un rango de valores posibles |
| DROP TABLE | Una instruccion SQL que elimina una tabla temporal de una base de datos |
| Visualizaciones dinamicas | Visualizaciones de datos que son interactivas o cambian con el tiempo |
| Enfasis | El principio de diseno que se refiere a usar diferencias visuales para centrar la atencion en la informacion mas importante |
| HAVING | Una clausula SQL que agrega un filtro a una consulta en lugar de a la tabla subyacente que se consulta |
| Titular | Las palabras en el tamano de letra mas grande en la parte superior de una visualizacion que transmite el beneficio mas importante que alguien obtiene al ver los datos |
| Mapa de calor | Tipo de visualizacion que usa color para comparar categorias en una tabla de datos |
| Histograma | Tipo de visualizacion que muestra la frecuencia relativa de valores de datos en rangos iguales o desiguales |
| Subconsulta interna | Una consulta SQL dentro de otra consulta |
| Etiqueta | En visualizacion, texto en una visualizacion que identifica un valor de datos o describe los atributos correspondientes |
| Leyenda | Una referencia de herramienta usada para identificar la codificacion de color en visualizaciones |
| Grafico de lineas | Tipo de grafico que conecta puntos de datos individuales y los muestra como una linea continua; muestra como una cosa cambia con el tiempo |
| Mapa | Tipo de visualizacion que organiza datos por ubicacion geografica |
| Marca | En Tableau, son objetos visuales codificados con datos como puntos, lineas y barras |
| MAXIFS | Una funcion en hoja de calculo que devuelve el valor maximo de un rango de celdas basandose en una condicion especifica |
| Modelo mental | Proceso de ordenacion de informacion que una persona ha interiorizado para ayudarle a entender el mundo |
| Movimiento | El principio de diseno utilizado para crear una sensacion de flujo o direccion en una visualizacion |
| MINIFS | Una funcion en hoja de calculo que devuelve el valor minimo de un rango de celdas basandose en una condicion especifica |
| Datos ordinales | Un tipo de datos cualitativos con un orden o escala establecidos |
| Patron | El principio de diseno que utiliza formas similares y colores para crear elementos similares o complementarios en una visualizacion |
| Grafico circular | Tipo de grafico que muestra como un todo se divide en diferentes partes; cada parte del circulo es proporcional a la cantidad que representa de todo |
| Atributos pre-atentivos | Elementos de una visualizacion de datos que las personas reconocen automaticamente sin esfuerzo consciente |
| Proporcion | El principio de diseno que se refiere a la diferencia de tamano entre varios elementos en una visualizacion |
| R | Un lenguaje de programacion que se usa frecuentemente para el analisis estadistico, la visualizacion y otros analisis de datos |
| Ranking | Tipo de visualizacion de datos que clasifica las categorias de datos por su valor |
| Relatividad | La consideracion o presentacion de diferentes problemas de decision de manera diferente segun como se presenten |
| Repeticion | El principio de diseno que es el reuso de los mismos elementos visuales a lo largo de una visualizacion |
| Ritmo | El principio de diseno que crea movimiento o velocidad perceptibles en una visualizacion |
| Diagrama de dispersion | Tipo de visualizacion que muestra las relaciones entre diferentes variables |
| SELECT INTO | Una instruccion SQL que copia datos de una tabla en una tabla temporal sin agregar la nueva tabla a la base de datos |
| Ordenar rango | En hojas de calculo, herramienta que reordena los datos dentro de un rango de celdas seleccionado |
| Ordenar hoja | En hojas de calculo, herramienta que reordena todos los datos de una hoja de calculo por un campo especifico |
| Visualizaciones estaticas | Visualizaciones de datos que no cambian con el tiempo a menos que sean editadas |
| Historia | La narracion de tendencias y relaciones que los datos revelan |
| Subtitulo | El texto que aparece directamente debajo del titulo y proporciona mas informacion sobre los datos |
| Tableau | Una plataforma de inteligencia empresarial y analitica que ayuda a las personas a ver, entender y tomar decisiones con datos |
| Unidad | El principio de diseno que describe la condicion dentro de una visualizacion donde todos los elementos de una imagen tienen sentido en conjunto |
| Variedad | El principio de diseno que se refiere a utilizar diferentes tipos de formas visuales en una visualizacion |
| Forma visual | La apariencia de una visualizacion de datos que le da a los datos una forma reconocible |
| Eje X | El eje horizontal de un grafico |
| Eje Y | El eje vertical de un grafico |

**Glosario del modulo 2:**

| Termino | Definicion |
|---------|------------|
| Grafico de area | Una variante del grafico de lineas que rellena el area debajo de la linea con color para enfatizar la magnitud |
| Diagrama de caja (box plot) | Tipo de visualizacion que muestra la distribucion estadistica de los datos: minimo, Q1, mediana, Q3 y maximo |
| Grafico de burbujas | Tipo de grafico de dispersion que usa burbujas de diferentes tamanos para representar tres dimensiones de los datos |
| Grafico de viñetas (bullet) | Una visualizacion que puede usarse en lugar de medidores y graficos de velocimetro para comparar el rendimiento con un objetivo |
| Vista circular (circle view) | Tipo de grafico en Tableau que muestra circulos de tamanyo diferente segun el volumen o la medida |
| Grafico de columnas | Una visualizacion que usa barras verticales para comparar valores en distintas categorias |
| Grafico combinado (combo) | Una visualizacion que combina dos tipos de grafico diferentes (generalmente barras y lineas) en un mismo grafico |
| Mapa de densidad | Un mapa que muestra la concentracion geografica de datos en lugar de puntos individuales |
| Grafico de distribucion | Una visualizacion que muestra como los valores se distribuyen en un conjunto de datos |
| Paleta de colores divergente | Una paleta de colores en Tableau que muestra dos rangos de valores usando colores en los extremos y un color neutral en el centro |
| Grafico de dona (donut) | Una variacion del grafico circular con el centro recortado, usada para mostrar proporciones |
| Mapa relleno | Un mapa en Tableau donde las regiones se colorean segun el valor de una variable |
| Diagrama de Gantt | Tipo de visualizacion que muestra el inicio, la duracion y el final de tareas con el fin de describir visualmente la duracion de las mismas |
| Grafico de indicador (gauge) | Una visualizacion que muestra una metrica como un puntero en una escala semicircular, util para mostrar el progreso hacia un objetivo |
| Tabla de resaltado (highlight table) | Un tipo de tabla con formato condicional que usa color para mostrar variaciones en los datos |
| Grafico de burbujas agrupadas (packed bubble) | Un grafico en Tableau que agrupa circulos de diferentes tamanos para mostrar proporciones entre categorias |
| Mapa de simbolos | Tipo de visualizacion que coloca simbolos de diferentes tamanos sobre un mapa para mostrar la magnitud de un valor en diferentes ubicaciones geograficas |

**Glosario del modulo 3:**

| Termino | Definicion |
|---------|------------|
| Narracion de datos | Comunicar el significado de un conjunto de datos con elementos visuales como graficos o graficas para ayudar a transmitir la historia correcta a los espectadores de datos |
| Involucramiento | Capturar e involucrar la atencion, el interes y la imaginacion de la audiencia de datos para que reconozcan el significado de los datos |
| Datos en vivo | Datos que se actualizan automaticamente en tiempo real |
| Destacar (spotlighting) | Escanear datos para identificar rapidamente los hallazgos mas importantes y hacer que esos hallazgos sean obvios para la audiencia |

**Glosario del modulo 4:**

| Termino | Definicion |
|---------|------------|
| Filtro de panel | Una herramienta de Tableau que cambia los datos que se muestran en una vista usando condiciones y parametros |
| Mezcla de datos | El proceso de combinar datos de varias fuentes en Tableau para crear un conjunto de datos para visualizacion |
| Marco (framework) | El contexto de una visualizacion de datos que determina el tipo de informacion comunicada, el tipo de informacion necesaria y el tipo de audiencia que se busca |
| Construccion de relaciones profesionales | Creacion de conexiones con otras personas cuya carrera puede informar o afectar la propia |
| Establecimiento de redes (networking) | Construir relaciones creando conexiones con otras personas que comparten intereses profesionales similares |
| Datos estaticos | Datos que no cambian una vez que se han recopilado |
| Estadisticas | El estudio de la recopilacion, el analisis, la presentacion y la interpretacion de datos |
| WITH | Una instruccion SQL que crea una tabla temporal que puede ser consultada multiples veces en un analisis |

---

## Actividades del curso

**Modulo 1 — Visualize Data:**

Actividades practicas:
- Autorreflexion: Elegir el tipo de grafico correcto: dado un escenario de negocio, justificar que tipo de grafico (barras, linea, scatter, pie...) comunica mejor los datos y por que

Lecturas clave:
- Correlacion y causalidad: distincion critica entre que dos variables se muevan juntas (correlacion) y que una cause la otra (causalidad); como evitar conclusiones erroneas en visualizacion
- Marco de los seis tipos de visualizacion: cuando usar barras, lineas, scatter, mapas, pie charts e histogramas segun el tipo de pregunta (comparacion, tendencia, distribucion, relacion, composicion, geolocalizacion)

Otras actividades:
- Por que es importante la Visualizacion de datos (video, 1 min): introduccion al modulo
- Conecte las imagenes con los Datos (video, 6 min): como el cerebro procesa imagenes vs texto; atributos pre-atentivos (color, tamano, posicion)
- Una receta para una potente visualizacion (video, 5 min): los cuatro elementos de una visualizacion efectiva — informacion, historia, objetivo, forma visual
- Christiane: el poder de una visualizacion (video, 2 min): testimonio de analista sobre un caso real donde la visualizacion cambio la decision
- Diseno y Pensamiento de Diseno (video): design thinking aplicado a la visualizacion de datos — empatia, definicion, ideacion, prototipo, test
- Desafio del modulo 1 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: visualizacion de datos: evalua tipos de graficos, principios de diseno thinking, consideraciones de accesibilidad y elementos visuales (titulos, etiquetas, subtitulos)
- Pon a prueba tus conocimientos: disenar visualizaciones de datos: evalua elementos de diseno (linea, contraste, significado), metodologia de design thinking y la fase de empatia
- Pon a prueba tus conocimientos: explorar consideraciones de visualizacion: evalua titulos, subtitulos, etiquetas, texto alternativo para accesibilidad y estrategias de simplificacion

**Modulo 2 — Create Data Visualizations with Tableau:**

Actividades practicas:
- Actividad practica: Creacion de una visualizacion de datos en Tableau: conectar un dataset CSV en Tableau Public, arrastrar dimensions y measures, crear un grafico de barras y aplicar filtros basicos
- Actividad practica: Link multiple datasets in Tableau: unir dos fuentes de datos en Tableau (equivalente a un JOIN) usando un campo comun, y crear una visualizacion que combine ambas tablas

Lecturas clave:
- Optimizacion de la paleta de colores: como elegir colores accesibles (paletas para daltonismo), uso consistente del color para el mismo concepto, y cuando el color aporta informacion vs cuando es solo decorativo
- Principios esenciales de diseno: los cinco principios — Balance, Enfasis, Movimiento, Patron y Unidad — aplicados a visualizacion de datos

Otras actividades:
- Conozca Tableau (video, 4 min): interfaz de Tableau Public — Connect, Data Source, Worksheets, Dimensions vs Measures, Marks card, Show Me
- Crear una visualizacion de datos en Tableau (video, 6 min): demostracion de flujo completo: conectar datos, arrastrar campos, elegir tipo de grafico, aplicar filtros y formatear
- Desafio del modulo 2 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: empezar con Tableau: evalua capacidades de Tableau frente a herramientas de la competencia y caracteristicas de Tableau Public
- Pon a prueba tus conocimientos: crear visualizaciones en Tableau: evalua paletas de colores, colores divergentes, psicologia del color en representacion de datos y optimizacion de etiquetas

**Modulo 3 — Craft Data Stories:**

Actividades practicas:
- Actividad practica: Crear, filtrar y personalizar graficos: en Tableau, crear multiples tipos de grafico sobre un mismo dataset, aplicar filtros por dimension y ajustar formato (colores, etiquetas, titulos)
- Actividad practica: Construir un panel en Tableau: combinar tres o mas worksheets en un dashboard, configurar filtros globales que afecten a todas las hojas, y usar acciones para que clicar en un grafico filtre otro

Lecturas clave:
- Historias de datos eficaces: los tres elementos narrativos (personajes, contexto, tension) y como estructurar los datos para guiar al espectador hacia una conclusion concreta
- Estadisticas en vivo y estaticas: diferencia entre un dashboard con datos que se actualizan automaticamente (conexion live a base de datos) y un dashboard con datos estaticos (extract); cuando usar cada uno segun el caso de uso
- Cree su primer panel de Tableau: paso a paso para crear un dashboard en Tableau — anadir worksheets al lienzo, ajustar layout (tiled vs floating), configurar tamano y anadir titulos y textos explicativos

Otras actividades:
- Crear historias con Datos (video, 2 min): introduccion al modulo — diferencia entre mostrar datos y contar una historia con datos
- Dar vida a las ideas (video, 5 min): como el contexto transforma un numero en un hallazgo relevante; el papel del analista como narrador
- Hable a su publico (video, 4 min): adaptar la complejidad de la historia segun si la audiencia son ejecutivos, managers o equipo tecnico
- Carolyn: Periodismo de datos (video, 3 min): perspectiva de una periodista de datos — como simplificar sin perder precision
- DE LOS FILTROS A LOS GRAFICOS (video, 6 min): demostracion de como encadenar filtros interactivos en Tableau para explorar patrones en los datos
- Consejos convincentes para una presentacion (video): principios para que una presentacion de datos mantenga la atencion — brevedad, una idea por diapositiva, titulos como hallazgos
- Compartir una narracion (video, 5 min): como combinar el dashboard de Tableau con una narrativa oral en una presentacion en vivo
- Sundas: Como gestionar el sindrome del impostor (video): testimonio de analista sobre inseguridad y como superarla en el trabajo
- Desafio del modulo 3 (quiz calificado — completado)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: historias basadas en datos: evalua elementos del storytelling con datos (comunicar significado con visuales, captar la atencion de la audiencia y tecnica de destacar hallazgos clave)
- Pon a prueba tus conocimientos: comunicar historias de datos: evalua narrativa de datos, adaptacion del mensaje a la audiencia y estructura de la presentacion
- Pon a prueba tus conocimientos: panel de Tableau: evalua creacion de dashboards, configuracion de filtros globales y uso de acciones interactivas

**Modulo 4 — Develop Presentations and Slideshows:**

Lecturas clave:
- Paso a paso: Critica de una presentacion: framework para evaluar presentaciones de datos — claridad del titulo, si los graficos tienen etiquetas, si los hallazgos estan en el cuerpo del texto o solo en los graficos, y si las recomendaciones son accionables
- Guia: Compartir los resultados de los datos en las presentaciones: estructura recomendada de presentacion — slide 1 contexto, slides 2-4 hallazgos clave, slide 5 limitaciones, slide 6 recomendaciones; como escribir titulos de slide que ya sean el hallazgo
- Prepárese para las preguntas y respuestas: como anticipar las tres categorias de preguntas mas frecuentes (clarificacion de metodologia, profundizacion en un hallazgo, implicaciones para la decision) y preparar respuestas concisas
- Evalue su presentacion: lista de verificacion de 10 puntos antes de presentar — objetivos claros, titulos descriptivos, colores accesibles, fuentes citadas, recomendaciones concretas

Otras actividades:
- Juntelo todo (video, 1 min): introduccion al modulo — de los datos al producto final: la presentacion
- Presentar con un framework (video, 4 min): el framework McCandless — informacion, historia, objetivo y forma visual como columna vertebral de una presentacion
- Incorpore Datos a su presentacion (video, 4 min): como decidir que graficos incluir en slides vs cuales dejar en el dashboard de apoyo
- Connor: Ejemplo desordenado de una presentacion de Datos (video): caso practico — errores tipicos: demasiado texto, graficos sin contexto, sin recomendacion clara
- Connor: Buen ejemplo de presentacion de datos (video): el mismo caso con la presentacion correctamente estructurada — como cambia la comprension
- Consejos de presentacion probados (video): tecnicas practicas — hablar menos y mostrar mas, pausa antes del grafico clave, contacto visual con la audiencia
- Autorreflexion: Ejemplos de grandes presentaciones: analizar presentaciones reales de data storytelling (TED talks de datos) e identificar que tecnicas narrativas usan
- Presente como un profesional (video): como gestionar el tiempo, moverse entre slides y responder sin perder el hilo
- Anticiparse a la pregunta (video): como leer las senales de la audiencia para saber que preguntas vienen antes de que las hagan
- Manejar las objeciones (video): tecnicas para responder cuando alguien cuestiona los datos o la metodologia — escuchar, reconocer, responder con evidencia
- Autorreflexion: Practicar el manejo de las objeciones: ejercicio de roleplay escrito — dada una objecion tipica, redactar la respuesta como analista
- Buenas practicas de preguntas y respuestas (video): como decir "no se" de forma profesional y cuando es correcto posponer una respuesta para investigar
- Connor: Convertirse en un experto traductor de datos (video): como simplificar conceptos tecnicos para audiencias no tecnicas sin perder la precision
- Desafio del modulo 4 (quiz calificado — completado)
- Evaluacion del curso (quiz calificado final)

Cuestionarios de practica:
- Pon a prueba tus conocimientos: advertencias y limitaciones de los datos: evalua como comunicar limitaciones del analisis, uso de multiples fuentes en visualizaciones y manejo de preguntas sobre la metodologia
- Pon a prueba tus conocimientos: presentaciones eficaces: evalua estructura de presentaciones de datos, principios de claridad y comunicacion del hallazgo principal
- Pon a prueba tus conocimientos: escuchar, responder e incluir: evalua gestion de sesiones de preguntas y respuestas, respuesta a objeciones y como incluir a toda la audiencia
- Pon a prueba tus conocimientos: habilidades y practicas de presentacion: evalua tecnicas de presentacion profesional, ritmo, contacto visual y anticipacion de preguntas

---

## Cuando usar X vs Y

**Barras vs lineas:**
Barras para comparar categorias discretas entre si (ventas por producto, usuarios por pais). Lineas para mostrar la evolucion de una variable a lo largo del tiempo: el eje X es continuo y las lineas transmiten la idea de tendencia y cambio entre puntos.

**Pie/Donut vs barras:**
Pie o donut solo cuando hay 5-6 categorias como maximo y las diferencias entre ellas son visualmente distinguibles. En todos los demas casos usar barras: el ojo humano compara longitudes con mucha mas precision que angulos o areas. Con mas de 6 categorias un pie chart es practicamente ilegible.

**Scatter vs linea:**
Scatter para ver si existe una relacion entre dos variables numericas (precio vs demanda, edad vs ingresos) — cada punto es una observacion. Linea para ver como evoluciona una variable en el tiempo — los puntos estan conectados porque representan una secuencia.

**Dashboard vs presentacion:**
Dashboard para monitoreo continuo por personas que necesitan consultar el dato regularmente (operaciones, marketing). La audiencia vuelve al dashboard sola, sin necesidad de que alguien lo explique. Presentacion para comunicar hallazgos especificos a una audiencia en un momento concreto, con narrativa y contexto guiado por el analista.

**Tableau Public vs Google Sheets:**
Tableau para dashboards interactivos que se pueden publicar en la web, explorar con filtros y combinar multiples fuentes de datos. Sheets para analisis rapido y compartir con personas que no saben usar Tableau — la barrera de entrada es mucho menor pero las capacidades de interactividad son limitadas.

**Mapa de calor vs tabla:**
Mapa de calor cuando quieres ver patrones en una matriz de datos (actividad por hora y dia de la semana, correlaciones entre variables). Tabla cuando la audiencia necesita los valores exactos para tomar decisiones o hacer calculos adicionales.

---

## Errores comunes

- **Usar el grafico que queda mas bonito en lugar del que comunica mejor:** la estetica es secundaria a la claridad. Un grafico de barras simple que comunica el hallazgo claramente es mejor que un grafico 3D visualmente llamativo que confunde al lector.
- **Pie charts con mas de 5-6 categorias:** el ojo no distingue angulos similares. Un pie chart con 10 categorias es inutil — nadie puede decir que diferencia hay entre una categoria al 8% y otra al 11%.
- **Presentar un numero sin contexto:** "las ventas son 50.000" no significa nada sin saber si eso es bueno o malo, si sube o baja respecto al periodo anterior, y si esta por encima o por debajo del objetivo. Todo numero necesita una comparativa para tener significado.
- **Usar rojo y verde como unico diferenciador:** el daltonismo rojo-verde afecta al 8% de los hombres. Combinar siempre el color con otra cue visual (forma, patron, etiqueta) para que la visualizacion sea accesible.
- **Dashboards con demasiada informacion:** incluir todas las metricas disponibles no es mas util, es menos util. La jerarquia visual importa: lo critico debe verse inmediatamente, lo secundario debe ser accesible pero no competir por la atencion.
- **No dar titulos descriptivos a los graficos:** un titulo como "Ventas" no aporta nada. Un titulo como "Ventas mensuales Q1 2024 vs Q1 2023 — caida del 18% en marzo" ya es un hallazgo.

---

## Conexion con otros cursos

- Los tipos de datos del curso 3 (nominal, ordinal, continuo, discreto) determinan directamente que tipo de grafico es apropiado: datos continuos van bien en lineas e histogramas; datos nominales van bien en barras; datos ordinales pueden necesitar un orden especifico en el eje.
- Los hallazgos que se obtienen con SQL en el curso 5 son el input de las visualizaciones de este curso. Un analisis sin visualizacion es dificil de comunicar a una audiencia no tecnica.
- El curso 2 (stakeholders y comunicacion) conecta directamente con el modulo 4 de este curso: adaptar la presentacion a la audiencia es lo mismo que adaptar el nivel de detalle al stakeholder.
- Los principios de storytelling del modulo 3 son fundamentales para el capstone del curso 8: el case study necesita una narrativa clara que conecte el problema de negocio con los hallazgos y las recomendaciones.
- La distincion dashboard vs presentacion del modulo 1 conecta con report vs dashboard del curso 2: ambos conceptos describen el mismo trade-off entre monitoreo continuo y comunicacion puntual.

---

## Lo mas importante de este curso

**Elegir el grafico correcto** no es estetica — es claridad. El error mas
comun es usar el grafico que queda mas "impresionante" en lugar del que
comunica mejor.

**La historia importa tanto como los datos.** Un analisis impecable que
no se comunica bien no lleva a ninguna accion. Aprender a construir una
narrativa con datos es lo que distingue a un analista que genera impacto
de uno que solo genera informes.
