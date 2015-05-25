require_relative 'tree'


# Definition:
# An olive tree T_k is a spider tree with k legs with
# lengths 1, 2, ... , k respectively.


class OliveTree < Tree

  attr_reader :depth

  def initialize(options)
    super(options)
    @depth = options[:depth]
  end
end
