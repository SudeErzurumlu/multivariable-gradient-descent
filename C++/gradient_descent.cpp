// gradient_descent.cpp
// Generalized Gradient Descent Algorithm for Multivariable Function Minimization in C++

#include <iostream>
#include <vector>
#include <cmath>
#include <functional>

using namespace std;

// GradientDescent sınıfı
class GradientDescent {
private:
    function<double(vector<double>)> func;  // Optimize edilecek fonksiyon
    function<vector<double>(vector<double>)> gradient;  // Fonksiyonun gradyanı
    double learning_rate;  // Adım büyüklüğü
    int max_iterations;  // Maksimum iterasyon sayısı
    double tolerance;  // Yakınsama toleransı

public:
    // Constructor
    GradientDescent(function<double(vector<double>)> f,
                    function<vector<double>(vector<double>)> grad,
                    double lr, int max_iter, double tol) :
                    func(f), gradient(grad), learning_rate(lr), max_iterations(max_iter), tolerance(tol) {}

    // Minimum Bulan Fonksiyon
    vector<double> find_minimum(vector<double> initial_guess) {
        vector<double> x = initial_guess;

        for (int i = 0; i < max_iterations; i++) {
            vector<double> grad = gradient(x);
            vector<double> x_new = x;

            // Gradyan ve adım büyüklüğü ile her değişkeni güncelle
            for (int j = 0; j < x.size(); j++) {
                x_new[j] = x[j] - learning_rate * grad[j];
            }

            // Yakınsama kriterini kontrol et
            double diff = 0.0;
            for (int j = 0; j < x.size(); j++) {
                diff += pow(x_new[j] - x[j], 2);
            }

            if (sqrt(diff) < tolerance) {
                break; // Yakınsama sağlandıysa döngüden çık
            }

            x = x_new;
        }
        return x;
    }
};

// Örnek kullanım
int main() {
    // Örnek fonksiyon f(x, y) = (x - 3)^2 + (y + 1)^2
    auto func = [](vector<double> v) {
        return pow(v[0] - 3, 2) + pow(v[1] + 1, 2);
    };

    // Fonksiyonun gradyanı
    auto gradient = [](vector<double> v) {
        return vector<double>{2 * (v[0] - 3), 2 * (v[1] + 1)};
    };

    // Parametreleri belirleyelim
    double learning_rate = 0.1;
    int max_iterations = 1000;
    double tolerance = 1e-6;

    // Sınıfı başlat ve örnek fonksiyon için minimum bul
    GradientDescent gd(func, gradient, learning_rate, max_iterations, tolerance);
    vector<double> initial_guess = {0, 0};
    vector<double> minimum = gd.find_minimum(initial_guess);

    // Sonucu yazdır
    cout << "Minimum bulunduğu nokta: (" << minimum[0] << ", " << minimum[1] << ")" << endl;

    return 0;
}
