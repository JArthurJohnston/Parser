require_relative '../lib/scope_parser'
require_relative '../test/parser_test'

module Parser
  class ScopeParserTest < ParserTest

    def test_initialize
      expected_source = 'some code'
      parser = ScopeParser.new expected_source
      assert_equal 0 , parser.index
      assert_equal expected_source, parser.source_code
      parse_tree = parser.tree
      assert_empty parse_tree.nodes
      assert_equal :root, parse_tree.identifier
      assert_equal parse_tree, parser.instance_variable_get(:@current_node)
    end

    def test_creates_parse_tree_from_class
      source_code = 'class SomeClass
end'
      parse_tree = ScopeParser.parse source_code

      assert_equal 1, parse_tree.nodes.length
      class_node = parse_tree.nodes[0]

      assert_equal :class, class_node.identifier
      assert_equal 'SomeClass', class_node.name
      assert_empty class_node.nodes
    end

    def test_parser_seperators
      assert_equal [' ', '.', "\n", "\t", ':', '(', ')', '{', '}', '[', ']', '<'], ScopeParser.seperators
    end

    def test_parse_empty_string_returns_empty_node
      tree = ScopeParser.parse ''
      assert_equal :root, tree.identifier
      assert_empty tree.nodes
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
      parser.instance_variable_set(:@index_of_last_seperator, 5)
      assert_equal 'SomeClass', parser.current_token

      parser.instance_variable_set(:@index, 20)
      parser.instance_variable_set(:@index_of_last_seperator, 15)
      assert_equal 'some_object', parser.current_token
    end

    def test_index_of_last_seperator
      source_code = 'class SomeClass'
      parser = ScopeParser.new source_code
      assert_equal 0, parser.index_of_last_seperator

      parser.parse
      assert_equal 5, parser.index_of_last_seperator
    end

    def test_index_of_next_seperator
      source_code = 'class SomeClass'
      parser = ScopeParser.new source_code

      assert_equal 5, parser.index_of_next_seperator

      parser.instance_variable_set(:@index, 8)
      assert_equal source_code.length, parser.index_of_next_seperator
    end

  end
end
