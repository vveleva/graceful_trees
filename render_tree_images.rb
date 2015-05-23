require_relative 'symmetric_star.rb'
require_relative 'binary_tree.rb'


labeling = [7, 14, 11, 8, 4, 1, 2, 3, 5, 6, 9, 10, 12, 13]
tree = BinaryTree.build(depth: 3, labeling: labeling)
tree.render(name: "_graceful", label: "graceful labeling")

l1, l2 = BinaryTree.graceful_labelings(2)
BinaryTree.graceful_labelings(2).each.with_index do |labeling, i|
  tree = BinaryTree.build(depth: 2, labeling: labeling)
  tree.render(name: "#{i}_graceful", label: "graceful labeling")
end
