# Paso 6: Notebook creado en Kaggle

## Notebook vinculado al dataset Animal Crossing

Se creó un Kaggle Notebook vinculando el dataset Animal Crossing New Horizons Catalog
como fuente de datos.

**Nombre del notebook:** notebookc80caa05b1
**URL:** https://www.kaggle.com/code/aroaxinping/notebookc80caa05b1
**Versión guardada:** Version 1

### Dataset vinculado

- **Animal Crossing New Horizons Catalog** → disponible en `/kaggle/input/`

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

### Nota

Este notebook es el equivalente al paso 5 (Netflix) pero aplicado al dataset
de Animal Crossing que se exploró en los pasos 1-3 de esta actividad.
