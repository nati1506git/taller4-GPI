analyze_data <- function(path_input, path_output) {
  
  # Leer datos
  data <- read.csv(path_input)
  
  # Ajustar modelo lineal
  model <- lm(ingreso_total ~ nivel_estudio, data = data)
  
  # Extraer coeficientes
  results <- as.data.frame(summary(model)$coefficients)
  
  # Guardar resultados procesados
  write.csv(results, path_output, row.names = TRUE)
  
  return(model)
}


