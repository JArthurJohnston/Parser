require_relative '../lib/string_parser'
require_relative 'parser_test'

class StringParserTest < ParserTest
  include StringParser

  def test_substring
    @source_code = 'blah dee blah'

    assert_equal '', substring(0, 0)
    assert_equal 'blah', substring(0, 4)
  end

  def test_character_at
    @source_code = 'blah dee blah'

    assert_equal 'b', character_at(0)
    assert_equal ' ', character_at(4)
    assert_equal 'h', character_at(@source_code.length -  1)
  end

  def test_is_seperator
    assert is_seperator? ' '
    refute is_seperator? 'a'
  end

  def test_previous_separator_index

  end

  def test_token_at
    @source_code = 'blah dee blahh'

    assert_equal 'blah', token_at(0)
  end
end