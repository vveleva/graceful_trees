require 'byebug'
require 'graph'


class Fixnum
  def partitions(max = self)
    return [[]] if self == 0
    [self, max].min.downto(1).flat_map do |i|
      (self - i).partitions(i).map { |rest| [i, *rest] }
    end
  end
end

class Node
  attr_accessor :children, :label

  def initialize(options = {})
    @children = options[:children] || []
    @label = options[:label] || 0
  end

  def dup
    Node.new(children: children.map(&:dup))
  end
end

class Tree
  attr_accessor :root

  def self.build_trees(num_nodes)
    root_nodes = []
    if num_nodes == 1
      root_nodes << Node.new
    else
      (num_nodes - 1).partitions.each do |partition|
        root_nodes += Tree.partition_nodes(partition) unless partition.empty?
      end
    end

    root_nodes.map { |node| Tree.new(root: node) }
  end

  def self.partition_nodes(partition)
    root_nodes = [Node.new]
    partition.each do |num_sub_nodes|
      sub_trees = Tree.build_trees(num_sub_nodes)
      new_subrootnodes = []

      sub_trees.each do |sub_tree|
        new_subrootnodes += self.subnodes(sub_tree, root_nodes)
      end

      root_nodes = new_subrootnodes
    end

    root_nodes
  end

  def self.subnodes(tree, nodes)
    nodes.map do |node|
      new_node = node.dup
      new_node.children << tree.root
      new_node
    end
  end

  def initialize(options)
    @root = options[:root] || Node.new
    label_all_nodes
  end

  def render
    nodes = [root, "new_line"]
    while nodes.any?
      node = nodes.shift
      if node.is_a?(String)
        puts
      else
        space = " " * (node.children.length / 2)
        print space + "·"
        nodes += node.children + ["new_line"]
      end
    end
  end

  def all_nodes
    queue = [root]
    nodes = [root]
    while queue.any?
      node = queue.shift
      queue += node.children
      nodes += node.children
    end

    nodes
  end

  def label_all_nodes
    all_nodes.each_with_index do |node, idx|
      node.label = idx
    end
  end

  def list_of_edges
    edges = []
    nodes = [root]
    while nodes.any?
      node = nodes.shift
      children = node.children
      if children.any?
        edges += children.map { |child| [node.label, child.label] }
        nodes += children
      end
    end

    edges
  end

  def is_graceful?
    vlabels = all_nodes.map(&:label)
    range = (0..vlabels.length).to_a
    elabels = list_of_edges.map { |(i, j)| (i - j).abs }

    vlabels.sort == range && elabels.sort == range[1..-1]
  end
end


trees = Tree.build_trees(5)

digraph do
  trees.each_with_index do |tree, i|
    tree.list_of_edges.each do |(from, to)|
      edge "#{i}_#{from}", "#{i}_#{to}"
    end
  end

  save "graph_images/trees_on_#{trees.length}_vertices", "png"
end
