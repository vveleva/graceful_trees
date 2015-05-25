require_relative 'tree'
require_relative 'k_ary_tree'
require_relative 'symmetric_star'
require_relative 'firecracker_tree'
require_relative 'star_tree'
require_relative 'path_tree'


# labeling = [0, 7, 14, 11, 8, 4, 1, 2, 3, 5, 6, 9, 10, 12, 13]
# tree = K_aryTree.build(depth: 3, labeling: labeling)
# tree.render(name: "_graceful", label: "\nGraceful labeling")


# btree = K_aryTree.graceful_btree_labelings(3)
# btree.each do |l|
#   tree = K_aryTree.build(depth: 3, labeling: l)
#   tree.render(name: "_graceful", label: "\nGraceful labeling")
# end

# size = 3
# labelings = Tree.distinct_labelings(size)
# Tree.render_graceful_trees(size, labelings)


# Tree.render_all_trees(4)

# Star.build(vertices: 8).render

Path.build(vertices: 8).render

Firecracker.build(path_length: 4, star_vertices: 3).render


K_aryTree.build(depth: 2, vdegree: 3, labeling: (0..12).to_a).render
