require './test/test_helper'

class KeysTest < Minitest::Test

  def test_it_exists
    key = Key.new("02715")

    assert_instance_of Key, key
  end

  def test_it_has_characters_as_an_attribute
    key = Key.new("02715")
    
    assert_equal "02715", key.characters
  end

  def test_it_can_prepend_string_with_zeros_until_five_characters_long
    key_1 = Key.new("2715")
    key_2 = Key.new("987")
    key_3 = Key.new("5")

    assert_equal "02715", key_1.format_to_five_chars("2715")
    assert_equal "00987", key_2.format_to_five_chars("987")
    assert_equal "00005", key_3.format_to_five_chars("5")
  end

  def test_if_less_than_5_characters_zeros_can_be_prepended_upon_input
    key_1 = Key.new("2715")
    key_2 = Key.new("987")
    key_3 = Key.new("5")

    assert_equal "02715", key_1.characters
    assert_equal "00987", key_2.characters
    assert_equal "00005", key_3.characters
  end

  def test_if_no_key_is_given_a_random_5_character_key_is_created_and_assigned
    key_1 = Key.new()
    key_2 = Key.new()

    assert_equal 5, key_1.random_characters.length
    assert_equal 5, key_1.characters.length

    assert_equal false, key_1.characters == key_2.characters
  end
end
