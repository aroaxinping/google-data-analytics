# Paso 5: Notebook creado en Kaggle

## Notebook vinculado al dataset Netflix

Se creó un Kaggle Notebook vinculando el dataset Netflix Movies and TV Shows
como fuente de datos.

**Nombre del notebook:** notebooke9d3a53d16
**URL:** https://www.kaggle.com/code/aroaxinping/notebooke9d3a53d16
**Versión guardada:** Version 1

### Dataset vinculado

- **Netflix Movies and TV Shows** → disponible en `/kaggle/input/netflix-shows/`

### Cómo vincular un dataset a un notebook en Kaggle

**Opción A - Desde la página del dataset:**
1. Abrir el dataset en Kaggle
2. Clic en el botón `<> Code` del encabezado
3. En el panel que aparece, clic en `+ Create a notebook`

**Opción B - Desde el editor de notebooks:**
1. Crear nuevo notebook en `kaggle.com/code/new`
2. En el panel lateral derecho → sección `Input`
3. Clic en `+ Add Input`
4. Buscar el dataset y clic en `+`

**Opción C - Descarga directa:**
- Clic en el botón `Download` del encabezado del dataset
- Se descarga un `.zip` con todos los archivos CSV

### Código base generado automáticamente

```python
import numpy as np
import pandas as pd

# Input data files are available in the read-only "../input/" directory
import os
for dirname, _, filenames in os.walk('/kaggle/input'):
    for filename in filenames:
        print(os.path.join(dirname, filename))
```

### Cómo guardar una versión

1. Clic en `Save Version` (esquina superior derecha)
2. Nombre de versión: "Version 1"
3. Tipo: `Save & Run All (Commit)`
4. Clic en `Save`
