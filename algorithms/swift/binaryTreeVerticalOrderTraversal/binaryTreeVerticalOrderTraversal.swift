/*
314. Binary Tree Vertical Order Traversal

Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

If two nodes are in the same row and column, the order should be from left to right.

Examples 1:

Input: [3,9,20,null,null,15,7]

   3
  /\
 /  \
 9  20
    /\
   /  \
  15   7 

Output:

[
  [9],
  [3,15],
  [20],
  [7]
]

Examples 2:

Input: [3,9,8,4,0,1,7]

     3
    /\
   /  \
   9   8
  /\  /\
 /  \/  \
 4  01   7 

Output:

[
  [4],
  [9],
  [3,0,1],
  [8],
  [7]
]

Examples 3:

Input: [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5)

     3
    /\
   /  \
   9   8
  /\  /\
 /  \/  \
 4  01   7
    /\
   /  \
   5   2

Output:

[
  [4],
  [9,5],
  [3,0,1],
  [8,2],
  [7]
]

https://leetcode.com/problems/binary-tree-vertical-order-traversal/
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    var locations = [(Int, Int, Int)]() // x, y, value
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        dfs(root, 0, 0)
        guard !locations.isEmpty else { return [[Int]]() }
        locations.sort { l1, l2 in
            if l1.0 != l2.0 {
                return l1.0 < l2.0
            } else if l1.1 != l2.1 {
                return l1.1 < l2.1
            } else {
                return l1.2 < l1.2
            }
        }   
        var result = [[Int]]()
        result.append([Int]())
        var prev = locations[0].0
        for l in locations {
            if l.0 != prev {
                prev = l.0
                result.append([l.2])
            } else {
                var last = result.removeLast()
                last.append(l.2)
                result.append(last)
            }
            
        }
        return result
    }
    
    private func dfs(_ root: TreeNode?, _ x: Int, _ y: Int) {
        guard let root = root else { return }
        locations.append((x, y, root.val))
        dfs(root.left, x-1, y+1)
        dfs(root.right, x+1, y+1)
    }
}