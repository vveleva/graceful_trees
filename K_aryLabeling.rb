module K_aryLabeling

  def distinct_labelings(depth:, vdegree:)
    basic_labeling.to_a.permutation.to_a
  end

  def basic_labeling(depth, vdegree)
    (0...(depth ** (vdegree + 1) - 1) / (vdegree - 1)).to_a
  end

  def graceful_btree_labelings(depth)
    labelings = K_aryTree.distinct_labelings(depth)
    graceful_labelings = []
    labelings.each do |labeling|
      tree = K_aryTree.build(depth: depth, labeling: labeling)
      graceful_labelings << labeling if tree.is_graceful?
      tree = K_aryTree.new(depth: depth)
    end

    graceful_labelings
  end
end
