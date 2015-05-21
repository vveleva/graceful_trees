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

  def label_nodes
    "already labeled"
  end

  def render
    super(label: "\nGraceful labeling")
  end

  def self.build_path(labels)
    parent = start_node = Node.new(label: labels.shift)
    labels.each do |label|
      temp = Node.new(label: label)
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
