/*
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 * The left subtree of a node contains only nodes with keys less than the node's key.
 * The right subtree of a node contains only nodes with keys greater than the node's key.
 * Both the left and right subtrees must also be binary search trees.

 https://leetcode.com/problems/validate-binary-search-tree/

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
    func isValidBST(_ root: TreeNode?) -> Bool {
       return isBST(root, Int.min, Int.max)
    }
    
    private func isBST(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
	    guard let node = node else { return true }
	    if node.val <= min || node.val >= max { return false }
	    return isBST(node.left, min, node.val) &&
		       isBST(node.right, node.val, max)
    }
}
