// example_usage.c
// Example usage of the Gradient Descent algorithm for a multivariable function in C

#include <stdio.h>
#include "gradient_descent.c"

// Örnek fonksiyon f(x, y) = (x - 3)^2 + (y + 1)^2
double func(double *v) {
    return pow(v[0] - 3, 2) + pow(v[1] + 1, 2);
}

// Fonksiyonun gradyanı: ∇f(x, y) = [2*(x - 3), 2*(y + 1)]
void gradient(double *v, double *grad) {
    grad[0] = 2 * (v[0] - 3);
    grad[1] = 2 * (v[1] + 1);
}

int main() {
    GradientDescent gd;
    gd.func = func;
    gd.gradient = gradient;
    gd.learning_rate = 0.1;
    gd.max_iterations = 1000;
    gd.tolerance = 1e-6;

    double initial_guess[2] = {0, 0};
    double minimum[2];

    int iterations = find_minimum(&gd, initial_guess, minimum);

    printf("Minimum bulunduğu nokta: (%.6f, %.6f) - Iterations: %d\n", minimum[0], minimum[1], iterations);

    return 0;
}
