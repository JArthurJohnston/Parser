require "Parser/version"
require_relative '../lib/method_parser'

module Parser

  def parse_method method_source
    MethodParser.new(method_source).parse
  end

end
