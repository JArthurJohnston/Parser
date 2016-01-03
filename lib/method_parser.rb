module MethodParser
  attr_reader :index

  def parse source_code
    @index = 0
    @source_code = source_code
    parsed_method = ParsedMethod.new
    parsed_method.name = parse_name
    parsed_method.arguments = parse_arguments
    parsed_method
  end

  def parse_name
    @index = next_seperator_index
    substring(0, @index).strip
  end

  def parse_arguments
    has_arguments = false
    arguments = []
    while @index < @source_code.length
      case @source_code[@index]
        when "\n"
          unless has_arguments
            return arguments
          end
        when ','
        when '('
          has_arguments = true
        when ')'
          has_arguments = false
          # pase last argument
          return arguments
      end
      @index += 1
    end
    arguments
  end

  def next_seperator_index
    seperator_index = @index
    while seperator_index < @source_code.length
      seperator_index += 1
      if is_seperator? character_at seperator_index
        return seperator_index
      end
    end
  end

  def next_nonwhite_character
    while @index < @source_code.length
      current_char = @source_code[@index]
      unless [' ', "\t", "\n"].include? current_char
        return current_char
      end
      @index += 1
    end
    return ''
  end

  def substring start_index, end_index
    @source_code[start_index, end_index - start_index]
  end

  def character_at index
    return @source_code[index]
  end

  def is_seperator? a_string
    return [' '].include? a_string
  end


end