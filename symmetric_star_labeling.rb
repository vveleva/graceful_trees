require 'colorize'
require 'graph'


class SymmetricStarLabeling

  attr_reader :m, :n

  def initialize(m, n)
    @m, @n = m, n
  end

  def self.generate_labels(*names)
    names.each do |name|
      # generate a matrix of labels
      define_method(name) do
        (1..m).map do |j|
          (1..n).map { |i| send(name[0...-1], j, i) }
        end
      end

      # print the labels
      define_method("print_#{name}") do |color = :white|
        result = send(name).transpose.map do |row|
          row.map { |el| "#{el}" }.join("\t")
        end.join("\n")

        puts result.colorize(color)
      end
    end
  end

  generate_labels :vlabels, :elabels

  def vlabel(j, i)
    i.even?   ?   n * (j - 1) + i / 2   :   n * (m - j) + (n - (i - 1) / 2)
  end

  def elabel(j, i)
    i == 1   ?   n * (m - j + 1)   :   (n * (m - 2 * j + 2) - (i - 1)).abs
  end
end
