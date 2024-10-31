# example_usage.R
# Example usage of the Gradient Descent algorithm for a multivariable function in R

# Define the function f(x, y) = (x - 3)^2 + (y + 1)^2
func <- function(v) {
  (v[1] - 3)^2 + (v[2] + 1)^2
}

# Define the gradient of the function
gradient <- function(v) {
  c(2 * (v[1] - 3), 2 * (v[2] + 1))
}

# Set parameters
initial_guess <- c(0, 0)
learning_rate <- 0.1
max_iterations <- 1000
tolerance <- 1e-6

# Call the gradient_descent function
result <- gradient_descent(func, gradient, initial_guess, learning_rate, max_iterations, tolerance)

# Display the result
if (result$converged) {
  cat("Minimum found at:", result$minimum, "\n")
} else {
  cat("Solution did not converge within the given tolerance and iteration limit.\n")
}
