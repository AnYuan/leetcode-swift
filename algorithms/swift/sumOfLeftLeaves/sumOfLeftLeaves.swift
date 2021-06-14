/*
 404. Sum of Left Leaves

 Find the sum of all left leaves in a given binary tree.

 Example:

    3
   / \
  9  20
 / \
15  7

 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

 https://leetcode.com/problems/sum-of-left-leaves/
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        traverse(root)
        return result
    }
    private func traverse(_ root: TreeNode?) {
        guard let root = root else { return }
        if let left = root.left {
            if left.left == nil, left.right == nil {
                result += left.val
            }
            traverse(left)
        }
        if let right = root.right {
            traverse(right)
        }
    }
}
