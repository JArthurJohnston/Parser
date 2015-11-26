require_relative 'test_helper'

class ParserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Parser::VERSION
  end
end
