require_relative 'trees'
require_relative 'symmetric_star_labeling'
require 'graph'

class BinaryTree < Tree
  attr_reader :depth

  def self.build(options)
    tree = BinaryTree.new(options)
    BinaryTree.build_children(tree.root, options[:depth])
    tree.label_nodes(options[:labeling])

    tree
  end

  def render(options = {})
    custom_name = options[:name] || ""
    label = options[:label] || ""
    super(name: "btree_depth_#{depth}#{custom_name}", label: label)
  end

  def self.build_children(node, depth)
    return if depth == 0

    node1, node2 = [Node.new, Node.new]
    node.children = [node1, node2]
    [BinaryTree.build_children(node1, depth - 1),
     BinaryTree.build_children(node2, depth - 1)]
  end

  def self.distinct_labelings(depth)
    (1...2 ** (depth + 1) - 1).to_a.permutation.to_a.map { |arr|
      slices = arr.each_slice(2).to_a;
      slices.all? { |i, j| i < j } ? slices : nil
    }.compact.map(&:flatten)
  end

  def initialize(options)
    super(options)
    @depth = options[:depth]
  end

  def self.graceful_labelings(depth)
    labelings = BinaryTree.distinct_labelings(depth)
    graceful_labelings = []
    labelings.each do |labeling|
      tree = BinaryTree.build(depth: 2, labeling: labeling)
      graceful_labelings << labeling if tree.is_graceful?
      tree = BinaryTree.new(depth: depth)
    end

    graceful_labelings
  end
end

# btree = BinaryTree.build(depth: 4)
# vlabels = 2 ** (btree.depth)
# p (1..vlabels).each_slice(2).to_a.permutation.to_a.map(&:flatten)
