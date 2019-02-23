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
    as_string = squared_to_int.to_s
    last_four = as_string[-4,4]
  end

  def a_offset_values(date)
    offset = last_four_of_squared(date)
    offset[0].to_i
  end

  def b_offset_values(date)
    offset = last_four_of_squared(date)
    offset[1].to_i
  end

  def c_offset_values(date)
    offset = last_four_of_squared(date)
    offset[2].to_i
  end

  def d_offset_values(date)
    offset = last_four_of_squared(date)
    offset[3].to_i
  end

end
