require_relative 'abstract_parser'
require_relative '../lib/syntax_tree/method_node'

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
      has_arguments = false
      arguments = []
      argument_index = @index

      while_within_bounds! do
        case current_character
          when "\n"
            if has_arguments
              arguments.push(token(argument_index, @index))
              argument_index = @index + 1
              unless next_nonwhite_character.eql? ','
                return arguments
              end
            end
          when ','
            has_arguments = true
            arguments.push(token(argument_index, @index))
            skip_to! next_nonwhite_index_from(@index + 1) - 1
            argument_index = @index + 1
          when '('
            has_arguments = true
            argument_index = @index + 1
          when ')'
            arguments.push(token(argument_index, @index))
            @index += 1
            return arguments
        end
      end
      return arguments
    end

  end

end
