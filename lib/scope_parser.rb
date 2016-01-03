require_relative '../lib/syntax_tree'
require_relative '../lib/string_parser'

class ScopeParser
  include StringParser

  attr_reader :source,
              :index

  def initialize source
    @source = source
    @index = 0
  end

  def parse
    tree = SyntaxTree.new

  end
end