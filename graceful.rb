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
    root_nodes_for_partition = []
    partition.each do |num_sub_nodes|
      sub_trees = Tree.build_trees(num_sub_nodes)
      new_root_nodes_for_partition = []

      sub_trees.each do |sub_tree|
        root_nodes_for_partition.each do |root|
          new_root = root.dup
          new_root.children << sub_tree.root
          new_root_nodes_for_partition << new_root
        end
      end

      root_nodes_for_partition = new_root_nodes_for_partition
    end

    root_nodes_for_partition
  end

  def initialize(options)
    @root = options[:root]
  end

  def render
    nodes = [@root, 'new_line']
    until nodes.empty?
      node = nodes.shift
      if node == 'new_line'
        puts
        nodes << 'new_line' unless nodes.empty?
      elsif node.nil?
        print '   '
      else
        print '·'
        node.children.each do |child|
          nodes << child
        end
        nodes << nil
      end
    end
  end
end
