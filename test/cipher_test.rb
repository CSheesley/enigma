require './test/test_helper'

class CipherTest < Minitest::Test

  def test_it_has_27_characters_to_index
    enigma = Enigma.new

    expected = ("a".."z").to_a << " "

    assert_equal expected, enigma.character_index
    assert_equal 27, enigma.character_index.length
    assert_equal "a", enigma.character_index.first
    assert_equal " ", enigma.character_index.last
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
    skip
    enigma = Enigma.new
    enigma.decrypt("keder ohulw", "02715", "040895")

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

      assert_equal a_expected, enigma.decrypt_table("02715", "040895")[:a]
      assert_equal b_expected, enigma.decrypt_table("02715", "040895")[:b]
      assert_equal c_expected, enigma.decrypt_table("02715", "040895")[:c]
      assert_equal d_expected, enigma.decrypt_table("02715", "040895")[:d]
  end


end
