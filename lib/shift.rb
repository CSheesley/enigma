require './lib/key'
require './lib/offset'

module Shift
  include Key
  include Offset

  def a_shift_value(key, date)
    a_key_values(key) + a_offset_values(date)
  end

  def b_shift_value(key, date)
    b_key_values(key) + b_offset_values(date)
  end

  def c_shift_value(key, date)
    c_key_values(key) + c_offset_values(date)
  end

  def d_shift_value(key, date)
    d_key_values(key) + d_offset_values(date)
  end

  def encrypt_table(key, date)
    tables = {}
    tables[:a] = shift_table(a_shift_value(key, date))
    tables[:b] = shift_table(b_shift_value(key, date))
    tables[:c] = shift_table(c_shift_value(key, date))
    tables[:d] = shift_table(d_shift_value(key, date))
    tables
  end

  def decrypt_table(key, date)
    tables = {}
    tables[:a] = shift_table(a_shift_value(key, date) * -1)
    tables[:b] = shift_table(b_shift_value(key, date) * -1)
    tables[:c] = shift_table(c_shift_value(key, date) * -1)
    tables[:d] = shift_table(d_shift_value(key, date) * -1)
    tables
  end

  def shift_table(shift_value)
    shifted_characters = character_index.rotate(shift_value)
    table = character_index.zip(shifted_characters).to_h
  end

end
