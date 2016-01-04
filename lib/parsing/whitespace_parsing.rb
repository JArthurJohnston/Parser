
module Parser
  module WhitespaceParsing

    def next_nonwhite_character
      find_nonwhite_character 1
    end

    def next_nonwhite_index
      find_nonwhite_index 1
    end

    def previous_nonwhite_character
      find_nonwhite_character -1
    end

    private

    def is_whitespace_at index
      [' ', "\t", "\n"].include? @source_code[index]
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

  end

end