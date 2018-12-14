# require 'benchmark'
require 'pry'

# Convert phone number to meaningfull word(s) based on available dictionary.
# Meaningfull words help to remember phone number.
class Conversion
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def valid_phone_number?
    p number
    return false if number.nil?

    number.gsub!(/[^2-9]/, '') # select digits only 2 to 9. Ignore 0 and 1
    p number
    p number.length
    return true if number.length == 10
  end
end
object = Conversion.new('6686787825')
p 'is valid phone number?'
p object.valid_phone_number?
