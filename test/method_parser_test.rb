require_relative 'parser_test'
require_relative '../lib/method_parser'

class MethodParserTest < ParserTest
  include MethodParser
  @@simple_method_example = 'simple_method arg_1, arg_2
  var_x = 5 + 5
  return var_x
end'

  def test_parses_method_name
    parsed_method = parse @@simple_method_example
    assert_equal 'simple_method', parsed_method.name
  end

  def test_parses_method_arguments
    parsed_method = parse @@simple_method_example
    assert_equal ['arg_1', 'arg_2'], parsed_method.arguments
  end

  def test_is_seperator
    assert is_seperator? ' '
    refute is_seperator? 'a'
  end

  def test_syntax_tree
    expected_token = 'some token'
    tree = SyntaxTree.new expected_token
    assert_equal expected_token, tree.token
    assert_empty tree.nodes
  end

  def test_next_nonwhite_character
    example_source = " someting  wicked\nthis \t way
comes ."

    @source_code = example_source

    @index = 0
    assert_equal 's', next_nonwhite_character
    @index = 9
    assert_equal 'w', next_nonwhite_character
    @index = 17
    assert_equal 't', next_nonwhite_character
    @index = 22
    assert_equal 'w', next_nonwhite_character
    @index = 28
    assert_equal 'c', next_nonwhite_character

    @index = 2432
    assert_equal '', next_nonwhite_character
  end

end