require './lib/shift'

class Cipher
  include Shift
    attr_reader :key, :date

  def initialize(phrase, key, date)
    @phrase = phrase.downcase
    @key = format_to_char_length(key, 5)
    @date = format_to_char_length(date, 6)
  end

  def character_index
    ("a".."z").to_a << " "
  end

  # def shifted_characters(value)
  #   character_index.rotate(value)
  # end

  def encrypt_table(key, date)
    tables = {}
    tables[:a] = a_encrypt_table(key, date)
    tables[:b] = b_encrypt_table(key, date)
    tables[:c] = c_encrypt_table(key, date)
    tables[:d] = d_encrypt_table(key, date)
    tables
  end

  def shift_table(shift_value)
    shifted_characters = character_index.rotate(shift_value(key, date))
    table = character_index.zip(shifted_characters).to_h
  end

  def a_encrypt_table(key, date)
    shifted_characters = character_index.rotate(a_shift_value(key, date))
    character_index.zip(shifted_characters).to_h
  end

  def b_encrypt_table(key, date)
    shifted_characters = character_index.rotate(b_shift_value(key, date))
    character_index.zip(shifted_characters).to_h
  end

  def c_encrypt_table(key, date)
    shifted_characters = character_index.rotate(c_shift_value(key, date))
    character_index.zip(shifted_characters).to_h
  end

  def d_encrypt_table(key, date)
    shifted_characters = character_index.rotate(d_shift_value(key, date))
    character_index.zip(shifted_characters).to_h
  end

  def encoded
    encoded = ""
    split_phrase = @phrase.chars
    split_phrase.each_with_index do |character, index|
      if !character_index.include?(character)
        encoded << character
      elsif ((index + 1)% 4) % 4 == 0
        encoded << encrypt_table(key, date)[:d][character]
      elsif ((index + 1)% 4) % 3 == 0
        encoded << encrypt_table(key, date)[:c][character]
      elsif ((index + 1)% 4) % 2 == 0
        encoded << encrypt_table(key, date)[:b][character]
      else
        encoded << encrypt_table(key, date)[:a][character]
      end
    end
    encoded
  end

end
