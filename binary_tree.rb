require 'trees.rb'
require 'graceful_trees.rb'

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
  end
end


btree = BinaryTree.build(depth: 3)

p btree
p btree.all_nodes.map { |node| node.children.length }
p btree.list_of_edges.length

vlabels
p (0...vlabels).to_a.permutation(vlabels).to_a
