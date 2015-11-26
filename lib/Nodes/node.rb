module Nodes
  class Node
    attr_reader :identifier,
                :nodes

    def initialize identifier
      @identifier = identifier
      @nodes = []
    end

  end
end