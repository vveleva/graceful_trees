require_relative 'tree'
require_relative 'symmetric_star_labeling'
require_relative 'labeling'
require 'graph'


class K_aryTree < Tree
  extend K_aryLabeling

  attr_reader :depth, :vdegree

  def self.build(options)
    tree = K_aryTree.new(options)
    K_aryTree.build_children(tree.root, options[:vdegree], options[:depth])
    tree.label_nodes(options[:labeling])

    tree
  end

  def render(options = {})
    custom_name = options[:name] || ""
    options[:name]  ||= "btree_depth_#{depth}#{custom_name}"
    options[:label] ||= ""
    super(options)
  end

  def self.build_children(node, vdegree, depth)
    return if depth == 0


    children = (1..vdegree).map { |i| Node.new }
    node.children = children
    children.map { |child| K_aryTree.build_children(child, vdegree, depth - 1) }
    # node1, node2 = [Node.new, Node.new]
    # node.children = [node1, node2]
    # [K_aryTree.build_children(node1, depth - 1),
    #  K_aryTree.build_children(node2, depth - 1)]
  end

  def initialize(options)
    super(options)
    @depth = options[:depth]
    @vdegree = options[:vdegree]
  end
end
