require_relative 'trees'
require_relative 'symmetric_star_labeling'
require_relative 'labeling'
require 'graph'


class BinaryTree < Tree
  extend BinaryLabeling
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

  def initialize(options)
    super(options)
    @depth = options[:depth]
  end
end
