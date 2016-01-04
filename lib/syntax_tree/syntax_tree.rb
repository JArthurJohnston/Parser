module Parser
  module ParseTrees

    class SyntaxTree
      attr_reader :nodes

      def initialize
        @nodes = []
      end

      def add node
        @nodes.push node
        node.parent= self
      end
    end

  end
end
