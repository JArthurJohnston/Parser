require_relative '../lib/Nodes/node'
require_relative '../lib/Nodes/class_node'

module Parser
  class ScopeParser
    attr_reader :source_code,
                :index,
                :tree,
                :index_of_last_seperator,
                :current_node

    class << self
      def parse source_code
        self.new(source_code).parse
      end

      def seperators
        [' ', '.', "\n", "\t", ':', '(', ')', '{', '}', '[', ']', '<']
      end
    end

    def initialize source_code
      @index_of_last_seperator = 0
      @index = 0
      @source_code = source_code
      @tree = Nodes::Node.new :root
      @current_node = @tree
    end

    def parse
      while @index < @source_code.length
        if is_seperator? current_character
          @index_of_last_seperator = @index
        end
        case current_token
          when 'class'
            parse_class_node
        end
        @index += 1
      end
      @current_node
    end

    def parse_class_node
      class_node = Nodes::ClassNode.new
      @index_of_last_seperator = index_of_next_seperator
      @index = @index_of_last_seperator + 1
      class_name = current_token
      class_node.name= class_name
      @current_node.add class_node
      @index = index_of_next_seperator
    end

    def index_of_next_seperator
      character_index = @index
      while character_index < @source_code.length
        if is_seperator? character_at(character_index)
          return character_index
        end
        character_index += 1
      end
      @source_code.length
    end

    def is_seperator? token
      return self.class.seperators.include? token
    end

    def character_at an_index
      @source_code[an_index]
    end

    def current_character
      character_at @index
    end

    def current_token
      substring_length = index_of_next_seperator - @index_of_last_seperator
      @source_code.slice(@index_of_last_seperator, substring_length).strip
    end

  end
end
