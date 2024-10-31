# example_usage.py
# Example usage of the Gradient Descent algorithm for a multivariable function in Python

from gradient_descent import GradientDescent

# Define the function f(x, y) = (x - 3)^2 + (y + 1)^2
def func(v):
    return (v[0] - 3)**2 + (v[1] + 1)**2

# Define the gradient of the function
def gradient(v):
    return [2 * (v[0] - 3), 2 * (v[1] + 1)]

# Set parameters
initial_guess = [0, 0]
learning_rate = 0.1
max_iterations = 1000
tolerance = 1e-6

# Create an instance of GradientDescent and find the minimum
gd = GradientDescent(func, gradient, learning_rate, max_iterations, tolerance)
result = gd.find_minimum(initial_guess)

# Display the result
if result["converged"]:
    print("Minimum found at:", result["minimum"], "after", result["iterations"], "iterations")
else:
    print("Solution did not converge within the given tolerance and iteration limit.")
