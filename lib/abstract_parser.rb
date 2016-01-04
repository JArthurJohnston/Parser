class AbstractParser
  attr_reader :source_code,
              :index

  def initialize(source_code)
    @source_code = source_code
    @index = 0
  end

  def substring start_index, end_index
    @source_code[start_index, end_index - start_index]
  end

  def token start_index, end_index
    substring(start_index, end_index).strip
  end

  def is_separator? a_string
    [' ', ',', '.', '(', ')'].include? a_string
  end

  def next_separator_index
    find_separator_index 1
  end

  def previous_separator_index
    find_separator_index -1
  end

  def next_nonwhite_character
    find_nonwhite_character 1
  end

  def next_nonwhite_index
    find_nonwhite_index 1
  end

  def previous_nonwhite_character
    find_nonwhite_character -1
  end

  def current_token
    token_at @index
  end

  def current_character
    character_at @index
  end

  private

    def token_at index
      start_index = find_separator_index_from -1, index
      end_index = find_separator_index_from 1, index

      if end_index < start_index
        end_index = @source_code.length
      end

      token = substring(start_index, end_index)
      return token.strip
    end

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

    def find_nonwhite_character direction
      index = @index
      while in_source_bounds?(index)
        current_char = @source_code[index]
        unless is_whitespace_at index
          return current_char
        end
        index += direction
      end
      return ''
    end

  def find_nonwhite_index direction
    index = @index
    while in_source_bounds?(index)
      unless is_whitespace_at index
        return index
      end
      index += direction
    end
    index
  end

  def in_source_bounds?(index)
    index >= 0 and index < @source_code.length
  end

  def index_in_bounds?
    in_source_bounds? @index
  end

  def while_within_bounds! &block
    while in_source_bounds? @index
      block.call
      @index += 1
    end
  end

  def is_whitespace_at index
      [' ', "\t", "\n"].include? @source_code[index]
    end

end