require_relative 'trees'
require_relative 'symmetric_star_labeling'
require 'colorize'


# Theorem: All symmetric star trees are graceful.


class SymmetricStar < Tree
  attr_reader :legs, :depth

  def self.build(options)
    tree = SymmetricStar.new(options)
    # labeling = SymmetricStarLabeling.new(tree.legs, tree.depth)
    labeling = SymmetricStarLabeling.new(options[:legs], options[:depth])
    labeling.vlabels.each do |labels|
      tree.root.children << SymmetricStar.build_path(labels)
    end

    tree
  end

  def label_nodes
    p "already labeled on ::build"
  end

  def render
    super(
      label: "\nGraceful labeling",
      name: "#{legs}#{depth}_symmetric_star"
    )
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
