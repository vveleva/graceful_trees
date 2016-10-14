require './trees'
require './FirecrackerLabeling'


# Definition: A firecracker F is a tree consisting of a path P(F) and a
# collection of stars, where each vertex on P(F) is joined
# to the central vertex of exactly one star.

# Theorem: All firecracker trees are graceful.


class Firecracker < Tree

  attr_reader :star_nodes, :path_length, :path_nodes

  def self.build(options)
    path = Path.build(nodes: options[:path_length])
    options[:path_nodes] = path.nodes
    tree = Firecracker.new(options)
    tree.root = path.root
    tree.nodes.each do |node|
      node.children << Star.build(nodes: tree.star_nodes - 1).root
    end
    tree.label_nodes(FirecrackerLabeling.graceful_labeling(options))

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

  def render(options = {})
    options[:name]  ||= "firecracker_#{path_length}#{star_nodes}"
    options[:label] ||= "Graceful F(#{path_length}, #{star_nodes}) labeling"
    super(options)
  end

  def initialize(options)
    super(options)
    @star_nodes = options[:star_nodes]
    @path_length   = options[:path_length]
    @path_nodes    = options[:path_nodes]
  end
end
