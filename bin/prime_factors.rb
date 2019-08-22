#!/usr/bin/env ruby
require 'optparse'
require_relative './prime_factorization'

OptionParser.new do |parser|
  parser.on("--number NUMBER", Integer) do |arg_number|
    if arg_number > 1
      puts PrimeFactorization.new(arg_number).prime_factors
    else
      puts 'Error. Parameter --number should be a valid positive integer bigger than 1.'
    end
  end
end.parse!
