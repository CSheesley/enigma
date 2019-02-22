require './test/test_helper'

class KeysTest < Minitest::Test

  def test_it_exists
  key = Key.new("02715")

  test_instance_of Key, key
  end

  def test_if_less_than_5_characters_zeros_can_be_prepended
  key_1 = Key.new("2715")
  key_2 = Key.new("987")
  key_3 = Key.new("5")

  assert_equal "20715", key_1.characters
  assert_equal "00987", key_2.characters
  assert_equal "00005", key_3.characters
  end

  def test_if_no_key_is_given_a_random_5_character_key_is_created
  key = Key.new()

  assert_equal 5, key.characters.length
  end
end
