require './tree.rb'
require './Node.rb'
require './K_aryLabeling.rb'


class K_aryTree < Tree

  class << self
    def build(depth:, vdegree:, labeling:)
      tree = K_aryTree.new(depth: depth, vdegree: vdegree)
      K_aryTree.build_children(node: tree.root, vdegree: vdegree, depth: depth)
      tree.label_nodes(labeling)

      tree
    end

    def build_children(node:, vdegree:, depth:)
      return if depth == 0

      children = (1..vdegree).map { |i| Node.new }
      node.children = children
      children.map do |child|
        K_aryTree.build_children(node: child, vdegree: vdegree, depth: depth - 1)
      end
    end
  end

  attr_reader :depth, :vdegree

  def initialize(root: Node.new, depth:, vdegree:)
    @root = root
    @depth = depth
    @vdegree = vdegree
  end

  def distinct_labelings
   K_aryLabeling.distinct_labelings(depth: depth, vdegree: vdegree)
  end

  def render(name: '', label: '')
    super(name: "#{vdegree}_tree_depth_#{depth}#{name}", label: label)
  end
end
