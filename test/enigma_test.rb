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
    skip
    enigma = Enigma.new
    expected = {decryption: "hello world", key: "02715", date: "040895"}

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_a_key_and_no_date
    skip
    # encrypt a message with a key (uses today's date)
    enigma = Enigma.new
    # ?use today's date for date output in hash result - determine how to test
    # ?include todays date in expected value
    #test for key match
    #test for phrase length

    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_a_key_and_no_date
    skip
    #decrypt a message with a key (uses today's date)
    enigma = Enigma.new
    # ?use today's date for date output in hash result - determine how to test
    # ?include todays date in expected value
    #test for key match
    #test for phrase length

    assert_equal expected, enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_a_message_with_only_a_message
    skip
    enigma = Enigma.new
    # use today's date for date output in hash result - determine how to test
    # random key output? Test what we do know. Todays date, encrypted message,
    # length of key > 5
    expected = {encryption: "keder ohulw"}
  end

end
