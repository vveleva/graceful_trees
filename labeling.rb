module Labeling

  def distinct_labelings(depth)
    (0...depth).to_a.permutation.to_a
  end
end
