require './tree.rb'
require './Node.rb'


class Path < Tree
  class << self
    def build(root: Node.new, nodes: [], labels: nil)
      labels ||= graceful_labeling(nodes: nodes)
      path = Path.new(root: root, nodes: nodes)
      path.root.label = labels.shift
      parent = path.root
      labels.each do |label|
        temp = Node.new(label: label)
        parent.children << temp
        parent = temp
      end

      path
    end

    def graceful_labeling(nodes:)
      labels = (0...nodes).to_a
      labels.take(labels.length / 2).zip(labels.reverse).flatten
    end
  end

  attr_reader :nodes

  def initialize(root:, nodes:)
    @root = root
    @nodes = nodes
  end

  def render(name: nil, label: nil)
    name ||= "path_#{nodes}v"
    label ||= "\n\nGraceful labeling for path on #{nodes} vertices"
    super(name: name, label: label, rankdir: :LR)
  end

end
