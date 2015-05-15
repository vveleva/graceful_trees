#!/usr/bin/env python

from math import ceil, floor

def graceful_mnstar_label(m, n, j, i):
  """returns the label for the ith vertex in the jth leg of a graceful mn-star"""
  if m % 2 == 1:
        return int((-1) ** (i + 1)) * (n * ((m - 1) / 2 + 1 - j) + 
               int(ceil((n - i) / 2.0))) + (n * m + 1) / 2
  else:
        return int((-1) ** (i + 1)) * (n * (m / 2 + 1 - j) - int(floor(i / 2.0))) + n * m / 2

# generate a graceful star with m legs of length n
def graceful_mnstar(m, n):
  """returns an n-row x m-matrix matrix of labels for an mn-star"""
  if m % 2 == 1:
      return [[ int((-1) ** (i + 1)) * (n * ((m - 1) / 2 + 1 - j) + int(ceil((n - i) / 2.0))) + (n * m + 1) / 2
             for j in range(1, m + 1)
          ] for i in range(1, n + 1)
         ]
  else:
      return [[ int((-1) ** (i + 1)) * (n * (m / 2 + 1 - j) - int(floor(i / 2.0))) + n * m / 2
             for j in range(1, m + 1)
          ] for i in range(1, n + 1)
         ]

def print_graceful_mnstar(mnstar):
  print( '\n'.join( ['\t'.join(['%d' % el for el in row]) for row in mnstar]) )

def graceful_mnstar_edges(mnstar):
  m = len(mnstar[0])
  n = len(mnstar)
  # initialize to mnstar (copy)
  result = [list(x) for x in mnstar]
  result[0] = [x for x in mnstar[0]]
  for i in range(1, n + 1):
    for j in range(1, m + 1):
      result[i][j] = abs(mnstar[i][j] - mnstar[i - 1][j])
  return result

print(print_graceful_mnstar(graceful_mnstar(16, 9)))
print(graceful_mnstar_label(4, 5, 2, 3))