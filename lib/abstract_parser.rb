require_relative 'parsing/whitespace_parsing'
require_relative 'parsing/separator_parsing'

module Parser
  class AbstractParser
    include WhitespaceParsing,
            SeparatorParsing

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

    def current_token
      token_at @index
    end

    def current_character
      character_at @index
    end

    private

    def skip_to! index
      @index = index
    end

    def token_at index
      start_index = find_separator_index_from -1, index
      end_index = find_separator_index_from 1, index

      if end_index < start_index
        end_index = @source_code.length
      end

      token = substring(start_index, end_index)
      return token.strip
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

  end
end