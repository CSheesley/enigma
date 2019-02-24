require './lib/cipher'
require './lib/shift'

class Enigma < Cipher
  attr_reader :encrypted, :decrypted, :cipher

  def initialize
    @encrypted = {}
    @decrypted = {}
    @cipher = nil
  end

  def encrypt(phrase, key = random_characters, date = todays_date)
    @cipher = Cipher.new(phrase, key, date)
    @encrypted[:encryption] = @cipher.encoded
    @encrypted[:key] = @cipher.key
    @encrypted[:date] = @cipher.date
    @encrypted
  end

  def decrypt(cipher_text, key, date = todays_date)
    @cipher = Cipher.new(cipher_text, key, date)
    @decrypted[:decryption] = @cipher.decoded
    @decrypted[:key] = @cipher.key
    @decrypted[:date] = @cipher.date
    @decrypted
  end

end
