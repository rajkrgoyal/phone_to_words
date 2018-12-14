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
    @correct_words = []
  end

  def valid_phone_number?
    p phone_number
    return false if phone_number.nil?

    phone_number.gsub!(/[^2-9]/, '') # select digits only 2 to 9. Ignore 0 and 1
    return true if phone_number.length == 10
  end
  
  def get_correct_words(phone_chars_array1, phone_chars_array2)
    # Now combile characters and create possible words.
    possible_words_array1 = phone_chars_array1.shift.product(*phone_chars_array1).map(&:join)
    possible_words_array2 = phone_chars_array2.shift.product(*phone_chars_array2).map(&:join)

    # Match / Intersection of possible words with @dictionary array
    match_word1 = possible_words_array1 & @dictionary
    match_word2 = possible_words_array2 & @dictionary

    # Output was like... [[["NOUN", "ONTO"], ["STRUCK"]], [["MOTOR", "NOUNS"], ["TRUCK", "USUAL"]]]
    # Making combinations from above output
    if !match_word1.empty? && !match_word2.empty?
      @correct_words += match_word1.product(match_word2)
    end
  end
  
  def get_correct_words_multi_array(phone_chars_array1, phone_chars_array2, phone_chars_array3)
    # Now combile characters and create possible words.
    possible_words_array1 = phone_chars_array1.shift.product(*phone_chars_array1).map(&:join)
    possible_words_array2 = phone_chars_array2.shift.product(*phone_chars_array2).map(&:join)
    possible_words_array3 = phone_chars_array3.shift.product(*phone_chars_array3).map(&:join)
    
    # Match / Intersection of possible words with @dictionary array
    match_word1 = possible_words_array1 & @dictionary
    match_word2 = possible_words_array2 & @dictionary
    match_word3 = possible_words_array3 & @dictionary
    
    # Making combinations from above output
    if !match_word1.empty? && !match_word2.empty? && !match_word3.empty?
      @correct_words += match_word1.product(match_word2).product(match_word3).map(&:flatten)
    end
  end
  
  def extract_words
    return unless valid_phone_number?
    phone_keys = phone_number.chars.map{|n| @digit_to_chars[n] }
    # Word minimum length should be 3
    # Here is how we can breack phone number characters
    # 3+7, 4+6, 5+5, 6+4, 7+3, 10, 3+3+4, 3+4+3, 4+3+3
    
    
    # Now create combinations of words with 3 to 7 characters
    # These words need to intersect with dictionary words
    
    # Break array phone_keys in 2 arrays with minimum size 3
    length = phone_number.length
    i = 2

    while i < length - 3  do # loop will run till i = 6
      phone_chars_array1 = phone_keys[0..i] # array1 min length 3, max length 7
      phone_chars_array2 = phone_keys[(i + 1)..(length-1)] # first time [3..9] #last loop with [6..9]

      get_correct_words(phone_chars_array1, phone_chars_array2)

      i += 1
    end
    # Fetch from combinations 3+3+4, 3+4+3, 4+3+3
    # 3+3+4
    get_correct_words_multi_array(phone_keys[0..2], phone_keys[3..5], phone_keys[6..9])

    # 3+4+3
    get_correct_words_multi_array(phone_keys[0..2], phone_keys[3..6], phone_keys[7..9])

    # 4+3+3
    get_correct_words_multi_array(phone_keys[0..3], phone_keys[4..6], phone_keys[7..9])
    
    @correct_words << (phone_keys.shift.product(*phone_keys).map(&:join) & @dictionary).join(", ")
    @correct_words.uniq!

  end
end

object = Conversion.new('6686787825')
object.extract_words

