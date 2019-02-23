require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_can_find_todays_date
    skip
    enigma = Enigma.new

    assert_equal expected, enigma.todays_date
  end

  end
  def test_it_can_covert_todays_date_into_a_string
  skip
    enigma = Enigma.new

    assert_equal "022319", enigma.todays_date_to_string
  end

  def test_it_can_populate_todays_date_if_no_date_given
  skip
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715")

    assert_equal expected, enigma.encrypted[:date]
  end

  # def test_it_can_convert_and_square_a_date_string_to_an_integer
  #   enigma = Enigma.new
  #   enigma.encrypt("hello world", "02715", "040895")
  #
  #   assert_equal
  # end

  def test_it_has_four_different_offset_values_after_evaluating_key_argument
    skip

    assert_equal, enigma.a_offset_values()
    assert_equal, enigma.b_offset_values()
    assert_equal, enigma.c_offset_values()
    assert_equal, enigma.d_offset_values()
  end

end
