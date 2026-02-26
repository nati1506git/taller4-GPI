# runall.R

if (requireNamespace("renv", quietly = TRUE)) {
  renv::load()
}

library(here)

cat("Iniciando proyecto...\n")

source("src/01_simular_datos.R")
source("src/02_graficos.R")

cat("Proyecto ejecutado correctamente.\n")