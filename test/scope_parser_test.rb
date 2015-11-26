require_relative '../lib/scope_parser'
require_relative '../test/parser_test'

module Parser
  class ScopeParserTest < ParserTest

    def test_initialize
      expected_source = 'some code'
      parser = ScopeParser.new expected_source
      assert_empty parser.stack
      assert_equal 0 , parser.index
      assert_equal expected_source, parser.source_code
      assert_nil parser.tree
    end

    def test_creates_parse_tree_from_class
      source_code = 'class SomeClass
end'
      parse_tree = ScopeParser.parse source_code

      assert_equal :class, parse_tree.identifier
      assert_equal 'SomeClass', parse_tree.name
      assert_empty parse_tree.nodes
    end

    def test_parser_seperators
      assert_equal [' ', '.', "\n", "\t", '::', '(', ')', '{', '}', '[', ']'], ScopeParser.seperators
    end

    def test_character_at
      source_code = 'class SomeClass
end'
      newline_character = '
'
      parser = ScopeParser.new source_code

      assert_equal 'c', parser.character_at(0)
      assert_equal 'd', parser.character_at(source_code.length - 1)
      assert_equal 'S', parser.character_at(6)
      assert_equal ' ', parser.character_at(5)
      assert_equal newline_character, parser.character_at(15)

      assert_nil parser.character_at(1000)
    end

    def test_current_character
      source_code = 'class SomeClass
end'
      newline_character = '
'
      parser = ScopeParser.new source_code

      assert_equal 'c', parser.current_character

      parser.instance_variable_set(:@index, 4)
      assert_equal 's', parser.current_character

      parser.instance_variable_set(:@index, 15)
      assert_equal newline_character, parser.current_character
      assert_equal "\n", parser.current_character

      parser.instance_variable_set(:@index, 1000)
      assert_nil parser.current_character
    end

    def test_current_token
      source_code = 'class SomeClass
  some_object.some_method(an_argument)
end'
      parser = ScopeParser.new source_code

      assert_equal 'class', parser.current_token
      parser.instance_variable_set(:@index, 7)
      assert_equal 'SomeClass', parser.current_token

      parser.instance_variable_set(:@index, 20)
      assert_equal 'some_object', parser.current_token
    end

  end
end
