module K_aryLabeling

  def distinct_labelings(depth, vdegree)
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


module Labeling

  def distinct_labelings(depth)
    (0...depth).to_a.permutation.to_a
  end
end


module FirecrackerLabeling

  def graceful_labeling(options)
    k = options[:path_length]
    k = k.odd? ? k - 1 : k
    m = options[:star_nodes]
    labels = []

    k.times do |i|
      label = i.even?  ?  i / 2 * m  :  (k - (i + 1) / 2) * m
      labels << label
    end

    k.times do |i|
      label = i.even?  ?  (k - i / 2) * m - 1  :  (i + 1) / 2 * m - 1
      labels << label
    end

    k.times do |i|
      (2...m).each do |j|
        label = i.even?  ?  j + i / 2 * m - 1  :  j + (k - (i + 1) / 2) * m - 1
        labels << label
      end
    end

    labels
  end
end
