require './tree.rb'
require './Node.rb'
require './FirecrackerLabeling.rb'


# Definition: A firecracker F is a tree consisting of a path P(F) and a
# collection of stars, where each vertex on P(F) is joined
# to the central vertex of exactly one star.

# Theorem: All firecracker trees are graceful.


class Firecracker < Tree

  attr_reader :star_nodes, :path_length, :path_nodes

  def initialize(root: Node.new, star_nodes:, path_nodes:, path_length:)
    @root = root
    @star_nodes = star_nodes
    @path_length = path_length
    @path_nodes = path_nodes
  end

  def self.build(path_length:, star_length:)
    path = Path.build(nodes: path_length)
    tree = Firecracker.new(
      path_nodes: path.nodes,
      path_length: path_length,
      star_length: star_length
    )
    tree.root = path.root
    tree.nodes.each do |node|
      node.children << Star.build(nodes: tree.star_nodes - 1).root
    end
    tree.label_nodes(
      FirecrackerLabeling.graceful_labeling(star_length: star_length, path_length: path_length)
    )

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

  def render(name: nil, label: nil)
    name  ||= "firecracker_#{path_length}#{star_nodes}"
    label ||= "Graceful F(#{path_length}, #{star_nodes}) labeling"
    super(name: name, label: label)
  end
end
