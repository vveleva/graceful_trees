require_relative 'trees'

class Star < Tree

  attr_reader :vertices

  def self.build(options)
    tree = Star.new(options)
    tree.root.children += Array.new(tree.vertices - 1) { Node.new }
    tree.label_nodes

    tree
  end

  def render(options = {})
    options[:name] ||= "star_#{vertices}v"
    options[:label] ||= "\nGraceful #{vertices}-star labeling"
    super(options)
  end

  def initialize(options)
    super(options)
    @vertices = options[:vertices]
  end

end
