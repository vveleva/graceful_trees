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

  def initialize(options =  {})
    @children = options[:children] || []
  end

  def dup
    duped_children = children.map { |child| child.dup }
    duped = Node.new(children: duped_children)
  end
end

class Tree
  attr_accessor :root_node

  def self.build_trees(num_nodes)
    root_nodes = []
    if num_nodes == 1
      root_nodes << Node.new
    else
      (num_nodes - 1).partitions.each do |partition|
        unless partition.empty?
          root_nodes_for_partition = [Node.new]
          partition.each do |num_sub_nodes|
            sub_trees = Tree.build_trees(num_sub_nodes)
            new_root_nodes_for_partition = []

            sub_trees.each do |sub_tree|
              root_nodes_for_partition.each do |root|
                new_root = root.dup
                new_root.children << sub_tree.root_node
                new_root_nodes_for_partition << new_root
              end
            end

            root_nodes_for_partition = new_root_nodes_for_partition
          end

          root_nodes += root_nodes_for_partition
        end
      end
    end

    return root_nodes.map { |node| Tree.new(root_node: node) }
  end

  def initialize(options)
    @root_node = options[:root_node]
  end

  def render
    nodes = [@root_node, 'new_line']
    until nodes.empty?
      node = nodes.shift
      if node == 'new_line'
        puts
        nodes << 'new_line' unless nodes.empty?
      elsif node.nil?
        print '    '
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
