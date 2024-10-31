// gradient_descent.c
// Gradient Descent Algorithm for Multivariable Function Minimization in C

#include <stdio.h>
#include <math.h>

// Gradient Descent struct for function parameters
typedef struct {
    double (*func)(double *);        // Optimize edilecek fonksiyon
    void (*gradient)(double *, double *); // Fonksiyonun gradyanı
    double learning_rate;            // Adım büyüklüğü
    int max_iterations;              // Maksimum iterasyon sayısı
    double tolerance;                // Yakınsama toleransı
} GradientDescent;

// Gradient Descent algoritması fonksiyonu
int find_minimum(GradientDescent *gd, double *initial_guess, double *minimum) {
    double x[2] = {initial_guess[0], initial_guess[1]};
    double grad[2];
    int i;

    for (i = 0; i < gd->max_iterations; i++) {
        gd->gradient(x, grad);
        
        double x_new[2] = {
            x[0] - gd->learning_rate * grad[0],
            x[1] - gd->learning_rate * grad[1]
        };
        
        double diff = sqrt(pow(x_new[0] - x[0], 2) + pow(x_new[1] - x[1], 2));
        
        if (diff < gd->tolerance) {
            minimum[0] = x_new[0];
            minimum[1] = x_new[1];
            return i + 1; // Yakınsama sağlandı
        }
        
        x[0] = x_new[0];
        x[1] = x_new[1];
    }
    
    minimum[0] = x[0];
    minimum[1] = x[1];
    return gd->max_iterations; // Maksimum iterasyonlara ulaşıldıysa
}
