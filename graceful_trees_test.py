#!/usr/bin/env python

import unittest

import graceful_trees as gt

class GracefulTreesTest(unittest.TestCase):
  def setUp(self):
    self.mnstar_33 =\
        (0, [
          (9, [(1, [(8, [])])]),
          (6,  [(4, [(5, [])])]),
          (3,  [(7, [(2, [])])]),
          ])

  def tearDown(self):
    pass

  def test_graceful_mnstar(self):
    m = 4
    n = 3
    gt.print_graceful_mnstar(
        gt.graceful_mnstar(m, n)
    )
    print()
    gt.print_graceful_mnstar(
        gt.graceful_mnstar_edges(
            gt.graceful_mnstar(m, n)
        )
    )

if __name__ == '__main__':
  unittest.main() 