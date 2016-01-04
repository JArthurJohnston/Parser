require_relative 'syntax_tree'

module Parser
  module ParseTrees

    class AbstractSyntaxTreeNode < SyntaxTree
      attr_accessor :parent
    end

  end
end