# frozen_string_literal: true

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
    @correct_words = []
  end

  def valid_phone_number?
    return false if phone_number.nil?

    phone_number.gsub!(/[^2-9]/, '') # select digits only 2 to 9. Ignore 0 and 1
    return true if phone_number.length == 10
  end

  def get_correct_words(phone_chars_array)
    matches = []
    phone_chars_array.each do |phone_chars|
      # Now combine characters and create possible words.
      possible_words = phone_chars.shift.product(*phone_chars).map(&:join)
      # Match / Intersection of possible words with @dictionary array
      matches << possible_words & @dictionary
    end

    unless matches.any?(&:empty?)
      # Making combinations from above output
      if matches.size == 2
        @correct_words += matches[0].product(matches[1])
      elsif matches.size == 3
        @correct_words += matches[0].product(matches[1]).product(matches[2])
      end
    end
  end

  def parse_dictionary
    @dictionary = []
    File.foreach('dictionary.txt') do |word|
      @dictionary << word.strip
    end
  end

  # Word minimum length should be 3
  # Here is how we can breack phone number characters
  # 3+7, 4+6, 5+5, 6+4, 7+3, 10, 3+3+4, 3+4+3, 4+3+3

  # Now create combinations of words with 3 to 7 characters
  # These words need to intersect with dictionary words

  # Break array phone_keys in 2 arrays with minimum size 3
  def extract_words
    length = phone_number.length
    i = 2
    @phone_keys = phone_number.chars.map { |n| @digit_to_chars[n] }

    while i < length - 3 do # loop will run till i = 6
      phone_chars1 = @phone_keys[0..i]
      phone_chars2 = @phone_keys[(i + 1)..(length - 1)]
      get_correct_words([phone_chars1, phone_chars2])
      i += 1
    end
  end

  def multiple_combinations
    # Fetch from combinations 3+3+4, 3+4+3, 4+3+3
    get_correct_words([@phone_keys[0..2], @phone_keys[3..5], @phone_keys[6..9]])
    get_correct_words([@phone_keys[0..2], @phone_keys[3..6], @phone_keys[7..9]])
    get_correct_words([@phone_keys[0..3], @phone_keys[4..6], @phone_keys[7..9]])
  end

  def all_words
    return unless valid_phone_number?

    parse_dictionary
    extract_words
    multiple_combinations
    @correct_words << (@phone_keys.shift.product(*@phone_keys).map(&:join) & @dictionary).join(', ')
    @correct_words.uniq!
  end
end

object = Conversion.new('6686787825')
object.extract_words
