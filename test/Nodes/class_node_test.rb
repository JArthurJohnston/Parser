require_relative '../../test/parser_test'
require_relative '../../lib/Nodes/class_node'

module Nodes
  class ClassNodeTest < ParserTest

    def test_initialize
      node = ClassNode.new
      assert_equal :class, node.identifier
      assert_nil node.name
      assert_empty node.nodes
    end

    def test_class_node_name
      node = ClassNode.new
      expected_name = 'BobLoblawLaw'
      node.name= expected_name

      assert_equal expected_name, node.name
    end

  end
end