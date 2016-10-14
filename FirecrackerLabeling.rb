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
