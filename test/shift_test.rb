require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_can_compile_total_shift_values_for_each_of_the_four_shift_factors
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")


    assert_equal 3, enigma.a_shift
    assert_equal 27, enigma.b_shift
    assert_equal 73, enigma.c_shift
    assert_equal 20, enigma.d_shift
  end

end
