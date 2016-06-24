require_relative 'test_helper'
require_relative '../lib/parser'

  class ParserTest < Minitest::Test
    include Parser

    def test_that_it_has_a_version_number
      refute_nil ::Parser::VERSION
    end

    def test_parse_method
      example_method = "some_method\n\tsome_val\nend"

      parsed_method = parse_method example_method
      
      assert_equal 'some_method', parsed_method.name
      assert_equal 'some_val', parsed_method.body
    end
  end

