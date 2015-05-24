require_relative 'symmetric_star'
require_relative 'binary_tree'
require_relative 'trees'


# labeling = [0, 7, 14, 11, 8, 4, 1, 2, 3, 5, 6, 9, 10, 12, 13]
# tree = BinaryTree.build(depth: 3, labeling: labeling)
# tree.render(name: "_graceful", label: "\nGraceful labeling")

# btree = BinaryTree.graceful_btree_labelings(2)

size = 3
labelings = Tree.distinct_labelings(size)
Tree.render_graceful_trees(size, labelings)

# Tree.render_all_trees(4)
