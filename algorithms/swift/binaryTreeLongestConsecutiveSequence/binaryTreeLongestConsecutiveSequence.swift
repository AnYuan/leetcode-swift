/*
298. Binary Tree Longest Consecutive Sequence

Given a binary tree, find the length of the longest consecutive sequence path.

The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path need to be from parent to child (cannot be the reverse).

Example 1:

Input:

   1
    \
     3
    / \
   2   4
        \
         5

Output: 3

Explanation: Longest consecutive sequence path is 3-4-5, so return 3.

Example 2:

Input:

   2
    \
     3
    / 
   2    
  / 
 1

Output: 2 

Explanation: Longest consecutive sequence path is 2-3, not 3-2-1, so return 2.

https://leetcode.com/problems/binary-tree-longest-consecutive-sequence/
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
    var result = 0
    func longestConsecutive(_ root: TreeNode?) -> Int {
        dfs(root, nil, 0)
        return result
    }
    
    func dfs(_ node: TreeNode?, _ parent: TreeNode?, _ length: Int) {
        guard let node = node else { return }
        var length = length
        if let p = parent, p.val + 1 == node.val {
            length += 1
        } else {
            length = 1
        }
        result = max(result, length)
        dfs(node.left, node, length)
        dfs(node.right, node, length)
    }
}