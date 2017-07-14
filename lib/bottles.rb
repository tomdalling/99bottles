module Bottles
  extend self

  def verse(number)
    <<~END_VERSE.strip
      #{pluralize(number).capitalize} of beer on the wall, #{pluralize(number)} of beer.
      #{second_line(number)}
    END_VERSE
  end

  def verses(from_number, to_number)
    from_number.downto(to_number)
      .map{ |number| verse(number) }
      .join("\n\n")
  end

  def song
    verses(99, 0)
  end

  def second_line(number)
    if number == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{pronoun(number)} down and pass it around, #{pluralize(number-1)} of beer on the wall."
    end
  end

  def pronoun(count)
    if count == 1
      'it'
    else
      'one'
    end
  end

  def pluralize(count)
    case count
    when 0 then 'no more bottles'
    when 1 then '1 bottle'
    else "#{count} bottles"
    end
  end

end

