/*
 Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).

 The binary search tree is guaranteed to have unique values.

 Example 1:

 Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
 Output: 32

 Example 2:

 Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
 Output: 23

 Note:

 1.The number of nodes in the tree is at most 10000.
 2.The final answer is guaranteed to be less than 2^31.
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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard let root = root else { return 0 }
        var result = 0
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            if root.val >= L && root.val <= R {
                result = result + root.val
            }
            if L < root.val {
                dfs(root.left)
            }

            if root.val < R {
                dfs(root.right)
            }
        }
        dfs(root)
        return result
    }
}
