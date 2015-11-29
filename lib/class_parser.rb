require_relative '../lib/source_parser'

module Parser
  class ClassParser < SourceParser

    class << self
      def parse source_code
        parse_from source_code, 0
      end

      def parse_from source_code, index=0
        self.new(source_code, index).parse
      end
    end

    def parse
      @index_of_last_seperator = index_of_next_seperator
      @index = @index_of_last_seperator + 1
      @index = index_of_next_seperator
      Nodes::ClassNode.named current_token
    end

  end
end