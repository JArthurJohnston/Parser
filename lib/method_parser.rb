require_relative 'abstract_parser'
require_relative '../lib/syntax_tree/method_node'
require_relative '../lib/syntax_tree/argument_node'

module Parser

  class MethodParser < AbstractParser
    attr_reader :index

    def parse
      method_name = parse_name
      method_args = parse_arguments
      method_body = parse_body

      ParseTrees::MethodNode.new method_name, method_body, method_args
    end

    def parse_name
      @index = next_separator_index
      token(0, @index)
    end

    def parse_body
      token(@index, @source_code.length - 3)
      #   -3 to remove the 'end' string from the end of the body
      #   gimme a break, its my first pass
    end

    def parse_arguments
      arguments = []
      argument_index = @index

      while_within_bounds! do
        case current_character
          when "\n"
            add_substring_to_argument_list argument_index, arguments
            unless next_nonwhite_character.eql?(',')
              return arguments
            end
            argument_index = @index + 1
          when ','
            add_substring_to_argument_list argument_index, arguments
            skip_to! next_nonwhite_index_from(@index + 1) - 1
            argument_index = @index + 1
          when '('
            argument_index = @index + 1
          when ')'
            add_substring_to_argument_list argument_index, arguments
            @index += 1
            return arguments
          when '='
        #     parse arguments with default values
        end
      end
      return arguments
    end

    private

      def add_substring_to_argument_list(start_index, argument_list)
        token = token(start_index, @index)
        unless token.eql?('')
          new_arg = ParseTrees::ArgumentNode.new(token)
          argument_list.push(new_arg)
        end
      end
  end

end
