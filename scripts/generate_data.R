# scripts/generate_data.R

source("src/simulation.R")

data <- simulate_data(n = 1000)

write.csv(data, "data/raw/synthetic_data.csv", row.names = FALSE)