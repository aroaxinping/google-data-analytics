# Apuntes — Course 2: Ask Questions to Make Data-Driven Decisions

**Duracion:** 15 horas
**Modulos:** 4

---

## Que cubre este curso

La fase "Ask" del proceso de analisis y como comunicarse con stakeholders.
Tambien introduce Sheets con mas profundidad: no solo calculos basicos, sino
pensar en tablas, estructuras y herramientas como VLOOKUP y pivot tables.

---

## Modulo 1: Ask Effective Questions

El trabajo del analista empieza mucho antes de tocar datos. Empieza por
formular bien la pregunta.

**Framework SMART para preguntas:**

| Letra | Criterio | Ejemplo malo | Ejemplo bueno |
|-------|----------|--------------|---------------|
| S - Specific | Especifica | "Hay problemas con ventas?" | "Que productos bajaron >15% en Q1?" |
| M - Measurable | Medible | "Va bien la app?" | "Cual es la retencion a 7 dias?" |
| A - Action-oriented | Orientada a accion | "Que paso?" | "Que podemos hacer para mejorar X?" |
| R - Relevant | Relevante | (no aporta a la decision) | (directamente util para el negocio) |
| T - Time-bound | Acotada en tiempo | "En general" | "En Q1 2024 vs Q1 2023" |

**Tipos de problemas que resuelve un analista:**

1. Hacer predicciones
2. Categorizar cosas
3. Detectar anomalias
4. Identificar temas
5. Descubrir conexiones
6. Encontrar patrones

**Pensamiento estructurado:** antes de analizar, definir claramente
el problema, el contexto disponible, los desafios y la solucion esperada.

---

## Modulo 2: Make Data-Driven Decisions

Como los datos influyen en las decisiones de negocio y la diferencia entre
decisiones basadas en datos vs basadas en intuicion.

**Datos cualitativos vs cuantitativos:**

- **Cuantitativos:** numericos, medibles (ventas, edad, tiempo)
- **Cualitativos:** descriptivos, no numericos (opinion, categoria, texto)

Los dos tipos se usan juntos. Los cuantitativos responden "cuanto/cuantos",
los cualitativos responden "por que" y "como".

**Metricas:**
Una metrica es una medicion unica que se puede usar para evaluar rendimiento.
Ejemplo: tasa de conversion, NPS, tiempo en pagina.

**Reports vs Dashboards:**

| Report | Dashboard |
|--------|-----------|
| Estatico, para un momento concreto | Dinamico, se actualiza en tiempo real |
| Historico | Presente y tendencias |
| Para una audiencia especifica | Para monitoreo continuo |
| Mas detallado | Mas visual y resumido |

---

## Modulo 3: Spreadsheet Magic

El modulo mas largo del curso (7 horas). Sheets como herramienta real de
analisis, no solo para escribir listas.

**Organizar datos en Sheets:**
- Cada columna = un atributo (nombre, fecha, precio...)
- Cada fila = un registro/observacion
- Primera fila = cabeceras descriptivas
- Sin celdas combinadas en datos (rompen los filtros y formulas)

**Funciones esenciales:**

```
=SUM(rango)          -> sumar
=AVERAGE(rango)      -> media
=COUNT(rango)        -> contar celdas con numeros
=COUNTA(rango)       -> contar celdas no vacias
=MAX(rango)          -> valor maximo
=MIN(rango)          -> valor minimo
=IF(condicion, si, no)  -> logica condicional
=COUNTIF(rango, criterio)  -> contar con condicion
=SUMIF(rango, criterio, suma_rango)  -> sumar con condicion
```

**VLOOKUP — buscar en otra tabla:**
```
=VLOOKUP(valor_buscado, rango_tabla, columna_retorno, FALSE)
```
- El ultimo parametro: FALSE = coincidencia exacta (siempre asi para IDs)
- La columna_retorno es relativa al rango, no a la hoja completa

**Tablas pivot:**
- Insert > Pivot table
- Rows: dimension por la que agrupar
- Values: metrica a calcular (SUM, COUNT, AVERAGE...)
- Filters: para segmentar
- Equivalente en SQL: GROUP BY

**Errores comunes en Sheets:**

| Error | Causa |
|-------|-------|
| #DIV/0! | Division entre cero o celda vacia |
| #VALUE! | Tipo de dato incorrecto en formula |
| #REF! | Referencia a celda que no existe |
| #N/A | VLOOKUP no encuentra el valor |
| #NAME? | Nombre de funcion mal escrito |

---

## Modulo 4: Always Remember the Stakeholder

Comunicacion con stakeholders: una de las habilidades menos tecnicas pero
mas importantes de un analista.

**Tipos de stakeholders:**
- **Ejecutivos:** quieren el resumen, impacto en negocio, sin tecnicismos
- **Managers:** quieren contexto, proceso, pueden entender algo de tecnico
- **Equipo analitico:** pueden ver todo el detalle tecnico

**Reglas de comunicacion:**
- Adaptar el nivel tecnico a la audiencia
- Dar contexto antes de los datos (por que importa esto)
- Ser proactivo con las limitaciones de los datos
- No esperar a que pregunten: anticipar las dudas mas probables

**Lidiar con datos insuficientes:**
- Comunicarlo a tiempo, no al final
- Proponer alternativas (proxies, periodos distintos, fuentes adicionales)
- Documentar las limitaciones en el analisis final

---

## Esquema resumido del curso

```
COURSE 2: ASK QUESTIONS
|
+-- Formular la pregunta correcta
|     Framework SMART
|     Tipos de problemas analiticos
|
+-- Datos y decisiones
|     Cualitativo vs cuantitativo
|     Metricas
|     Reports vs Dashboards
|
+-- Sheets como herramienta de analisis
|     Estructura de datos en tabla
|     Funciones: SUM, IF, COUNTIF, VLOOKUP
|     Tablas pivot = GROUP BY visual
|
+-- Comunicacion con stakeholders
      Adaptar el mensaje a la audiencia
      Ser proactivo con limitaciones
```

---

## Lo mas importante de este curso

Dos cosas que se llevan de este curso y se usan en todos los demas:

1. **SMART questions:** si la pregunta no esta bien definida, el analisis no
   tiene direccion. Vale la pena invertir tiempo en esto antes de tocar datos.

2. **VLOOKUP / JOIN:** la capacidad de combinar datos de fuentes distintas es
   probablemente la habilidad mas usada en el dia a dia de un analista junior.
   En Sheets es VLOOKUP, en SQL es JOIN — mismo concepto, distinta sintaxis.
