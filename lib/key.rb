module Key

  def format_to_char_length(characters, length)
    until characters.length == length
      characters.prepend("0")
    end
    characters
  end

  def random_characters
    options = ("0".."99999").to_a
    selection = options.sample
    format_to_char_length(selection, 5)
  end

  def a_key_values(key)
    (key[0] + key[1]).to_i
  end

  def b_key_values(key)
    (key[1] + key[2]).to_i
  end

  def c_key_values(key)
    (key[2] + key[3]).to_i
  end

  def d_key_values(key)
    (key[3] + key[4]).to_i
  end
end
