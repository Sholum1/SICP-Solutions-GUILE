#|
  (cc 11 5)
  ├── (cc 11 4)
  │   ├── (cc 11 3)
  │   │   ├── (cc 11 2)
  │   │   │   ├── (cc 11 1)
  │   │   │   │   ├── (cc 11 0)
  │   │   │   │   └── (cc 10 1)
  │   │   │   │       ├── (cc 10 0)
  │   │   │   │       └── (cc 9 1)
  │   │   │   │           ├── (cc 9 0)
  │   │   │   │           └── (cc 8 1)
  │   │   │   │               ├── (cc 8 0)
  │   │   │   │               └── (cc 7 1)
  │   │   │   │                   ├── (cc 7 0)
  │   │   │   │                   └── (cc 6 1)
  │   │   │   │                       ├── (cc 6 0)
  │   │   │   │                       └── (cc 5 1)
  │   │   │   │                           ├── (cc 5 0)
  │   │   │   │                           └── (cc 4 1)
  │   │   │   │                               ├── (cc 4 0)
  │   │   │   │                               └── (cc 3 1)
  │   │   │   │                                   ├── (cc 3 0)
  │   │   │   │                                   └── (cc 2 1)
  │   │   │   │                                       ├── (cc 2 0)
  │   │   │   │                                       └── (cc 1 1)
  │   │   │   │                                           ├── (cc 1 0)
  │   │   │   │                                           └── (cc 0 1)
  │   │   │   └── (cc 6 2)
  │   │   │       ├── (cc 6 1)
  │   │   │       │   ├── (cc 6 0)
  │   │   │       │   └── (cc 5 1)
  │   │   │       │       ├── (cc 5 0)
  │   │   │       │       └── (cc 4 1)
  │   │   │       │           ├── (cc 4 0)
  │   │   │       │           └── (cc 3 1)
  │   │   │       │               ├── (cc 3 0)
  │   │   │       │               └── (cc 2 1)
  │   │   │       │                   ├── (cc 2 0)
  │   │   │       │                   └── (cc 1 1)
  │   │   │       │                       ├── (cc 1 0)
  │   │   │       │                       └── (cc 0 1)
  │   │   │       └── (cc 1 2)
  │   │   │           ├── (cc 1 1)
  │   │   │           │   ├── (cc 1 0)
  │   │   │           │   └── (cc 0 1)
  │   │   │           └── (cc -4 2)
  │   │   └── (cc 1 3)
  │   │       ├── (cc 1 2)
  │   │       │   ├── (cc 1 1)
  │   │       │   │   ├── (cc 1 0)
  │   │       │   │   └── (cc 0 1)
  │   │       │   └── (cc -4 2)
  │   │       └── (cc -9 3)
  │   └── (cc -14 4)
  └── (cc -39 5)
|#

#|
   As mentioned on page 49 "In general, the number of steps required by a
  tree-recursive process will be proportional to the number of nodes in the
  tree,while the space required will be proportional to the maximum depth
  of the tree".
   In this case, the order of growth for space is Θ(n), as the maximum depth of
  recursion is proportional to n. The number of steps, however, is Θ(n^5) due to
  the high branching factor created by the 5 kinds of coins, where each type
  generates a subtree with a number of nodes proportional to n.
|#
