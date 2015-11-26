require_relative 'parser_test'
require_relative '../lib/source_navigator'

class SourceNavigatorTest < ParserTest

  def test_initialize
    source_code = 'some code stuff'
    nav = SourceNavigator.new source_code

    assert_equal source_code, nav.source_code
    assert_equal 0, nav.index
  end

  def test_parse_until_token
    source_code = 'some code,stuff:and::other-things'
    nav = SourceNavigator.new source_code

    actual_token = nav.parse_until ' '
    assert_equal 'some', actual_token

    actual_token = nav.parse_until ','
    assert_equal 'code', actual_token

    actual_token = nav.parse_until ':'
    assert_equal 'stuff', actual_token
  end
end