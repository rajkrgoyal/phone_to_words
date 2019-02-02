# frozen_string_literal: true

require_relative 'conversion.rb'
puts 'Please enter the 10 digit mobile number :'
phone_number = '2282668687' #gets.chomp
object = Conversion.new(phone_number)
p object.number_to_multiple_combinations
