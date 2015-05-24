require_relative 'trees'
require_relative 'star_tree'
require_relative 'path_tree'
require_relative 'symmetric_star'
require 'graph'


# Definition: A firecracker F is a tree consisting of a path P(F) and a
# collection of stars, where each vertex on P(F) is joined
# to the central vertex of exactly one star.

# Theorem: All firecracker trees are graceful.


class Firecracker < Tree
  attr_reader :star_vertices, :path_length, :path_nodes

  def self.build(options)
    path = Path.build(vertices: options[:star_vertices])
    options[:path_nodes] = path.nodes
    tree = Firecracker.new(options)
    tree.root = path.root
    tree.nodes.each do |node|
      node.children << Star.build(vertices: tree.star_vertices).root
    end
    tree.label_nodes

    tree
  end

  def nodes
    queue, nodes = [], []
    queue += path_nodes
    nodes += path_nodes
    while queue.any?
      node = queue.shift
      queue += node.children - nodes
      nodes += node.children - nodes
    end

    nodes
  end

  def initialize(options)
    super(options)
    @star_vertices = options[:star_vertices]
    @path_length   = options[:path_length]
    @path_nodes    = options[:path_nodes]
  end
end
