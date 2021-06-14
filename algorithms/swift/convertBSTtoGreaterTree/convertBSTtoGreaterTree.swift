/*
 538. Convert BST to Greater Tree

 Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.

 Example:

 Input: The root of a Binary Search Tree like this:
    5
  /   \
 2     13

 Output: The root of a Greater Tree like this:
    18
   /   \
 20     13


 https://leetcode.com/problems/convert-bst-to-greater-tree/
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
    private var sum = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        convertBST(root.right)
        sum += root.val
        root.val = sum
        convertBST(root.left)
        return root
    }
}
