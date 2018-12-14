# require 'benchmark'
require 'pry'

# Convert phone number to meaningfull word(s) based on available dictionary.
# Meaningfull words help to remember phone number.
class Conversion
  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
    @digit_to_chars = { '2' => %w[a b c],
                        '3' => %w[d e f],
                        '4' => %w[g h i],
                        '5' => %w[j k l],
                        '6' => %w[m n o],
                        '7' => %w[p q r s],
                        '8' => %w[t u v],
                        '9' => %w[w x y z] }
    dictionary = []
    File.foreach( "dictionary.txt" ) do |word|
      dictionary << word.strip
    end
  end

  def valid_phone_number?
    p phone_number
    return false if phone_number.nil?

    phone_number.gsub!(/[^2-9]/, '') # select digits only 2 to 9. Ignore 0 and 1
    p phone_number
    p phone_number.length
    return true if phone_number.length == 10
  end
  
  def extract_words
    phone_keys = phone_number.chars.map{|n| @digit_to_chars[n] }
    binding.pry
  end
end
object = Conversion.new('6686787825')
p 'is valid phone number?'
p object.valid_phone_number?
object.extract_words

