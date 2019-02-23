require './lib/key'
require './lib/offset'

module Shift
  include Key
  include Offset

  def a_shift(key, date)
    a_key_values(key) + a_offset_values(date)
  end

  def b_shift(key, date)
    b_key_values(key) + b_offset_values(date)
  end

  def c_shift(key, date)
    c_key_values(key) + c_offset_values(date)
  end

  def d_shift(key, date)
    d_key_values(key) + d_offset_values(date)
  end

end
