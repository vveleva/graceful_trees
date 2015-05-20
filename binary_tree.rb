require_relative 'trees'
require_relative 'graceful_trees'
require 'graph'

class BinaryTree < Tree
  attr_reader :depth

  def self.build(options)
    tree = BinaryTree.new(options)
    BinaryTree.build_btree(tree.root, options[:depth])

    tree
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
    label_all_nodes
  end
end


btree = BinaryTree.build(depth: 3)

p btree
# rspec test number of children
# btree = BinaryTree.build(depth: 3)
# btree.all_nodes.map { |node| node.children.length } == [2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0]
p btree.list_of_edges
btree.label_all_nodes
p btree.list_of_edges

# vlabels = 6
# p (0...vlabels).to_a.permutation(vlabels).to_a

digraph do
  btree.list_of_edges.each do |(from, to)|
    edge from, to
  end

  save "btree", "png"
end
