require './test/test_helper'

class CipherTest < Minitest::Test

  def test_it_can_encode_a_message
    cipher = Cipher.new("hello world", "02715", "040895")

    assert_equal "keder ohulw", cipher.encoded
  end

  def test_it_can_encode_a_message_allows_special_characters_to_remain_unchanged
    cipher = Cipher.new("he((o w0r!d", "02715", "040895")

    assert_equal "ke((r o0u!w", cipher.encoded
  end

  def test_it_coverts_capitalized_letter_to_lower_cased_letters
    cipher = Cipher.new("HELLO world", "02715", "040895")

    assert_equal "keder ohulw", cipher.encoded
  end

  def test_it_can_decode_a_message
    cipher = Cipher.new("keder ohulw", "02715", "040895")

    assert_equal "hello world", cipher.decoded
  end

end
