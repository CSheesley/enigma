require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_can_compile_total_shift_values_for_each_of_the_four_shift_factors
    enigma_1 = Enigma.new
    enigma_1.encrypt("hello world", "02715", "040895")

    enigma_2 = Enigma.new
    enigma_2.encrypt("hello world", "12345", "080589")

    assert_equal 3, enigma_1.a_shift_value("02715", "040895")
    assert_equal 27, enigma_1.b_shift_value("02715", "040895")
    assert_equal 73, enigma_1.c_shift_value("02715", "040895")
    assert_equal 20, enigma_1.d_shift_value("02715", "040895")

    assert_equal 18, enigma_2.a_shift_value("12345", "080589")
    assert_equal 32, enigma_2.b_shift_value("12345", "080589")
    assert_equal 36, enigma_2.c_shift_value("12345", "080589")
    assert_equal 46, enigma_2.d_shift_value("12345", "080589")
  end

end
