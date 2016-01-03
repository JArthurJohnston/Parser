module StringParser

  def substring start_index, end_index
    @source_code[start_index, end_index - start_index]
  end

  def character_at index
    return @source_code[index]
  end

  def is_seperator? a_string
    return [' ', ',', '.'].include? a_string
  end

  def next_seperator_index
    find_seperator 1
  end

  def previous_seperator_index
    find_seperator -1
  end

  def next_nonwhite_character
    find_nonwhite_character 1
  end

  def previous_nonwhite_character
    find_nonwhite_character -1
  end

  def token_at index

  end

  private

  def find_seperator direction
    seperator_index = @index
    while seperator_index < @source_code.length
      seperator_index += direction
      if is_seperator? character_at seperator_index
        return seperator_index
      end
    end

  end

  def find_nonwhite_character direction
    index = @index
    while index < @source_code.length
      current_char = @source_code[index]
      unless is_whitespace_at index
        return current_char
      end
      index += direction
    end
    return ''
  end

  def is_whitespace_at index
    [' ', "\t", "\n"].include? @source_code[index]
  end

end