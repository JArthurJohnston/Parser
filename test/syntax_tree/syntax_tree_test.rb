require_relative '../parser_test'
require_relative '../../lib/syntax_tree/syntax_tree'
require_relative '../../lib/syntax_tree/abstract_syntax_tree_node'

module Parser
  module ParseTrees

    class SyntaxTreeTest < ParserTest

      def test_tree_fields
        tree = SyntaxTree.new

        assert_empty tree.nodes
      end

      def test_node_fields
        node = AbstractSyntaxTreeNode.new

        assert_empty node.nodes
        assert_nil node.parent
      end

      def test_add_node_to_tree
        tree = SyntaxTree.new
        node = AbstractSyntaxTreeNode.new

        tree.add node

        assert_equal 1, tree.nodes.length
        assert tree.nodes.include? node
        assert_equal tree, node.parent
      end
    end

  end
end