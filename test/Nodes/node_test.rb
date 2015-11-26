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
  end
end
