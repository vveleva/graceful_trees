class Node
  attr_accessor :children, :label

  def initialize(options = {})
    @children = options[:children] || []
    @label = options[:label] || 0
  end

  def dup
    Node.new(children: children.map(&:dup))
  end

  def inspect
    label
  end
end


