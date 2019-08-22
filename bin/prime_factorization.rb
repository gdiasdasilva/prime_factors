class PrimeFactorization
  def initialize(number)
    @calculated_primes = {}
    @number_to_factorize = number
  end

  def prime_factors
    factors = []
    processing_number = @number_to_factorize

    while true do
      current_factor = minimal_divisible_factor(processing_number)
      break if current_factor.nil?

      factors << current_factor
      processing_number /= current_factor
    end

    factors.join(', ')
  end

  private

  def prime?(number)
    return true if @calculated_primes.has_key?(number)

    (2..Integer.sqrt(number)).each do |n|
      return false if number % n == 0
    end

    @calculated_primes[number] = true
    true
  end

  def minimal_divisible_factor(number)
    return nil if number == 1

    (2..Integer.sqrt(number)).each do |n|
      return n if number % n == 0 && prime?(n)
    end

    number
  end
end
