/*
958. Check Completeness of a Binary Tree
Given a binary tree, determine if it is a complete binary tree.

Definition of a complete binary tree from Wikipedia:
In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 

Example 1:

Input: [1,2,3,4,5,6]
Output: true
Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.

Example 2:

Input: [1,2,3,4,5,null,7]
Output: false
Explanation: The node with value 7 isn't as far left as possible.

 

Note:

    The tree will have between 1 and 100 nodes.

https://leetcode.com/problems/check-completeness-of-a-binary-tree/
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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        // if there is a null node which is not the last node, it is not completeness
        // otherwise, it is a completeness binary tree
        var queue = [TreeNode?]()
        queue.append(root)
        var finish = false
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node == nil {
                finish = true
            } else {
                if finish { return false }
                queue.append(node?.left)
                queue.append(node?.right)
            }
        }
        return true
    }
}