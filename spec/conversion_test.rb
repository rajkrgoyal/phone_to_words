# frozen_string_literal: true

require_relative '../lib/conversion.rb'

describe Conversion do
  let(:phone1) { '6686787825' }
  let(:result1_2words) { [%w[NOUN STRUCK], %w[ONTO STRUCK], %w[MOTOR TRUCK],
                          %w[MOTOR USUAL], %w[NOUNS TRUCK], %w[NOUNS USUAL],
                          'MOTORTRUCK'] }

  let(:phone2) { '2282668687' }
  let(:result2_2words) { [%w[ACT AMOUNTS], %w[ACT CONTOUR], %w[BAT AMOUNTS],
                          %w[BAT CONTOUR], %w[CAT AMOUNTS], %w[CAT CONTOUR],
                          %w[ACTA MOUNTS], 'CATAMOUNTS'] }

  context 'Testing conversion of phone number to combinations of words ' do
    it 'Check valid phone number' do
      puts 'Phone number - ' + phone1
      object = Conversion.new(phone1)
      expect(object.valid_phone_number?).to be(true)
    end

    it 'Test output of conversion with maximum 2 words combination' do
      object = Conversion.new(phone1)
      expect(object.number_to_words_combinations).to match_array(result1_2words)
    end

    it 'Test output of conversion with multiple words combination' do
      object = Conversion.new(phone1)
      expect(object.number_to_multiple_combinations).to match_array(result1_2words)
    end
  end

  context 'Testing conversion of phone number to combinations of words ' do
    it 'Check valid phone number' do
      puts 'Phone number - ' + phone2
      object = Conversion.new(phone2)
      expect(object.valid_phone_number?).to be(true)
    end

    it 'Test output of conversion with maximum 2 words combination' do
      object = Conversion.new(phone2)
      expect(object.number_to_words_combinations).to match_array(result2_2words)
    end

    it 'Test output of conversion with multiple words combination' do
      object = Conversion.new(phone2)
      expect(object.number_to_multiple_combinations).to match_array(result2_2words)
    end
  end
end
