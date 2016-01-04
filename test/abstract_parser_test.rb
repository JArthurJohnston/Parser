require_relative '../lib/abstract_parser'
require_relative 'parser_test'

module Parser

  class AbstractParserTest < ParserTest

    def test_abstract_parser_fields
      expected_source = 'skfjsdkfj'
      parser = AbstractParser.new expected_source

      assert_equal 0, parser.index
      assert_equal expected_source, parser.source_code

    end

    def test_substring
      expected_source = 'blah dee blah'
      parser = AbstractParser.new expected_source

      assert_equal '', parser.substring(0, 0)
      assert_equal 'blah', parser.substring(0, 4)
    end

    def test_is_seperator
      parser = AbstractParser.new ''

      assert parser.is_separator? ' '
      refute parser.is_separator? 'a'
    end

    def test_previous_separator_index
      expected_source = 'blah dee.blah'
      parser = AbstractParser.new expected_source

      parser.instance_variable_set(:@index, 6)
      assert_equal 4, parser.previous_separator_index

      parser.instance_variable_set(:@index, 10)
      assert_equal 8, parser.previous_separator_index

      parser.instance_variable_set(:@index, 2)
      assert_equal 0, parser.previous_separator_index
    end

    def test_next_separator_index
      expected_source = 'blah dee.blah'
      parser = AbstractParser.new expected_source

      parser.instance_variable_set(:@index, 0)
      assert_equal 4, parser.next_separator_index

      parser.instance_variable_set(:@index, 6)
      assert_equal 8, parser.next_separator_index

      parser.instance_variable_set(:@index, expected_source.length)
      assert_equal 0, parser.next_separator_index
    end

    def test_previous_nonwhite_character
      expected_source = "  blah  \tdee. \n blah"
      parser = AbstractParser.new expected_source

      parser.instance_variable_set(:@index, -1)
      assert_equal '', parser.previous_nonwhite_character

      parser.instance_variable_set(:@index, 0)
      assert_equal '', parser.previous_nonwhite_character

      parser.instance_variable_set(:@index, 1)
      assert_equal '', parser.previous_nonwhite_character

      parser.instance_variable_set(:@index, 8)
      assert_equal 'h', parser.previous_nonwhite_character

      parser.instance_variable_set(:@index, 15)
      assert_equal '.', parser.previous_nonwhite_character
    end

    def test_next_nonwhite_character
      expected_source = "  blah  \tdee. \n klah"
      parser = AbstractParser.new expected_source

      parser.instance_variable_set(:@index, 0)
      assert_equal 'b', parser.next_nonwhite_character

      parser.instance_variable_set(:@index, 6)
      assert_equal 'd', parser.next_nonwhite_character

      parser.instance_variable_set(:@index, 13)
      assert_equal 'k', parser.next_nonwhite_character

      parser.instance_variable_set(:@index, 1337)
      assert_equal '', parser.next_nonwhite_character
    end

    def test_next_nonwhite_index
      expected_source = "  blah  \tdee. \n klah"
      parser = AbstractParser.new expected_source

      parser.instance_variable_set(:@index, 0)
      assert_equal 2, parser.next_nonwhite_index

      parser.instance_variable_set(:@index, 6)
      assert_equal 9, parser.next_nonwhite_index

      parser.instance_variable_set(:@index, 13)
      assert_equal 16, parser.next_nonwhite_index

      parser.instance_variable_set(:@index, 1337)
      assert_equal 1337, parser.next_nonwhite_index
    end

    def test_current_token
      expected_source = 'blah dee blahh'
      parser = AbstractParser.new expected_source

      parser.instance_variable_set(:@index, 0)
      assert_equal 'blah', parser.current_token

      parser.instance_variable_set(:@index, 6)
      assert_equal 'dee', parser.current_token

      parser.instance_variable_set(:@index, 10)
      assert_equal 'blahh', parser.current_token
    end

  end

end