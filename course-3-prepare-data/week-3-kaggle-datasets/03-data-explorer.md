# Paso 3: Explorador de datos - umbrellas.csv

## El Explorador de datos

El dataset Animal Crossing contiene **30 archivos .csv**. El Data Explorer
permite previsualizar cada archivo sin descargarlo.

### Vistas disponibles

| Vista | Descripción |
|-------|-------------|
| **Detail** | Resumen estadístico de cada columna |
| **Compact** | Vista compacta de las filas |
| **Column** | Vista centrada en una columna |

## Análisis de umbrellas.csv (9.4 kB)

### Columnas identificadas (16 en total)

| Columna | Tipo de dato | Icono |
|---------|-------------|-------|
| Name | String (texto) | A |
| DIY | Boolean | ✓ |
| Buy | Numérico | # |
| Sell | Numérico | # |
| Color 1 | String (texto) | A |
| ... | ... | ... |

### Resúmenes estadísticos observados

**Name:**
- 67 valores únicos (67 paraguas diferentes en el juego)

**DIY (¿Es receta de bricolaje?):**
- `true`: 9 paraguas (13%) — se pueden fabricar
- `false`: 58 paraguas (87%) — solo se compran

**Buy (precio de compra en Bells):**
- Rango observado: 80 → 3,500 Bells
- Algunos tienen valor NFS (Not For Sale)
- Ejemplo: "fish umbrella" → NFS

**Color 1:**
- Valores: Green, Yellow, Blue, y más

### Ejemplos de registros

| Name | DIY | Buy | Sell | Color 1 |
|------|-----|-----|------|---------|
| eggy parasol | No | 750 | 187 | Yellow |
| exquisite parasol | No | 1,670 | 417 | Yellow |
| fairy-tale umbrella | No | 820 | 205 | Green |
| fish umbrella | No | NFS | 80 | Blue |
| frog umbrella | No | 1,570 | 392 | Green |

## Tipos de datos observados

En el explorador, cada columna tiene un icono que indica el tipo:
- **A** → datos de texto (string)
- **#** → datos numéricos (integer/float)
- **✓** → datos booleanos (true/false)
