require 'byebug'


class Fixnum
  def partitions(max = self)
    return [[]] if self == 0
    [self, max].min.downto(1).flat_map do |i|
      (self - i).partitions(i).map { |rest| [i, *rest] }
    end
  end
end

class Node
  attr_accessor :children

  def initialize(options = {})
    @children = options[:children] || []
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
    @root = options[:root]
  end

  def render
    nodes = [@root]
    until nodes.empty?
      node = nodes.shift
      if node.is_a?(String)
        puts
      else
        print "·"
        nodes += node.children + ["new_line"]
      end
    end
  end
end
