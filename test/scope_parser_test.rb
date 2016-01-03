require_relative '../lib/scope_parser'
require_relative 'parser_test'

class ScopeParserTest < ParserTest

  def test_parser_fields
    expected_source = "class SomeClass\nend"
    parser = ScopeParser.new expected_source

    assert_equal 0, parser.index
    assert_equal expected_source, parser.source
  end

  def test_parses_class_declaration
    expected_source = "class SomeClass\nend"
    parser = ScopeParser.new expected_source

    tree = parser.parse
  end
end