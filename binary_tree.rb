require_relative 'trees'
require_relative 'symmetric_star_labeling'
require 'graph'

class BinaryTree < Tree
  attr_reader :depth

  def self.build(options)
    tree = BinaryTree.new(options)
    BinaryTree.build_btree(tree.root, options[:depth])
    tree.label_nodes

    tree
  end

  def render
    super(name: "btree_depth_#{depth}")
  end

  def self.build_btree(node, depth)
    return if depth == 0

    node1, node2 = child_nodes = [Node.new, Node.new]
    node.children += child_nodes
    [BinaryTree.build_btree(node1, depth - 1),
     BinaryTree.build_btree(node2, depth - 1)]
  end

  def initialize(options)
    super(options)
    @depth = options[:depth]
  end
end

# btree = BinaryTree.build(depth: 4)
# vlabels = 2 ** (btree.depth)
# p (1..vlabels).each_slice(2).to_a.permutation.to_a.map(&:flatten)
