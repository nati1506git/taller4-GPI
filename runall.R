# runall.R

if (requireNamespace("renv", quietly = TRUE)) {
  renv::load()
}

library(here)

cat("Iniciando proyecto...\n")

source("scripts/01_generate_data.R")
source("scripts/01_Limpieza.R")
source("src/funcion_modelo.R")
source("scripts/03_Modelito.R")

cat("Proyecto ejecutado correctamente.\n")