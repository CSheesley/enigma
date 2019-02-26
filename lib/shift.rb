require './lib/key'
require './lib/offset'

module Shift
  include Key
  include Offset

  def encrypt_table(key, date)
    tables = {}
    tables[:a] = conversion_table(shift_table(key, date)[:a])
    tables[:b] = conversion_table(shift_table(key, date)[:b])
    tables[:c] = conversion_table(shift_table(key, date)[:c])
    tables[:d] = conversion_table(shift_table(key, date)[:d])
    tables
  end

  def decrypt_table(key, date)
    tables = {}
    tables[:a] = conversion_table(shift_table(key, date)[:a] * -1)
    tables[:b] = conversion_table(shift_table(key, date)[:b] * -1)
    tables[:c] = conversion_table(shift_table(key, date)[:c] * -1)
    tables[:d] = conversion_table(shift_table(key, date)[:d] * -1)
    tables
  end

  def shift_table(key, date)
    shift_values = {}
    shift_values[:a] = key_table(key)[:a] + offset_table(date)[:a]
    shift_values[:b] = key_table(key)[:b] + offset_table(date)[:b]
    shift_values[:c] = key_table(key)[:c] + offset_table(date)[:c]
    shift_values[:d] = key_table(key)[:d] + offset_table(date)[:d]
    shift_values
  end

  def conversion_table(shift_value)
    shifted_characters = character_index.rotate(shift_value)
    character_index.zip(shifted_characters).to_h
  end

  def character_index
    ("a".."z").to_a << " "
  end

end
