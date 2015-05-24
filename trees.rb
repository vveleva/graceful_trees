require_relative 'labeling'
require 'graph'
require 'graphviz'
require 'graphviz/dsl'


class Tree
  extend Labeling

  attr_accessor :root

  def self.build_trees(n)
    root_nodes = []
    if n == 1
      root_nodes << Node.new
    else
      (n - 1).partitions.each do |partition|
        root_nodes += Tree.partition_nodes(partition) unless partition.empty?
      end
    end

    root_nodes.map { |node| Tree.new(root: node) }
  end

  def render(options = {})
    graph_label = options[:label] || ""
    filename = options[:name] || "all_#{self.nodes.length}v_trees"

    GraphViz.graph( :G ) do |graph|
      graphviz_data(graph, "")
      graph[:label] = graph_label
      graph.output(png: "graph_images/#{filename}.png")
    end
  end

  def self.render_all_trees(n)
    GraphViz.graph( :G ) do |graph|
      trees = Tree.build_trees(n)
      trees.each_with_index do |tree, i|
        tree.label_nodes((0...n).to_a)
        tree.graphviz_data(graph, "#{i}")
      end

      graph.output png: "graph_images/all_#{n}v_trees.png"
    end
  end

  def self.render_graceful_trees(n, labelings)
    GraphViz.graph( :G ) do |graph|
      trees = Tree.build_trees(n)
      trees.each_with_index do |tree, j|
        labelings.each_with_index do |labeling, i|
          tree.label_nodes(labeling)
          tree.graphviz_data(graph, "#{i}#{j}") if tree.is_graceful?
        end
      end

      graph.output png: "graph_images/all_#{n}v_graceful_trees.png"
    end
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
  end

  def label_nodes(labeling = [])
    if labeling.empty?
      nodes.each_with_index { |node, idx| node.label = idx }
    else
      raise ArgumentError.new(
        "number of labels doesn't match the number of nodes"
      ) unless nodes.count == labeling.length

      nodes.zip(labeling).each { |node, label| node.label = label }
    end
  end

  def nodes
    queue = [root]
    nodes = [root]
    while queue.any?
      node = queue.shift
      queue += node.children
      nodes += node.children
    end

    nodes
  end

  def edges
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
    vlabels = nodes.map(&:label).sort
    elabels = edges.map { |i, j| (i - j).abs }.sort
    range = (0...vlabels.length).to_a
    vlabels == range && elabels == range[1..-1]
  end

  def inspect
    inspect_node root
  end

  def inspect_node(node)
    nodes = [node.label]
    if node.children.any?
      node.children.each { |child| nodes << inspect_node(child) }
    else
      nodes
    end
  end

  def graphviz_data(graph, n)
    data  = { fontname: "Helvetica", fontsize: 12 }
    ndata = { color: :tomato4, width: 0.5, height: 0.5 }.merge(data)
    edata = { color: :yellowgreen, fontcolor: :yellowgreen }.merge(data)
    graph[data]
    graph.node[ndata]
    graph.edge[edata]

    self.nodes.each do |node|
      graph.add_nodes("#{n}.#{node.label}", label: node.label)
    end

    self.edges.each do |i, j|
      graph.add_edges("#{n}.#{i}", "#{n}.#{j}", label: " #{(i - j).abs}")
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

  def inspect
    label
  end
end


class Fixnum
  def partitions(max = self)
    return [[]] if self == 0
    [self, max].min.downto(1).flat_map do |i|
      (self - i).partitions(i).map { |rest| [i, *rest] }
    end
  end

  def factorial
    (1..self).inject(:*)
  end
end
