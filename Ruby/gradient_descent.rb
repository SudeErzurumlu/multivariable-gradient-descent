# gradient_descent.rb
# Gradient Descent Algorithm for Multivariable Function Minimization in Ruby

class GradientDescent
  attr_accessor :func, :gradient, :learning_rate, :max_iterations, :tolerance

  def initialize(func:, gradient:, learning_rate: 0.01, max_iterations: 1000, tolerance: 1e-6)
    @func = func
    @gradient = gradient
    @learning_rate = learning_rate
    @max_iterations = max_iterations
    @tolerance = tolerance
  end

  # Minimum bulma fonksiyonu
  def find_minimum(initial_guess)
    x = initial_guess.dup
    @max_iterations.times do |i|
      grad = @gradient.call(x)
      x_new = x.each_with_index.map { |xi, j| xi - @learning_rate * grad[j] }

      # Yakınsama kontrolü
      if euclidean_distance(x, x_new) < @tolerance
        return { minimum: x_new, iterations: i + 1, converged: true }
      end

      x = x_new
    end

    { minimum: x, iterations: @max_iterations, converged: false }
  end

  private

  # İki vektör arasındaki Öklid mesafesini hesaplama
  def euclidean_distance(a, b)
    Math.sqrt(a.zip(b).map { |ai, bi| (ai - bi)**2 }.sum)
  end
end
