module Nodes
  class Node
    attr_reader :identifier,
                :nodes
    attr_reader :parent_node

    def initialize identifier= :root
      @identifier = identifier
      @nodes = []
    end

    def add a_node
      a_node.parent_node= self
      @nodes.push a_node
    end

    protected
      def parent_node= a_node
        @parent_node = a_node
      end
  end
end