# frozen_string_literal: true

require_relative 'conversion.rb'
require 'benchmark'
puts 'Please enter the 10 digit mobile number :'
phone_number = gets.chomp
object = Conversion.new(phone_number)
p object.number_to_words_combinations
