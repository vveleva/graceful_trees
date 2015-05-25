require_relative 'trees'
require_relative 'binary_tree'
require_relative 'symmetric_star'
require_relative 'firecracker_tree'
require_relative 'star_tree'
require_relative 'path_tree'


# labeling = [0, 7, 14, 11, 8, 4, 1, 2, 3, 5, 6, 9, 10, 12, 13]
# tree = BinaryTree.build(depth: 3, labeling: labeling)
# tree.render(name: "_graceful", label: "\nGraceful labeling")


# btree = BinaryTree.graceful_btree_labelings(3)
# btree.each do |l|
#   tree = BinaryTree.build(depth: 3, labeling: l)
#   tree.render(name: "_graceful", label: "\nGraceful labeling")
# end

# size = 3
# labelings = Tree.distinct_labelings(size)
# Tree.render_graceful_trees(size, labelings)


# Tree.render_all_trees(4)

# star = Star.build(vertices: 5)
# star.render(name: "star_5v")

# path = Path.build(vertices: 6)
# path.render(name: "path_6v", label: "\nGraceful path on 6 vertices")


firecracker = Firecracker.build(path_length: 4, star_vertices: 3)
firecracker.render
