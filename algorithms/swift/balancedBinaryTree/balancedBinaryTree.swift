/*
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example 1:

Given the following tree [3,9,20,null,null,15,7]:

    3
   / \
  9  20
    /  \
   15   7
Return true.

Example 2:

Given the following tree [1,2,2,3,3,null,null,4,4]:

       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
Return false.

https://leetcode.com/problems/balanced-binary-tree/
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return helper(root).1
    }
    
    func helper(_ node: TreeNode?) -> (Int, Bool) {
        guard let node = node else { return (0, true) }
        let (lHeight, lIsBanlance) = helper(node.left)
        let (rHeight, rIsBanlance) = helper(node.right)
        return (1 + max(lHeight, rHeight), abs(lHeight - rHeight) <= 1 && lIsBanlance && rIsBanlance)
    }
}