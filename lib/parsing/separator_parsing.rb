
module SeparatorParsing

  def is_separator? a_string
    [' ', ',', '.', '(', ')', "\n"].include? a_string
  end

  def next_separator_index
    find_separator_index 1
  end

  def previous_separator_index
    find_separator_index -1
  end

  private

  def character_at index
    @source_code[index]
  end

  def find_separator_index direction
    find_separator_index_from direction, @index
  end

  def find_separator_index_from direction, start_index
    separator_index = start_index
    while in_source_bounds?(separator_index)
      separator_index += direction
      if is_separator? character_at separator_index
        return separator_index
      end
    end
    return 0
  end
end