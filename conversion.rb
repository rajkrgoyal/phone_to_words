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
    
    correct_words = []
    while i < length - 3  do # loop will run till i = 6
      phone_chars_array1 = phone_keys[0..i] # array1 min length 3, max length 7
      phone_chars_array2 = phone_keys[(i + 1)..(length-1)] # first time [3..9] #last loop with [6..9]
      
      # Now combile characters and create possible words.
      possible_words_array1 = phone_chars_array1.shift.product(*phone_chars_array1).map(&:join)
      possible_words_array2 = phone_chars_array2.shift.product(*phone_chars_array2).map(&:join)
      
      p "match word..."
      # Match / Intersection of possible words with @dictionary array
      p match_word1 = possible_words_array1 & @dictionary
      p match_word2 = possible_words_array2 & @dictionary
      
      # Output was like... [[["NOUN", "ONTO"], ["STRUCK"]], [["MOTOR", "NOUNS"], ["TRUCK", "USUAL"]]]
      # Making combinations from above output
      if !match_word1.empty? && !match_word2.empty?
        binding.pry
        correct_words << match_word1.product(match_word2)
      end
      p "correct_words - "
      p correct_words
      binding.pry if i < 4
      i += 1
    end
    p correct_words
    binding.pry
  end
end
object = Conversion.new('6686787825')
p 'is valid phone number?'
p object.valid_phone_number?
object.extract_words

