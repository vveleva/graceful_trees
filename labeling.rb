module BinaryLabeling

  def distinct_labelings(depth)
    (0...2 ** (depth + 1) - 1).to_a.permutation.to_a
  end

  def graceful_btree_labelings(depth)
    labelings = BinaryTree.distinct_labelings(depth)
    graceful_labelings = []
    labelings.each do |labeling|
      tree = BinaryTree.build(depth: depth, labeling: labeling)
      graceful_labelings << labeling if tree.is_graceful?
      tree = BinaryTree.new(depth: depth)
    end

    graceful_labelings
  end
end


module Labeling

  def distinct_labelings(depth)
    (0...depth).to_a.permutation.to_a
  end
end


module FirecrackerLabeling

  def graceful_labeling(options)
    k = options[:path_length]
    m = options[:star_vertices] + 1

    labels = []
    k.times do |i|
      if i.even?
        labels << i / 2 * m + 1
      else
        labels << 1 + (k - (i + 1) / 2) * m
      end
    end

    k.times do |i|
      if i.even?
        labels << (k - i / 2) * m
      else
        labels << (i + 1) / 2 * m
      end
    end

    k.times do |i|
      (2...m).each do |j|
        if i.even?
          labels << j + i / 2 * m
        else
          labels << j + (k - (i + 1) / 2) * m
        end
      end
    end

    labels
  end
end
