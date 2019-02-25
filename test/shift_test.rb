require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_can_create_a_character_conversion_table
    enigma = Enigma.new

    expected = {
      "a"=>"b", "b"=>"c", "c"=>"d", "d"=>"e", "e"=>"f", "f"=>"g", "g"=>"h",
      "h"=>"i", "i"=>"j", "j"=>"k", "k"=>"l", "l"=>"m", "m"=>"n", "n"=>"o",
      "o"=>"p", "p"=>"q", "q"=>"r", "r"=>"s", "s"=>"t", "t"=>"u", "u"=>"v",
      "v"=>"w", "w"=>"x", "x"=>"y", "y"=>"z", "z"=>" ", " "=>"a"
      }

    assert_equal expected, enigma.conversion_table(1)
  end

  def test_it_can_compile_total_shift_values_for_each_of_the_four_shift_factors
    enigma_1 = Enigma.new
    enigma_1.encrypt("hello world", "02715", "040895")

    enigma_2 = Enigma.new
    enigma_2.encrypt("hello world", "12345", "080589")

    assert_equal 3, enigma_1.shift_table("02715", "040895")[:a]
    assert_equal 27, enigma_1.shift_table("02715", "040895")[:b]
    assert_equal 73, enigma_1.shift_table("02715", "040895")[:c]
    assert_equal 20, enigma_1.shift_table("02715", "040895")[:d]

    assert_equal 18, enigma_2.shift_table("12345", "080589")[:a]
    assert_equal 32, enigma_2.shift_table("12345", "080589")[:b]
    assert_equal 36, enigma_2.shift_table("12345", "080589")[:c]
    assert_equal 46, enigma_2.shift_table("12345", "080589")[:d]
  end

  def test_it_can_create_a_cipher_table_for_each_encrypt_shift
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    a_expected = {
      "a"=>"d", "b"=>"e", "c"=>"f", "d"=>"g", "e"=>"h", "f"=>"i","g"=>"j",
      "h"=>"k", "i"=>"l", "j"=>"m", "k"=>"n", "l"=>"o", "m"=>"p", "n"=>"q",
      "o"=>"r", "p"=>"s", "q"=>"t", "r"=>"u", "s"=>"v", "t"=>"w", "u"=>"x",
      "v"=>"y", "w"=>"z", "x"=>" ", "y"=>"a", "z"=>"b", " "=>"c"
      }

    b_expected = {
      "a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f", "g"=>"g",
      "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n",
      "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", "u"=>"u",
      "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", " "=>" "
      }

    c_expected = {
      "a"=>"t", "b"=>"u", "c"=>"v", "d"=>"w", "e"=>"x", "f"=>"y", "g"=>"z",
      "h"=>" ", "i"=>"a", "j"=>"b", "k"=>"c", "l"=>"d", "m"=>"e", "n"=>"f",
      "o"=>"g", "p"=>"h", "q"=>"i", "r"=>"j", "s"=>"k", "t"=>"l", "u"=>"m",
      "v"=>"n", "w"=>"o", "x"=>"p", "y"=>"q", "z"=>"r", " "=>"s"
      }

    d_expected = {
      "a"=>"u", "b"=>"v", "c"=>"w", "d"=>"x", "e"=>"y", "f"=>"z", "g"=>" ",
      "h"=>"a", "i"=>"b", "j"=>"c", "k"=>"d", "l"=>"e", "m"=>"f", "n"=>"g",
      "o"=>"h", "p"=>"i", "q"=>"j", "r"=>"k", "s"=>"l", "t"=>"m", "u"=>"n",
      "v"=>"o", "w"=>"p", "x"=>"q", "y"=>"r", "z"=>"s", " "=>"t"
      }

    assert_equal a_expected, enigma.encrypt_table("02715", "040895")[:a]
    assert_equal b_expected, enigma.encrypt_table("02715", "040895")[:b]
    assert_equal c_expected, enigma.encrypt_table("02715", "040895")[:c]
    assert_equal d_expected, enigma.encrypt_table("02715", "040895")[:d]
  end

  def test_it_can_create_a_cipher_table_for_each_decrypt_shift
    enigma = Enigma.new
    enigma.decrypt("keder ohulw", "02715", "040895")

    a_expected = {
      "a"=>"y", "b"=>"z", "c"=>" ", "d"=>"a", "e"=>"b", "f"=>"c", "g"=>"d",
      "h"=>"e", "i"=>"f", "j"=>"g", "k"=>"h", "l"=>"i", "m"=>"j", "n"=>"k",
      "o"=>"l", "p"=>"m", "q"=>"n", "r"=>"o", "s"=>"p", "t"=>"q", "u"=>"r",
      "v"=>"s", "w"=>"t", "x"=>"u", "y"=>"v", "z"=>"w", " "=>"x"
      }

    b_expected = {
      "a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f", "g"=>"g",
      "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n",
      "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", "u"=>"u",
      "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", " "=>" "
      }

    c_expected = {
      "a"=>"i", "b"=>"j", "c"=>"k", "d"=>"l", "e"=>"m", "f"=>"n", "g"=>"o",
      "h"=>"p", "i"=>"q", "j"=>"r", "k"=>"s", "l"=>"t", "m"=>"u", "n"=>"v",
      "o"=>"w", "p"=>"x", "q"=>"y", "r"=>"z", "s"=>" ", "t"=>"a", "u"=>"b",
      "v"=>"c", "w"=>"d", "x"=>"e", "y"=>"f", "z"=>"g", " "=>"h"
      }

    d_expected = {
      "a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m", "g"=>"n",
      "h"=>"o", "i"=>"p", "j"=>"q", "k"=>"r", "l"=>"s", "m"=>"t", "n"=>"u",
      "o"=>"v", "p"=>"w", "q"=>"x", "r"=>"y", "s"=>"z", "t"=>" ", "u"=>"a",
      "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f", " "=>"g"
      }

      assert_equal a_expected, enigma.decrypt_table("02715", "040895")[:a]
      assert_equal b_expected, enigma.decrypt_table("02715", "040895")[:b]
      assert_equal c_expected, enigma.decrypt_table("02715", "040895")[:c]
      assert_equal d_expected, enigma.decrypt_table("02715", "040895")[:d]
  end

end
