#!/usr/bin/env ruby

def prime?(number)
  (2..number-1).each do |n|
    return false if (number % n).zero?
  end

  true
end

def primes_until(number)
  @primes ||= begin
    (2..number).select { |n| prime?(n) }
  end
end

def minimal_divisible_factor(number)
  primes_until(number).detect { |n| (number % n).zero? }
end

def prime_factors(number)
  factors = []
  processing_number = number

  while true do
    current_factor = minimal_divisible_factor(processing_number)
    break if current_factor.nil?

    factors << current_factor
    processing_number /= current_factor
  end

  factors
end

def main(number)
  # TODO: validate arguments
  prime_factors(number).join(', ')
end

puts main(ARGV[0].to_i)

