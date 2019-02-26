require './lib/shift'

class Cipher
  include Shift
  attr_reader :key, :date

  def initialize(message, key, date)
    @message = message.downcase
    @key = format_to_char_length(key, 5)
    @date = format_to_char_length(date, 6)
  end

  def encoded
    encoded = ""
    split_message = @message.chars
    split_message.each_with_index do |character, index|
      if !character_index.include?(character)
        encoded << character
      elsif ((index + 1)% 4) % 4 == 0
        encoded << encrypt_table(@key, @date)[:d][character]
      elsif ((index + 1)% 4) % 3 == 0
        encoded << encrypt_table(@key, @date)[:c][character]
      elsif ((index + 1)% 4) % 2 == 0
        encoded << encrypt_table(@key, @date)[:b][character]
      else
        encoded << encrypt_table(@key, @date)[:a][character]
      end
    end
    encoded
  end

  def decoded
    decoded = ""
    split_message = @message.chars
    split_message.each_with_index do |character, index|
      if !character_index.include?(character)
        encoded << character
      elsif ((index + 1)% 4) % 4 == 0
        decoded << decrypt_table(@key, @date)[:d][character]
      elsif ((index + 1)% 4) % 3 == 0
        decoded << decrypt_table(@key, @date)[:c][character]
      elsif ((index + 1)% 4) % 2 == 0
        decoded << decrypt_table(@key, @date)[:b][character]
      else
        decoded << decrypt_table(@key, @date)[:a][character]
      end
    end
    decoded
  end

end
