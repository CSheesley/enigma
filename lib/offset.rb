module Offset

  def format_to_char_length(characters, length)
    until characters.length == length
      characters.prepend("0")
    end
    characters
  end

  def todays_date
    date = ""
    today = Time.new
    date << today.month.to_s
    date << today.day.to_s
    date << today.year.to_s[-2,2]
    format_to_char_length(date, 6)
  end

  def last_four_of_squared(date)
    squared_to_int = date.to_i ** 2
    last_four_of_string = squared_to_int.to_s
    last_four_of_string[-4,4]
  end

  def offset_table(date)
    offset_values = {}
    offset_values[:a] = last_four_of_squared(date)[0].to_i
    offset_values[:b] = last_four_of_squared(date)[1].to_i
    offset_values[:c] = last_four_of_squared(date)[2].to_i
    offset_values[:d] = last_four_of_squared(date)[3].to_i
    offset_values
  end

end
