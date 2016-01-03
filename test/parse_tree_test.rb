require_relative 'parser_test'
require_relative '../lib/parse_tree'

class ParseTreeTest < ParserTest

  def test_scope_is_global
    tree = ParseTree.new
    assert_equal :global, tree.scope
  end

  def test_parse_tree_fields
    tree = ParseTree.new
    assert_empty tree.nodes
  end

  def test_add_node_to_tree
    node = ParseTree.new

  end
end