require_relative '../../test/parser_test'
require_relative '../../lib/Nodes/class_node'

module Nodes
  class ClassNodeTest < ParserTest

    def test_initialize
      node = ClassNode.new
      assert_equal :class, node.identifier
      assert_empty node.nodes
    end

  end
end