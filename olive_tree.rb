require './tree.rb'
require './Node.rb'


# Definition:
# An olive tree T_k is a spider tree with k legs with
# lengths 1, 2, ... , k respectively.


class OliveTree < Tree

  attr_reader :depth

  def initialize(root: Node.new, depth:)
    @root = root
    @depth = depth
  end
end
