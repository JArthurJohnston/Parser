require_relative '../../test/parser_test'
require_relative '../../lib/syntax_tree/method_node'

class MethodNodeTest < ParserTest

  def test_method_node_fields
    expected_name = 'sjfkdsklj'
    expected_args = ['asdf', 'qwer']
    expected_body = 'sfkjsdfjqwer'

    node = MethodNode.new
    assert_empty node.nodes
    assert_nil node.parent

    assert_nil node.name
    assert_empty node.arguments
    assert_nil node.body

    node = MethodNode.new expected_name, expected_body, expected_args
    assert_equal expected_name, node.name
    assert_equal expected_args, node.arguments
    assert_equal expected_body, node.body
  end

end