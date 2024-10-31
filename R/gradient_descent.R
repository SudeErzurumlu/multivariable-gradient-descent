# gradient_descent.R
# Gradient Descent Algorithm for Multivariable Function Minimization in R

# Gradient descent function for multivariable functions
gradient_descent <- function(func, gradient, initial_guess, learning_rate = 0.01, max_iterations = 1000, tolerance = 1e-6) {
  
  # Initialize variables
  x <- initial_guess
  converged <- FALSE
  
  for (i in 1:max_iterations) {
    # Compute gradient
    grad <- gradient(x)
    
    # Update x by moving in the direction of the negative gradient
    x_new <- x - learning_rate * grad
    
    # Check for convergence
    if (sqrt(sum((x_new - x)^2)) < tolerance) {
      converged <- TRUE
      break
    }
    
    # Update x for the next iteration
    x <- x_new
  }
  
  list(minimum = x, converged = converged)
}
