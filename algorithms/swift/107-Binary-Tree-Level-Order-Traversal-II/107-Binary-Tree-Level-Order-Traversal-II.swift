/*
 107. Binary Tree Level Order Traversal II

 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
 return its bottom-up level order traversal as:
 [
   [15,7],
   [9,20],
   [3]
 ]

 https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            // count of current level nodes
            var count = queue.count - 1
            var tmp = [Int]()
            while count >= 0 {
                let node = queue.removeFirst()
                tmp.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                count -= 1
            }
            if !tmp.isEmpty {
                result.insert(tmp, at: 0)
            }
        }
        return result
    }
}
