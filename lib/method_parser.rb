module MethodParser
  attr_reader :index

  def parse source_code
    @index = 0
    @source_code = source_code
    parsed_method = ParsedMethod.new
    while @index < source_code.length
      @index += 1
      
    end
    parsed_method
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

  def character_at index
    return @source_code[index]
  end

  def is_seperator? a_string
    return [' '].include? a_string
  end

  class ParsedMethod

  end

  class SyntaxTree
    attr_reader :token,
                :nodes

    def initialize token_string
      @token = token_string
      @nodes = []
    end

  end

end