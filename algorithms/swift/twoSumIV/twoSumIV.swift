/*
 653. Two Sum IV - Input is a BST

 Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

 Example 1:

 Input:
      5
     / \
    3   6
   / \   \
  2   4   7

 Target = 9

 Output: True


 Example 2:

 Input:
      5
     / \
    3   6
   / \   \
  2   4   7

 Target = 28

 Output: False

 https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
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

    var inorder = [Int]()

    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {

        helper(root)

        guard !inorder.isEmpty else {
            return false
        }

        var left = 0
        var right = inorder.count - 1

        while left < right {

            let sum = inorder[left] + inorder[right]
            if sum == k {
                return true
            } else if sum < k {
                left += 1
            } else {
                right -= 1
            }
        }
        return false
    }

    private func helper(_ root: TreeNode?) {
        guard let root = root else {
            return
        }

        helper(root.left)
        inorder.append(root.val)
        helper(root.right)
    }
}
