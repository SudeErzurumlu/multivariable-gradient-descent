# gradient_descent.py
# Gradient Descent Algorithm for Multivariable Function Minimization in Python

import numpy as np

class GradientDescent:
    def __init__(self, func, gradient, learning_rate=0.01, max_iterations=1000, tolerance=1e-6):
        self.func = func
        self.gradient = gradient
        self.learning_rate = learning_rate
        self.max_iterations = max_iterations
        self.tolerance = tolerance
    
    def find_minimum(self, initial_guess):
        x = np.array(initial_guess, dtype=float)
        
        for i in range(self.max_iterations):
            grad = np.array(self.gradient(x))
            x_new = x - self.learning_rate * grad
            
            # Check for convergence
            if np.linalg.norm(x_new - x) < self.tolerance:
                return {"minimum": x_new, "iterations": i+1, "converged": True}
            
            x = x_new
        
        return {"minimum": x, "iterations": self.max_iterations, "converged": False}
