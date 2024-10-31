% example_usage.m
% Example usage of the Gradient Descent algorithm for a multivariable function in MATLAB

% Define the function f(x, y) = (x - 3)^2 + (y + 1)^2
func = @(v) (v(1) - 3)^2 + (v(2) + 1)^2;

% Define the gradient of the function: ∇f(x, y) = [2*(x - 3), 2*(y + 1)]
grad_func = @(v) [2 * (v(1) - 3); 2 * (v(2) + 1)];

% Gradient descent parameters
initial_guess = [0; 0];
learning_rate = 0.1;
max_iterations = 1000;
tolerance = 1e-6;

% Run gradient descent
[minimum, iterations, converged] = gradient_descent(func, grad_func, initial_guess, learning_rate, max_iterations, tolerance);

% Display the results
if converged
    fprintf('Minimum found at: (%.6f, %.6f) - Iterations: %d\n', minimum(1), minimum(2), iterations);
else
    fprintf('Solution did not converge within the given tolerance and iteration limit.\n');
end
