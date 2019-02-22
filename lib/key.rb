class Key
  attr_reader :characters

  def initialize(characters = random_characters )
    @characters = format_to_five_chars(characters)
  end

  def format_to_five_chars(characters)
    until characters.length == 5
      characters.prepend("0")
    end
    characters
  end

  def random_characters
    options = ("0".."99999").to_a
    selection = options.sample
    format_to_five_chars(selection)
  end
end
