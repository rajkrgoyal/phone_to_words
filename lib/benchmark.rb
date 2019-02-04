# frozen_string_literal: true

require_relative 'conversion.rb'
puts 'Please enter the 10 digit mobile number :'
puts phone_number = '6686787825' # gets.chomp
object = Conversion.new(phone_number)
p object.number_to_multiple_combinations
