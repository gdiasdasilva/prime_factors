#!/usr/bin/env ruby
require 'optparse'

def prime?(number)
  (2..number-1).each do |n|
    return false if (number % n).zero?
  end

  true
end

def primes_until(number)
  (2..number).select { |n| prime?(n) }
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
