require_relative '../parser_test_case'
require_relative '../../lib/syntax_tree/argument_node.rb'

class ArgumentNodeTest < ParserTestCase


  def test_fields
    expected_name = 'sfdsadf'
    expected_value = '45234'

    node = Parser::ParseTrees::ArgumentNode.new(expected_name)

    assert_equal expected_name, node.name
    assert_nil node.value
    refute node.has_default_value?

    node = Parser::ParseTrees::ArgumentNode.new(expected_name, expected_value)

    assert_equal expected_value, node.value
    assert node.has_default_value?
  end
end