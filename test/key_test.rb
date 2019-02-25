require './test/test_helper'

class KeyTest < Minitest::Test

  def test_it_can_prepend_with_zeros_until_key_is_five_characters_long
    enigma_1 = Enigma.new
    enigma_2 = Enigma.new
    enigma_3 = Enigma.new

    assert_equal "02715", enigma_1.format_to_char_length("2715", 5)
    assert_equal "00987", enigma_2.format_to_char_length("987", 5)
    assert_equal "00005", enigma_3.format_to_char_length("5", 5)
  end

  def test_if_less_than_five_characters_zeros_can_be_prepended_upon_input
    enigma_1 = Enigma.new
    enigma_2 = Enigma.new
    enigma_3 = Enigma.new

    enigma_1.encrypt("hello world", "02715", "040895")
    enigma_2.encrypt("hello world", "987", "040895")
    enigma_3.encrypt("hello world", "5", "040895")

    assert_equal "02715", enigma_1.encrypted[:key]
    assert_equal "00987", enigma_2.encrypted[:key]
    assert_equal "00005", enigma_3.encrypted[:key]
  end

  def test_it_can_create_a_random_key_of_five_characters
    enigma_1 = Enigma.new
    enigma_2 = Enigma.new

    set_1 = enigma_1.random_characters
    set_2 = enigma_2.random_characters

    assert_equal 5, set_1.length
    assert_equal 5, set_2.length
    assert_equal false, set_1 == set_2
  end

  def test_if_no_key_is_given_a_random_five_character_key_is_created_and_assigned
    enigma_1 = Enigma.new
    enigma_2 = Enigma.new

    enigma_1.encrypt("hello world")
    enigma_2.encrypt("hello world")

    assert_equal 5, enigma_1.encrypted[:key].length
    assert_equal 5, enigma_2.encrypted[:key].length

    assert_equal false, enigma_1.encrypted[:key] == enigma_2.encrypted[:key]
  end

  def test_it_has_four_different_key_values_after_evaluating_key_argument
    enigma = Enigma.new

    assert_equal 02, enigma.key_table("02715")[:a]
    assert_equal 27, enigma.key_table("02715")[:b]
    assert_equal 71, enigma.key_table("02715")[:c]
    assert_equal 15, enigma.key_table("02715")[:d]
  end

end
