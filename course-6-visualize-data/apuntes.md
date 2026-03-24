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

## Actividades del curso

**Modulo 1 — Visualize Data:**
- Por que la visualizacion funciona: como procesa el cerebro imagenes vs texto (video)
- Tipos de visualizacion y cuando usarlos (video + lectura)
- Principios de diseno: pre-atentivo, accesibilidad, simplicidad, jerarquia (video)
- Cuando no usar un pie chart (lectura)
- Design thinking aplicado a visualizacion de datos (video)
- Actividad practica: elegir el tipo de grafico correcto para distintos escenarios (hands-on)
- Desafio del modulo 1 (quiz calificado)

**Modulo 2 — Create Data Visualizations with Tableau:**
- Dimensions vs Measures en Tableau (video)
- Marks card, Shelves, Show Me (video)
- Flujo basico para crear una visualizacion en Tableau (lectura)
- Medidas calculadas y LOD expressions (video)
- Actividad practica: crear visualizaciones en Tableau Public (hands-on calificable)
- Actividad practica: crear un dashboard interactivo con filtros (hands-on calificable)
- Desafio del modulo 2 (quiz calificado)

**Modulo 3 — Craft Data Stories:**
- Los 3 elementos de una historia de datos: personajes, contexto, tension (video)
- Estructura clasica para presentar resultados (video)
- Dashboards en Tableau: combinar hojas, filtros globales y acciones (video)
- Contexto para los numeros: comparativas y benchmarks (lectura)
- Actividad practica: construir un dashboard narrativo en Tableau (hands-on calificable)
- Desafio del modulo 3 (quiz calificado)

**Modulo 4 — Develop Presentations and Slideshows:**
- Estructura de una presentacion de analisis (video)
- Comunicar limitaciones de los datos (lectura)
- Manejar preguntas dificiles en presentaciones (video)
- Actividad practica: crear una presentacion de analisis completa (hands-on calificable)
- Evaluacion del curso (quiz calificado final)

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

- **Usar el grafico que queda mas bonito en lugar del que comunica mejor:** la estetica es secundaria a la claridad. Un grafico de barras simple que comunica el hallazgoclaramente es mejor que un grafico 3D visualmente llamativo que confunde al lector.
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
