require_relative '../test/parser_test'
require_relative '../lib/class_parser'

module Parser
  class ClassParserTest < ParserTest

    def test_parses_simple_class_source
      source_code = 'class SomeClass
end'
      parse_tree = ClassParser.parse source_code

      assert_empty parse_tree.nodes

      assert_equal :class, parse_tree.identifier
      assert_equal 'SomeClass', parse_tree.name
      assert_empty parse_tree.nodes
    end

  end
end