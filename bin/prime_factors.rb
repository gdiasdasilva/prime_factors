#!/usr/bin/env ruby
require 'optparse'

def prime?(number)
  return true if @calculated_primes.has_key?(number)

  (2..Integer.sqrt(number)).each do |n|
    return false if number % n == 0
  end

  @calculated_primes[number] = true
  true
end

def minimal_divisible_factor(number)
  (2..number).detect { |n| prime?(n) && number % n == 0 }
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
  @calculated_primes = {}
  prime_factors(number).join(', ')
end

OptionParser.new do |parser|
  parser.on("--number NUMBER", Integer) do |arg_number|
    if arg_number > 1
      puts main(arg_number)
    else
      puts 'Error. Parameter --number should be a valid positive integer bigger than 1.'
    end
  end
end.parse!
