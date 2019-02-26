module Key

  def key_table(key)
    key_values = {}
    key_values[:a] = (key[0] + key[1]).to_i
    key_values[:b] = (key[1] + key[2]).to_i
    key_values[:c] = (key[2] + key[3]).to_i
    key_values[:d] = (key[3] + key[4]).to_i
    key_values
  end

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

end
