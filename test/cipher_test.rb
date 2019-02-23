require './test/test_helper'

class CipherTest < Minitest::Test

  def test_it_has_27_characters_to_index
    enigma = Enigma.new

    expected = ("a".."z").to_a << " "

    assert_equal expected, enigma.valid_characters
    assert_equal 27, enigma.valid_characters.length
    assert_equal "a", enigma.valid_characters.first
    assert_equal " ", enigma.valid_characters.length
  end


  def test_it_can_create_a_cipher_table_for_the_a_shift
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    expected = {}

    assert_equal expected, enigma.a_shift_table
  end

  def test_it_can_create_a_cipher_table_for_the_b_shift
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    expected = {}

    assert_equal expected, enigma.b_shift_table
  end

  def test_it_can_create_a_cipher_table_for_the_c_shift
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    expected = {}

    assert_equal expected, enigma.c_shift_table
  end

  def test_it_can_create_a_cipher_table_for_the_c_shift
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")
    
    expected = {}

    assert_equal expected, enigma.d_shift_table
  end

end
