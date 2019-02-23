require './lib/key'
require './lib/offset'

class Enigma
  attr_accessor :encrypted
  include Key
  include Offset

  def initialize
    @encrypted = {}
  end

  def encrypt(phrase, key = random_characters, date = todays_date)
    encrypted[:encryption] = phrase
    encrypted[:key] = format_to_five_chars(key)
    encrypted[:date] = date
    @encrypted
  end

end
