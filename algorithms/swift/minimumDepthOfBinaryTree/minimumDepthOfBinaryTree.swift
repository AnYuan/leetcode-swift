/*
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

 return its minimum depth = 2.

 https://leetcode.com/problems/minimum-depth-of-binary-tree/

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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue = [root]
        var minDepth = 0
        while !queue.isEmpty {
            minDepth += 1
            let levelSize = queue.count
            for i in 0..<levelSize {
                let node = queue.removeFirst()
                if node.left == nil, node.right == nil {
                    return minDepth
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return minDepth
    }
}
