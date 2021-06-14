/*
 222. Count Complete Tree Nodes

 Given a complete binary tree, count the number of nodes.

 Note:

 Definition of a complete binary tree from Wikipedia:
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Example:

 Input:
     1
    / \
   2   3
  / \  /
 4  5 6

 Output: 6

 https://leetcode.com/problems/count-complete-tree-nodes/
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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var leftLevel = 0
        var rightLevel = 0
        var l: TreeNode? = root
        var r: TreeNode? = root
        while l != nil {
            leftLevel += 1
            l = l?.left
        }
        while r != nil {
            rightLevel += 1
            r = r?.right
        }

        if leftLevel == rightLevel {
            return 1 << leftLevel - 1 // 2^n - 1
        }

        return 1 + countNodes(root.left) + countNodes(root.right)
    }
}
