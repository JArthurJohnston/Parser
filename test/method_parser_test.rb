require_relative 'parser_test'
require_relative '../lib/method_parser'

class MethodParserTest < ParserTest
  include MethodParser
  @@simple_method_example = 'def simple_method
  var_x = 5 + 5
  return var_x
end'

  def test_parses_method_name
    parsed_method = parse @@simple_method_example
    assert_equal @@simple_method_example.length, @index
    assert_equal 'simple_method', parsed_method.name
  end

  def test_is_seperator
    assert is_seperator? ' '
    refute is_seperator? 'a'
  end

  def test_syntax_tree
    expected_token = 'some token'
    tree = SyntaxTree.new expected_token
    assert_equal expected_token, tree.token
    assert_empty tree.tokens
  end

end