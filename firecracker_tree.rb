require_relative 'trees'
require_relative 'symmetric_star_labeling'
require 'graph'


# Definition: A firecracker F is a tree consisting of a path P(F) and a
# collection of stars, where each vertex on P(F) is joined
# to the central vertex of exactly one star.


# Theorem: All firecracker trees are graceful.

class Firecracker < Tree
  attr_reader :legs, :depth, :path_length

  def self.build(options)
    tree = Firecracker.new(options)
    legs, depth = tree.legs, tree.depth

  end

  def initialize(options)
    super(options)
    @legs = options[:legs]
    @depth = options[:depth]
    @path_length = options[:path_length]
  end
end
