require './lib/shift'

class Cipher
  include Shift
    attr_reader :key, :date

  def initialize(phrase, key, date)
    @phrase = phrase
    @key = format_to_char_length(key, 5)
    @date = format_to_char_length(date, 6)
  end

  def character_index
    index = ("a".."z").to_a << " "
  end

  # def shifted_characters(value)
  #   character_index.rotate(value)
  # end

  # def encrypt_table(shift_value, key, date,)
  #   tables = {}
  #   tables[:a] = shift_table(a_shift_value(key,date))
  #
  # end
  #
  # def shift_table(shift_value)
  #   shifted_characters = character_index.rotate(shift_value(key, date))
  #   table = character_index.zip(shifted_characters).to_h
  # end

  def a_shift_table(key, date)
    shifted_characters = character_index.rotate(a_shift_value(key, date))
    table = character_index.zip(shifted_characters).to_h
  end

  def b_shift_table(key, date)
    shifted_characters = character_index.rotate(b_shift_value(key, date))
    table = character_index.zip(shifted_characters).to_h
  end

  def c_shift_table(key, date)
    shifted_characters = character_index.rotate(c_shift_value(key, date))
    table = character_index.zip(shifted_characters).to_h
  end

  def d_shift_table(key, date)
    shifted_characters = character_index.rotate(d_shift_value(key, date))
    table = character_index.zip(shifted_characters).to_h
  end

  def encoded
    encoded = ""
    split_phrase = @phrase.chars
    counter = 1

    split_phrase.each do |character|
      if !character_index.include?(character)
        encoded << character
      elsif counter == 1
        encoded << a_shift_table(@key, @date)[character]
      elsif counter == 2
        encoded << b_shift_table(@key, @date)[character]
      elsif counter == 3
        encoded << c_shift_table(@key, @date)[character]
      else
        encoded << d_shift_table(@key, @date)[character]
      end

      if counter < 4
        counter+= 1
      else
        counter = 1
      end
    end
    encoded
  end

end
