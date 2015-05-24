require_relative 'trees'


class Path < Tree
  attr_reader :vertices

  def self.build(options)
    labels = Path.graceful_labeling(options[:vertices])
    path = Path.new(options)
    path.root.label = labels.shift
    parent = root = path.root
    labels.each do |label|
      temp = Node.new(label: label)
      parent.children << temp
      parent = temp
    end

    path
  end

  def self.graceful_labeling(vertices)
    labels = (0...vertices).to_a
    labels.take(labels.length / 2).zip(labels.reverse).flatten
  end

  def initialize(options)
    super(options)
    @vertices = options[:vertices]
  end
end
