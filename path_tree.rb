require_relative 'tree'


class Path < Tree
  attr_reader :nodes

  def self.build(options)
    labels = self.class.graceful_labeling(options[:nodes])
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

  def render(options = {})
    options[:name]  ||= "path_#{nodes}v"
    options[:label] ||= "\n\nGraceful labeling for path on #{nodes} vertices"
    options[:rankdir] = :LR
    super(options)
  end

  def self.graceful_labeling(nodes)
    labels = (0...nodes).to_a
    labels.take(labels.length / 2).zip(labels.reverse).flatten
  end

  def initialize(options)
    super(options)
    @nodes = options[:nodes]
  end
end
