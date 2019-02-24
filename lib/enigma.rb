require './lib/cipher'
require './lib/shift'

class Enigma < Cipher
  include Shift
  attr_accessor :encrypted

  def initialize
    @encrypted = {}
  end

  def encrypt(phrase, key = random_characters, date = todays_date)
    cipher = Cipher.new(phrase, key, date)
    encrypted[:key] = format_to_char_length(key, 5)
    encrypted[:date] = format_to_char_length(date, 6)
    encrypted[:encryption] = cipher.encoded
    @encrypted
  end

end
