// ExampleUsage.java
// Example usage of the Gradient Descent algorithm for a multivariable function in Java

public class ExampleUsage {

    public static void main(String[] args) {
        // Örnek fonksiyon f(x, y) = (x - 3)^2 + (y + 1)^2
        Function<double[], Double> func = v -> Math.pow(v[0] - 3, 2) + Math.pow(v[1] + 1, 2);

        // Fonksiyonun gradyanı ∇f(x, y) = [2*(x - 3), 2*(y + 1)]
        Function<double[], double[]> gradient = v -> new double[]{2 * (v[0] - 3), 2 * (v[1] + 1)};

        // Gradient Descent parametreleri
        double learningRate = 0.1;
        int maxIterations = 1000;
        double tolerance = 1e-6;
        double[] initialGuess = {0, 0};

        // GradientDescent nesnesi oluşturulması ve minimumun bulunması
        GradientDescent gd = new GradientDescent(func, gradient, learningRate, maxIterations, tolerance);
        GradientDescent.Result result = gd.findMinimum(initialGuess);

        // Sonucu göster
        if (result.converged) {
            System.out.printf("Minimum bulunduğu nokta: (%.6f, %.6f) - Iterations: %d\n",
                    result.minimum[0], result.minimum[1], result.iterations);
        } else {
            System.out.println("Çözüm, belirtilen tolerans ve iterasyon sınırında yakınsamadı.");
        }
    }
}
