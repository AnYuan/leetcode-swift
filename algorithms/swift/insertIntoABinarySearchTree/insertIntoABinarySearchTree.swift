/*
 Given the root node of a binary search tree (BST) and a value to be inserted into the tree, insert the value into the BST. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

 Note that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

 For example,

 Given the tree:
  4
 / \
 2   7
 / \
 1   3
 And the value to insert: 5

 You can return this binary search tree:

   4
 /   \
 2     7
 / \   /
 1   3 5

 This tree is also valid:

   5
 /   \
 2     7
 / \   
 1   3
 \
 4
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else { return TreeNode(val) }
        if val < node.val {
            node.left = insertIntoBST(node.left, val)
        } else {
            node.right = insertIntoBST(node.right, val)
        }
        return node
    }
}
