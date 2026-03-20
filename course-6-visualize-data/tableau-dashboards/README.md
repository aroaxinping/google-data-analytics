# Tableau Dashboards — Course 6

**Curso:** Course 6 — Share Data Through the Art of Visualization
**Herramienta:** Tableau Public (version gratuita)

## Resumen del curso

El Course 6 ensenha a comunicar hallazgos a traves de visualizaciones.
Tableau es la herramienta principal: permite arrastrar campos a un lienzo
y construir graficos interactivos sin escribir codigo. Los modulos 2, 3 y 4
cada uno tienen un dashboard distinto con complejidad creciente.

---

## Dashboard 1 — Exploracion inicial (Modulo 2)

**Datos:** Dataset de ventas de productos de oficina (proporcionado por Coursera,
formato CSV con columnas: Order ID, Order Date, Ship Date, Category,
Sub-Category, Sales, Quantity, Discount, Profit, Region, State).

**Objetivo:** Familiarizarse con la interfaz de Tableau y crear las primeras
visualizaciones basicas.

**Graficos construidos:**

- Grafico de barras horizontales: ventas totales por categoria de producto
  (Furniture, Office Supplies, Technology). Se arrastra Category a Rows
  y SUM(Sales) a Columns.
- Grafico de lineas: evolucion de ventas mensuales a lo largo del tiempo.
  Order Date (Month) en el eje X, SUM(Sales) en el eje Y.
- Mapa de burbujas: distribucion geografica de ventas por estado.
  Tableau detecta automaticamente State como campo geografico.

**Conceptos de Tableau aplicados:**

- Conectar una fuente de datos CSV
- Diferencia entre Dimensions (categorias, texto, fechas) y Measures (numeros)
- Drag and drop de campos a Rows, Columns, Color, Size, Label
- Cambiar el tipo de grafico desde Show Me
- Formatear ejes y titulos

**Filtros y acciones:**

- Filtro de fecha por rango: permite seleccionar un periodo concreto
- Filtro de categoria como lista de seleccion multiple

---

## Dashboard 2 — Analisis de rendimiento (Modulo 3)

**Datos:** Mismo dataset de ventas de oficina del Modulo 2, mas una tabla
adicional con objetivos de ventas por region (Join en Tableau).

**Objetivo:** Construir un dashboard con multiples hojas coordinadas que
permitan hacer drill-down desde lo general hasta el detalle.

**Graficos construidos:**

- Treemap: ventas por sub-categoria usando el tamano del rectangulo para
  representar el volumen y el color para el margen de beneficio (Profit).
  Permite ver de un vistazo que sub-categorias tienen alto volumen pero
  bajo margen.
- Scatter plot (dispersion): relacion entre Discount y Profit por pedido.
  Muestra visualmente que los descuentos altos correlacionan con perdidas.
- Tabla de texto (crosstab): ventas y beneficio por Region y Category,
  con formato condicional (color segun si el beneficio es positivo o negativo).
- KPI cards: cuatro metricas clave en la parte superior del dashboard
  (Total Ventas, Total Beneficio, Margen %, Num Pedidos).

**Conceptos de Tableau aplicados:**

- Crear campos calculados: Margen % = SUM(Profit) / SUM(Sales)
- Formatear numeros como porcentaje o moneda
- Usar Level of Detail (LOD) expressions basicas: FIXED para calcular
  el beneficio total por cliente independientemente de los filtros activos
- Combinar dos fuentes de datos con un Join por campo comun (Region)

**Filtros y acciones:**

- Filter Action: al hacer clic en una region del mapa, filtra automaticamente
  todos los demas graficos del dashboard para mostrar solo esa region
- Highlight Action: al pasar el cursor por una categoria en el treemap,
  se resaltan los puntos correspondientes en el scatter plot
- Filtro de segmento (Consumer / Corporate / Home Office) como selector
  de radio button en el dashboard

---

## Dashboard 3 — Storytelling y presentacion (Modulo 4)

**Datos:** Dataset publico de Tableau: Superstore Sales (incluido en la
instalacion de Tableau Desktop y disponible en Tableau Public).

**Objetivo:** Construir una Story de Tableau (narrativa de multiples slides)
que cuente una historia coherente con los datos, pensada para presentarse
a un stakeholder no tecnico.

**Graficos construidos:**

- Mapa coropletico (filled map): beneficio por estado con escala de color
  divergente (rojo para perdidas, azul para ganancias). Permite identificar
  de inmediato los estados problematicos.
- Bullet chart (grafico de bala): comparacion de ventas reales vs objetivo
  por region. Muestra en una sola barra si se cumplio la meta y por cuanto.
- Line chart con referencia: evolucion de ventas con una linea de referencia
  horizontal en el promedio historico para contextualizar los picos y valles.
- Tabla de los 10 peores productos por margen de beneficio: lista ordenada
  de los productos que mas dinero pierden, con su categoria y region.

**Conceptos de Tableau aplicados:**

- Tableau Stories: crear una narrativa con multiples Story Points, cada
  uno con un grafico y un texto de contexto
- Dual axis: superponer dos graficos en el mismo eje (barras + linea)
  para comparar ventas y beneficio en el mismo grafico sin duplicar espacio
- Sets: crear un conjunto de los "Top 10 clientes por ventas" para usarlo
  como filtro dinamico
- Formatear para presentacion: eliminar lineas de cuadricula innecesarias,
  ajustar tipografia, agregar anotaciones en puntos de datos relevantes

**Filtros y acciones:**

- URL Action: al hacer clic en el nombre de un producto, abre la pagina
  del producto en el sitio web (ejemplo de integracion externa)
- Parameter: control deslizante que permite al usuario seleccionar el
  numero de productos a mostrar en el ranking (Top N dinamico)
- Dashboard Actions coordinadas: seleccionar un estado en el mapa actualiza
  el bullet chart de region y la tabla de productos problematicos

---

## Recursos de Tableau usados en el curso

- Tableau Public (descarga gratuita): para publicar y compartir dashboards
- Tableau Help Center: referencia de funciones de campos calculados
- Dataset Superstore: incluido en Tableau, perfecto para practicar sin
  necesidad de buscar datos propios
