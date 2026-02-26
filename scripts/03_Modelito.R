# En este archivo se correra el modelito econometrico de la investigación


# Ruta correcta usando hee()
ruta_datos <- here("data/processed", "clean_data.csv")

# Carga función

source("src/funcion_modelo.R")




if (requireNamespace("renv", quietly = TRUE)) {
  renv::load()
}

# Ejecutar análisis
model <- analyze_data(
  path_input = "data/raw/synthetic_data.csv",
  path_output = "data/processed/clean_data.csv"
)


cat("Análisis completado correctamente\n")



