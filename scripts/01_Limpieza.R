# Este código realiza la limpieza y depuración de la data de la investigación.

# -----------------------------------------
# 02_Limpieza_y_carga.R
# -----------------------------------------

library(here)
library(dplyr)
set.seed(123)

if (requireNamespace("renv", quietly = TRUE)) {
  renv::load()
}


# Ruta correcta usando hee()
ruta_datos <- here("data/raw", "synthetic_data.csv")

# Verificar que el archivo exista
if (!file.exists(ruta_datos)) {
  stop("El archivo de datos no existe. Ejecute primero 00_Simule_data.R")
}

# Cargar datos
data <- read.csv(ruta_datos)

# Verificar estructura
str(data)
summary(data)


# Descriptivos


png("results/figures/scatter_plot.png")

plot(data$nivel_estudio, data$ingreso_total,
     main = "Relación entre ingresos y educacion",
     xlab = "nivel_estudio",
     ylab = "ingreso_total",
     pch = 19)

abline(lm(ingreso_total ~ nivel_estudio, data = data), col = "red", lwd = 2)

dev.off()

cat("Gráfico generado correctamente\n")





# filtrar datos (solo de ciertos niveles de educacion)
data <- data %>% filter(nivel_estudio>3)

write.csv(data, "data/processed/clean_data.csv", row.names = FALSE)
