# frozen_string_literal: true

require_relative '../lib/conversion.rb'

describe Conversion do
  let(:phone1) { '6686787825' }
  let(:result1_2words) { [%w[NOUN STRUCK], %w[ONTO STRUCK], %w[MOTOR TRUCK],
                          %w[MOTOR USUAL], %w[NOUNS TRUCK], %w[NOUNS USUAL],
                          'MOTORTRUCK'] }

  let(:result1_multiple_words) { [%w[NOUN STRUCK], %w[ONTO STRUCK], %w[MOTOR TRUCK],
                                  %w[MOTOR USUAL], %w[NOUNS TRUCK], %w[NOUNS USUAL],
                                  'MOTORTRUCK', %w[MUM PUP TAJ], %w[MUM PUR TAJ],
                                  %w[MUM PUS TAJ], %w[MUM SUP TAJ], %w[MUM SUQ TAJ],
                                  %w[MUN PUP TAJ], %w[MUN PUR TAJ], %w[MUN PUS TAJ],
                                  %w[MUN SUP TAJ], %w[MUN SUQ TAJ], %w[NUN PUP TAJ],
                                  %w[NUN PUR TAJ], %w[NUN PUS TAJ], %w[NUN SUP TAJ],
                                  %w[NUN SUQ TAJ]] }

  let(:phone2) { '2282668687' }
  let(:result2_2words) { [%w[ACT AMOUNTS], %w[ACT CONTOUR], %w[BAT AMOUNTS],
                          %w[BAT CONTOUR], %w[CAT AMOUNTS], %w[CAT CONTOUR],
                          %w[ACTA MOUNTS], 'CATAMOUNTS'] }
  let(:result2_multiple_words) { [%w[ACT AMOUNTS], %w[ACT CONTOUR], %w[BAT AMOUNTS],
                                  %w[BAT CONTOUR], %w[CAT AMOUNTS], %w[CAT CONTOUR],
                                  %w[ACTA MOUNTS], 'CATAMOUNTS', %w[AVA MOT MUS],
                                  %w[AVA MOT NUS], %w[AVA MOT OUR], %w[AVA NOT MUS],
                                  %w[AVA NOT NUS], %w[AVA NOT OUR], %w[AVA OOT MUS],
                                  %w[AVA OOT NUS], %w[AVA OOT OUR], %w[BUB MOT MUS],
                                  %w[BUB MOT NUS], %w[BUB MOT OUR], %w[BUB NOT MUS],
                                  %w[BUB NOT NUS], %w[BUB NOT OUR], %w[BUB OOT MUS],
                                  %w[BUB OOT NUS], %w[BUB OOT OUR], %w[CUB MOT MUS],
                                  %w[CUB MOT NUS], %w[CUB MOT OUR], %w[CUB NOT MUS],
                                  %w[CUB NOT NUS], %w[CUB NOT OUR], %w[CUB OOT MUS],
                                  %w[CUB OOT NUS], %w[CUB OOT OUR]]}

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
      expect(object.number_to_multiple_combinations).to match_array(result1_multiple_words)
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
      expect(object.number_to_multiple_combinations).to match_array(result2_multiple_words)
    end
  end
end
