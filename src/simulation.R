# src/functions.R

simulate_data <- function(n) {
  data.frame(
    x = rnorm(n),
    y = rnorm(n)
  )
}