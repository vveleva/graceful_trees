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
