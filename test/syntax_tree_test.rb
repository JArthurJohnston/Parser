require_relative 'parser_test'
require_relative '../lib/syntax_tree'
class SyntaxTreeTest < ParserTest

  def test_tree_fields
    tree = SyntaxTree.new

    assert_empty tree.nodes
  end
end