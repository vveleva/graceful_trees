require_relative 'trees'


# labeling = [0, 7, 14, 11, 8, 4, 1, 2, 3, 5, 6, 9, 10, 12, 13]
# btree = K_aryTree.build(depth: 3, vdegree: 2, labeling: labeling)
# btree.render(name: "_graceful", label: "\nGraceful labeling")


# size = 3
# labelings = Tree.distinct_labelings(size)
# Tree.render_graceful_trees(nodes: size, labelings: labelings)


# Tree.render_all_trees(nodes: 4)

# SymmetricStar.build(legs: 6, depth: 3).render
#
# Star.build(nodes: 8).render
#
# Path.build(nodes: 8).render
#
# Firecracker.build(path_length: 4, star_nodes: 3).render

# depth, vdegree = 3, 3
# labeling = (0...(depth ** (vdegree + 1) - 1) / (vdegree - 1)).to_a
# K_aryTree.build(depth: depth, vdegree: vdegree, labeling: labeling).render

depth, vdegree = 4, 2
labeling = (0...31).to_a
K_aryTree.build(depth: depth, vdegree: vdegree, labeling: labeling).render
