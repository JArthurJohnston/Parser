require_relative 'node'

module Nodes
  class ClassNode < Node
    attr_accessor :name

    def initialize
      super(:class)
    end

  end
end