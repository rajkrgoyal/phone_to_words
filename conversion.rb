# require 'benchmark'
require 'pry'

# Convert phone number to meaningfull word(s) based on available dictionary.
# Meaningfull words help to remember phone number.
class Conversion
  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
    @digit_to_chars = { '2' => %w[A B C],
                        '3' => %w[D E F],
                        '4' => %w[G H I],
                        '5' => %w[J K L],
                        '6' => %w[M N O],
                        '7' => %w[P Q R S],
                        '8' => %w[T U V],
                        '9' => %w[W X Y Z] }
    @dictionary = []
    File.foreach( "dictionary.txt" ) do |word|
      @dictionary << word.strip
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
    # Word minimum length should be 3
    # Now create combinations of words with 3 to 7 characters
    # These words need to intersect with dictionary words
    
    #Break array phone_keys in 2 arrays with minimum size 3
    length = phone_number.length
    i = 2
    while i < length - 3  do # loop will run till i = 6
      array1 = phone_keys[0..i] # array1 min length 3, max length 7
      array2 = phone_keys[(i + 1)..(length-1)] # first time [3..9]
      binding.pry if i < 4
    end
    binding.pry
  end
end
object = Conversion.new('6686787825')
p 'is valid phone number?'
p object.valid_phone_number?
object.extract_words

