require_relative 'abstract_syntax_tree_node'

module Parser
  module ParseTrees

    class ArgumentNode < AbstractSyntaxTreeNode
      attr_reader :name,
                  :value

      def initialize(name, value = nil)
        super()
        @name = name
        @value = value
      end

      def has_default_value?
        !@value.nil?
      end
    end

  end
end
