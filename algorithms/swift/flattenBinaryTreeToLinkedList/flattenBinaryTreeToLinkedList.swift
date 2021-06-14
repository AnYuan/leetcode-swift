/*
 114. Flatten Binary Tree to Linked List

 Given a binary tree, flatten it to a linked list in-place.

 For example, given the following tree:

     1
    / \
   2   5
  / \   \
 3   4   6
 The flattened tree should look like:

   1
    \
     2
      \
       3
        \
         4
          \
           5
            \
             6

https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
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
    var prev: TreeNode?
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        flatten(root.right)
        flatten(root.left)
        root.left = nil
        root.right = prev
        prev = root
    }

}
