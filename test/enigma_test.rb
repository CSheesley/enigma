require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_a_date
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_a_key_and_a_date
    enigma = Enigma.new
    expected = {decryption: "hello world", key: "02715", date: "040895"}

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_a_key_and_no_date
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715")

    assert_equal 11, enigma.encrypted[:encryption].length
    assert_equal "02715", enigma.encrypted[:key]
    assert_equal enigma.todays_date, enigma.encrypted[:date]
  end

  def test_it_can_decrypt_a_message_with_a_key_and_no_date
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715")
    encryped_string = enigma.encrypted[:encryption]

    expected = {
      :decryption=>"hello world",
      :key=>"02715",
      :date=> enigma.todays_date
      }

    assert_equal expected, enigma.decrypt(encryped_string, "02715")
  end

  def test_it_can_encrypt_a_message_with_only_a_message
    enigma = Enigma.new
    enigma.encrypt("hello world")

    assert_equal 11, enigma.encrypted[:encryption].length
    assert_equal 5, enigma.encrypted[:key].length
    assert_equal enigma.todays_date, enigma.encrypted[:date]
  end

end
