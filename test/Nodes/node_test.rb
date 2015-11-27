require_relative '../parser_test'
require_relative '../../lib/Nodes/node'

module Nodes
  class NodeTest < ParserTest

    def test_initialize
      expected_identifier = :blah
      node = Node.new(expected_identifier)

      assert_equal expected_identifier, node.identifier
      assert_empty node.nodes
    end

    def test_initialize_defaults_identifier_to_root
      node = Node.new
      assert_equal :root, node.identifier
    end

    def test_add_node
      node = Node.new()
      new_node = Node.new(:child)

      node.add new_node

      assert_equal 1, node.nodes.length
      assert node.nodes.include? new_node

      assert_equal node, new_node.parent_node
    end
  end
end
