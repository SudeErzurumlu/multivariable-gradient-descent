% gradient_descent.m
% Gradient Descent Algorithm for Multivariable Function Minimization in MATLAB

function [minimum, iterations, converged] = gradient_descent(func, grad_func, initial_guess, learning_rate, max_iterations, tolerance)
    % Inputs:
    %   func - Handle to the multivariable function to minimize
    %   grad_func - Handle to the gradient function of func
    %   initial_guess - Initial starting point for the algorithm
    %   learning_rate - Step size for gradient descent
    %   max_iterations - Maximum number of iterations allowed
    %   tolerance - Convergence threshold for stopping criterion
    
    % Initialize variables
    x = initial_guess;
    converged = false;
    
    for i = 1:max_iterations
        grad = grad_func(x);
        x_new = x - learning_rate * grad;
        
        % Check for convergence
        if norm(x_new - x) < tolerance
            converged = true;
            break;
        end
        
        x = x_new;
    end
    
    % Output results
    minimum = x;
    iterations = i;
end
