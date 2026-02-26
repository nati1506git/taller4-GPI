#install.packages("here")
#install.packages("renv")
library(here)

# scripts/generate_data.R

if (requireNamespace("renv", quietly = TRUE)) {
  renv::load()
}

renv::init()
# Simulación de datos sociodemográficos
n <- 10000

data <- data.frame(
  edad = sample(18:80, n, replace = TRUE),
  ingreso_total = round(rnorm(n, mean = 4000000, sd = 800000), 0),
  nivel_estudio = sample(1:5, n, replace = TRUE),
  tamaño_hogar = sample(1:6, n, replace = TRUE)
)


write.csv(data, "data/raw/synthetic_data.csv", row.names = FALSE)
