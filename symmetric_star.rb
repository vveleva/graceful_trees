require_relative 'trees'
require_relative 'graceful_trees'
require 'colorize'


class SymmetricStar < Tree
  attr_reader :legs, :depth

  def self.build(options)
    tree = SymmetricStar.new(options)
    labeling = SymmetricStarLabeling.new(options[:legs], options[:depth])
    labeling.vlabels.each do |labels|
      tree.root.children << SymmetricStar.build_path(labels)
    end

    tree
  end

  def self.build_path(labels)
    parent = start_node = Node.new(label: labels.shift)
    # start_node.label = labels.shift
    # parent = start_node
    labels.each do |label|
      temp = Node.new
      temp.label = label
      parent.children << temp
      parent = temp
    end

    start_node
  end

  def initialize(options)
    super(options)
    @legs  = options[:legs]
    @depth = options[:depth]
  end
end


star = SymmetricStar.build(legs: 5, depth: 4)

digraph do
  star.list_of_edges.each do |(from, to)|
    edge from, to
  end

  save "star", "png"
end
