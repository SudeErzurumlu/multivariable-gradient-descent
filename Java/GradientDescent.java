// GradientDescent.java
// Gradient Descent Algorithm for Multivariable Function Minimization in Java

import java.util.function.Function;

public class GradientDescent {

    private Function<double[], Double> func;         // Optimize edilecek fonksiyon
    private Function<double[], double[]> gradient;   // Fonksiyonun gradyanı
    private double learningRate;                     // Adım büyüklüğü
    private int maxIterations;                       // Maksimum iterasyon sayısı
    private double tolerance;                        // Yakınsama toleransı

    // Constructor
    public GradientDescent(Function<double[], Double> func, Function<double[], double[]> gradient,
                           double learningRate, int maxIterations, double tolerance) {
        this.func = func;
        this.gradient = gradient;
        this.learningRate = learningRate;
        this.maxIterations = maxIterations;
        this.tolerance = tolerance;
    }

    // Minimum bulma fonksiyonu
    public Result findMinimum(double[] initialGuess) {
        double[] x = initialGuess.clone();
        
        for (int i = 0; i < maxIterations; i++) {
            double[] grad = gradient.apply(x);
            double[] xNew = new double[x.length];

            for (int j = 0; j < x.length; j++) {
                xNew[j] = x[j] - learningRate * grad[j];
            }

            // Yakınsama kontrolü
            if (euclideanDistance(x, xNew) < tolerance) {
                return new Result(xNew, i + 1, true);
            }

            x = xNew;
        }
        
        return new Result(x, maxIterations, false);
    }

    // İki vektör arasındaki öklid mesafesini hesaplama
    private double euclideanDistance(double[] a, double[] b) {
        double sum = 0.0;
        for (int i = 0; i < a.length; i++) {
            sum += Math.pow(a[i] - b[i], 2);
        }
        return Math.sqrt(sum);
    }

    // Result class
    public static class Result {
        public double[] minimum;
        public int iterations;
        public boolean converged;

        public Result(double[] minimum, int iterations, boolean converged) {
            this.minimum = minimum;
            this.iterations = iterations;
            this.converged = converged;
        }
    }
}
