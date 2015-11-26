module Parser
  class ScopeParser
    attr_reader :stack,
                :source_code,
                :index,
                :tree

    def self.parse source_code
      while @index < source_code.length
        @index += 1
      end
    end

    def self.seperators
      [' ', '.', "\n", "\t", '::', '(', ')', '{', '}', '[', ']']
    end

    def initialize source_code
      @index = 0
      @source_code = source_code
      @stack = []
    end

    def character_at an_index
      @source_code[an_index]
    end

    def current_character
      character_at @index
    end

    def current_token

    end

  end
end
