require_relative 'parser_test'
require_relative '../lib/method_parser'

module Parser

  class MethodParserTest < ParserTest

    def test_parses_method_name
      example_source = 'simple_method arg_1, arg_2
  var_x = 5 + 5
  return var_x
end'
      parser = MethodParser.new example_source

      parsed_method = parser.parse

      assert_equal 'simple_method', parsed_method.name
    end

    def test_parses_method_arguments
      examples = ['simple_method(arg_1, arg_2)
  var_x = 5 + 5
  return var_x
end',
                  'simple_method arg_1, arg_2
  var_x = 5 + 5
  return var_x
end',
                  'simple_method arg_1,
                                    arg_2
  var_x = 5 + 5
  return var_x
end',
                  'simple_method arg_1,
                                    arg_2
  var_x = 5 + 5
  return var_x
end']

      examples.each do
      |each_example|
        parser = MethodParser.new each_example

        parsed_method = parser.parse
        assert_equal ['arg_1', 'arg_2'], parsed_method.arguments, 'failed on: ' + each_example
      end
    end

    def test_parses_method_body
      example_source = 'simple_method(arg_1, arg_2)
  var_x = 5 + 5
  return var_x
end'
      parser = MethodParser.new example_source

      parsed_method = parser.parse
      assert_equal 'var_x = 5 + 5
  return var_x', parsed_method.body
    end


    def test_parses_method_body_without_argument_params
      example_source = 'simple_method arg_1, arg_2
  var_x = 5 + 5
  return var_x
end'
      parser = MethodParser.new example_source

      parsed_method = parser.parse
      assert_equal 'var_x = 5 + 5
  return var_x', parsed_method.body
    end

    def test_parses_method_args_with_default_values
      example_source = 'simple_method(arg_1 = 5, arg_2 = 7)
  var_x = 5 + 5
  return var_x
end'
      parser = MethodParser.new example_source

      parsed_method = parser.parse
      assert_equal ['arg_1', 'arg_2'], parsed_method.arguments

    end

    def test_skips_single_line_comments
      fail 'write me'
    end

    def test_skip_multi_line_comments
      fail 'write me'
    end

  end

end