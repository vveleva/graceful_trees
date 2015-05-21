require_relative 'symmetric_star.rb'
require_relative 'binary_tree.rb'


Tree.render_trees(5)

btree = BinaryTree.build(depth: 3)
star  = SymmetricStar.build(legs: 5, depth: 4)

btree.render
star.render
