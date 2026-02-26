# Este código realiza la limpieza y depuración de la data de la investigación.

# -----------------------------------------
# 02_Limpieza_y_carga.R
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

png("results/figures/scatter_plot.png",
    width = 900, height = 700, res = 120)

# Ajustes gráficos
par(mar = c(5, 5, 4, 2))

plot(data$nivel_estudio, data$ingreso_total,
     main = "Relación entre Nivel Educativo e Ingreso Total",
     xlab = "Nivel de estudio",
     ylab = "Ingreso total",
     pch = 19,
     col = rgb(0.2, 0.4, 0.6, 0.6),
     cex = 1.2)

# Línea de regresión
modelo <- lm(ingreso_total ~ nivel_estudio, data = data)
abline(modelo, col = "green", lwd = 3)

# Agregar R² al gráfico
r2 <- summary(modelo)$r.squared
legend("topleft",
       legend = paste0("R² = ", round(r2, 3)),
       bty = "n",
       cex = 1.1)

dev.off()

# Mejora visualización

png("results/figures/scatter_plot2.png",
    width = 900, height = 700, res = 120)

# Ajustes gráficos
par(mar = c(5, 5, 4, 2))

plot(data$nivel_estudio, data$ingreso_total,
     main = "Relación entre Nivel Educativo e Ingreso Total",
     xlab = "Nivel de estudio",
     ylab = "Ingreso total",
     pch = 19,
     col = rgb(0.2, 0.4, 0.6, 0.6),
     cex = 1.2)

# Línea de regresión
modelo <- lm(ingreso_total ~ nivel_estudio, data = data)
abline(modelo, col = "darkred", lwd = 3)

# Agregar R² al gráfico
r2 <- summary(modelo)$r.squared
legend("topleft",
       legend = paste0("R² = ", round(r2, 3)),
       bty = "n",
       cex = 1.1)

dev.off()

# filtrar datos (solo de ciertos niveles de educacion)
data <- data %>% filter(nivel_estudio>3)

write.csv(data, "data/processed/clean_data.csv", row.names = FALSE)
