require './tree.rb'
require './Node.rb'
require './path_tree.rb'
require './symmetric_star_labeling.rb'
# require 'colorize'


# Theorem: All symmetric star trees are graceful.


class SymmetricStar < Tree

  class << self
    def build(root: Node.new, legs:, depth:)
      star = SymmetricStar.new(root: root, legs: legs, depth: depth)
      vlabels = SymmetricStarLabeling.new(star.legs, star.depth).vlabels
      children = vlabels.map { |label| Path.build(nodes: labels.size, labels: labels).root }
      star.root.children += children

      star
    end

    def render(root: Node.new, legs:, depth:, name: nil, label: nil)
      star = SymmetricStar.build(root: root, legs: legs, depth: depth)
      star.render(name: name, label: label)

      star
    end
  end

  attr_reader :legs, :depth

  def initialize(root:, legs:, depth:)
    @root = root
    @legs  = legs
    @depth = depth
  end

  def label_nodes
    p "already labeled on ::build"
  end

  def render(name: nil, label: nil)
    name ||= "#{legs}#{depth}_symmetric_star"
    label ||= "\n\nGraceful labeling"
    super(name: name, label: label)
  end
end
