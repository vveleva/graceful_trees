require_relative 'symmetric_star.rb'
require_relative 'binary_tree.rb'


# labeling = [0, 7, 14, 11, 8, 4, 1, 2, 3, 5, 6, 9, 10, 12, 13]
# tree = BinaryTree.build(depth: 3, labeling: labeling)
# tree.render(name: "_graceful", label: "\nGraceful labeling")

star = SymmetricStar.build(legs: 7, depth: 3)
star.render

# size = 5
# labelings = (0..size).to_a.permutation.to_a#[size.factorial - 1..-1]
# Tree.render_graceful_trees(size, labelings)
# Tree.render_all_trees(4)
