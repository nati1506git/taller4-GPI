

# Este código realiza la limpieza y depuración de la data de la investigación.

# -----------------------------------------
# estadisticas
# -----------------------------------------

if (requireNamespace("renv", quietly = TRUE)) {
  renv::load()
}

renv::init()


library(here)
library(dplyr)
set.seed(123)

# Ruta correcta usando hee()
ruta_datos <- here("data/raw", "synthetic_data.csv")



# Verificar que el archivo exista
if (!file.exists(ruta_datos)) {
  stop("El archivo de datos no existe. Ejecute primero 00_Simule_data.R")
}

# Cargar datos
data <- read.csv(ruta_datos)


estadistico <- mean(data$ingreso_total)
