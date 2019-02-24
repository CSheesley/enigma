require './lib/cipher'
require './lib/shift'

class Enigma < Cipher
  attr_reader :encrypted, :cipher

  def initialize
    @encrypted = {}
    @cipher = cipher
  end

  def encrypt(phrase, key = random_characters, date = todays_date)
    @cipher = Cipher.new(phrase, key, date)
    encrypted[:encryption] = @cipher.encoded
    encrypted[:key] = @cipher.key
    encrypted[:date] = @cipher.date
    @encrypted
  end

end
