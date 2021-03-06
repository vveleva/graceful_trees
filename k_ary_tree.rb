require_relative 'trees'


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
    options[:name] = "#{vdegree}_tree_depth_#{depth}#{custom_name}"
    options[:label] ||= ""
    super(options)
  end

  def self.build_children(node, vdegree, depth)
    return if depth == 0

    children = (1..vdegree).map { |i| Node.new }
    node.children = children
    children.map { |child| K_aryTree.build_children(child, vdegree, depth - 1) }
  end

  def initialize(options)
    super(options)
    @depth = options[:depth]
    @vdegree = options[:vdegree]
  end
end
