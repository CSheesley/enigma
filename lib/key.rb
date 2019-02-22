class Key
  attr_reader :characters

  def initialize(characters)
    @characters = characters
  end

  def format_to_five_chars(characters)
    until characters.length == 5
      characters.prepend("0")
    end
    characters
  end

end
