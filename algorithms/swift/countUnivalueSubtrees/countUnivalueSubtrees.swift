/*
 250. Count Univalue Subtrees

 Given a binary tree, count the number of uni-value subtrees.

 A Uni-value subtree means all nodes of the subtree have the same value.

 Example :

 Input:  root = [5,1,5,5,5,null,5]

     5
    / \
   1   5
  / \   \
 5   5   5

 Output: 4


 https://leetcode.com/problems/count-univalue-subtrees/
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
    var count = 0
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        isUni(root)
        return count
    }

    private func isUni(_ root: TreeNode?) -> Bool {

        guard let root = root else { return true }

        let left = isUni(root.left)
        let right = isUni(root.right)

        if left && right &&
             (root.left == nil || root.val == root.left!.val) &&
             (root.right == nil || root.val == root.right!.val) {
            count += 1
            return true
        }
        return false
    }
}
