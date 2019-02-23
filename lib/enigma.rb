require './lib/shift'

class Enigma
  attr_accessor :encrypted
  include Shift

  def initialize
    @encrypted = {}
  end

  def encrypt(phrase, key = random_characters, date = todays_date)
    encrypted[:encryption] = phrase
    encrypted[:key] = format_to_char_length(key, 5)
    encrypted[:date] = format_to_char_length(date, 6)
    @encrypted
  end

end
