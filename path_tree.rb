require './tree.rb'
require './Node.rb'


class Path < Tree
  attr_reader :nodes

  def self.build(options)
    labels = self.class.graceful_labeling(nodes:noptions[:nodes])
    path = Path.new(options)
    path.root.label = labels.shift
    parent = path.root
    labels.each do |label|
      temp = Node.new(label: label)
      parent.children << temp
      parent = temp
    end

    path
  end

  def render(name: nil, label: nil)
    name ||= "path_#{nodes}v"
    label ||= "\n\nGraceful labeling for path on #{nodes} vertices"
    super(name: name, label: label, rankdir: :LR)
  end

  def self.graceful_labeling(nodes:)
    labels = (0...nodes).to_a
    labels.take(labels.length / 2).zip(labels.reverse).flatten
  end

  def initialize(root: Node.new, nodes: [])
    @root = root
    @nodes = nodes
  end
end
