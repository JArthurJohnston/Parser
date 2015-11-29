require_relative 'node'

module Nodes
  class ClassNode < Node
    attr_accessor :name

    def self.named a_string
      new_node = self.new
      new_node.name = a_string
      new_node
    end

    def initialize
      super(:class)
    end

  end
end