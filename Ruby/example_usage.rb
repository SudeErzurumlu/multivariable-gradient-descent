# example_usage.rb
# Example usage of the Gradient Descent algorithm for a multivariable function in Ruby

require_relative 'gradient_descent'

# Örnek fonksiyon f(x, y) = (x - 3)^2 + (y + 1)^2
func = lambda { |v| (v[0] - 3)**2 + (v[1] + 1)**2 }

# Fonksiyonun gradyanı: ∇f(x, y) = [2*(x - 3), 2*(y + 1)]
gradient = lambda { |v| [2 * (v[0] - 3), 2 * (v[1] + 1)] }

# Gradient Descent parametreleri
initial_guess = [0.0, 0.0]
learning_rate = 0.1
max_iterations = 1000
tolerance = 1e-6

# GradientDescent sınıfını oluştur ve minimum bul
gd = GradientDescent.new(
  func: func,
  gradient: gradient,
  learning_rate: learning_rate,
  max_iterations: max_iterations,
  tolerance: tolerance
)

result = gd.find_minimum(initial_guess)

# Sonucu göster
if result[:converged]
  puts "Minimum bulunduğu nokta: (#{result[:minimum][0].round(6)}, #{result[:minimum][1].round(6)}) - Iterations: #{result[:iterations]}"
else
  puts "Çözüm, belirtilen tolerans ve iterasyon sınırında yakınsamadı."
end
