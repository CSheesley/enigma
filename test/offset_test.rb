require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_can_find_todays_date #unnecessary test?
    enigma = Enigma.new
    today = Time.new

    expected = ""
    expected << today.month.to_s
    expected << today.day.to_s
    expected << today.year.to_s[-2,2]
    enigma.format_to_char_length(expected, 6)

    assert_equal expected, enigma.todays_date
  end

  def test_it_can_create_todays_date_as_a_valid_string
    enigma = Enigma.new

    assert_instance_of String, enigma.todays_date
  end

  def test_it_can_format_date_to_six_characters_and_prepend_with_zero_if_needed
    enigma_1 = Enigma.new
    enigma_2 = Enigma.new
    enigma_2.encrypt("hello world", "02715", "31718")

    assert_equal 6, enigma_1.todays_date.length
    assert_equal 6, enigma_2.encrypted[:date].length
    assert_equal "031718", enigma_2.encrypted[:date]
  end

  def test_it_can_populate_todays_date_if_no_date_given
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715")

    expected = enigma.todays_date

    assert_equal expected, enigma.encrypted[:date]
  end

  def test_it_can_return_the_last_four_digits_of_the_date_value_squared
    enigma = Enigma.new

    assert_equal "1025", enigma.last_four_of_squared("040895")
    assert_equal "3769", enigma.last_four_of_squared("111387")
  end

  def test_it_has_four_different_offset_values_after_evaluating_key_argument
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    assert_equal 1, enigma.offset_table("040895")[:a]
    assert_equal 0, enigma.offset_table("040895")[:b]
    assert_equal 2, enigma.offset_table("040895")[:c]
    assert_equal 5, enigma.offset_table("040895")[:d]
  end

end
