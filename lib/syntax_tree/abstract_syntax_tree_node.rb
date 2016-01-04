require_relative 'syntax_tree'

class AbstractSyntaxTreeNode < SyntaxTree
  attr_accessor :parent
end