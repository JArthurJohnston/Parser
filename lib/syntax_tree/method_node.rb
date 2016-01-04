require_relative 'abstract_syntax_tree_node'


module Parser
  module ParseTrees

    class MethodNode < AbstractSyntaxTreeNode
      attr_reader :name,
                  :body,
                  :arguments

      def initialize name = nil, body = nil, arguments = []
        super()
        @name = name
        @body = body
        @arguments = arguments
      end

    end
  end
end
