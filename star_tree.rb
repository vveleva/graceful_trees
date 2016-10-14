require './tree.rb'
require './Node.rb'

class Star < Tree

  attr_reader :nodes

  def self.build(options)
    tree = Star.new(options)
    tree.root.children += Array.new(tree.nodes - 1) { Node.new }
    tree.label_nodes

    tree
  end

  def render(options = {})
    options[:name]  ||= "star_#{nodes}v"
    options[:label] ||= "\n\nGraceful #{nodes}-star labeling"
    super(options)
  end

  def initialize(root: Node.new, nodes: [])
    @root = root
    @nodes = nodes
  end
end
