/*
 617. Merge Two Binary Trees

 Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.

 You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.

 Example 1:

 Input:
 Tree 1                     Tree 2
     1                         2
    / \                       / \
   3   2                     1   3
  /                           \   \
 5                             4   7
 Output:
 Merged tree:
     3
    / \
   4   5
  / \   \
 5   4   7


 Note: The merging process must start from the root nodes of both trees.

 https://leetcode.com/problems/merge-two-binary-trees/
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
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {

        guard let tt1 = t1, let tt2 = t2 else { return t1 ?? t2 }

        tt1.val = tt1.val + tt2.val
        tt1.left = mergeTrees(tt1.left, tt2.left)
        tt1.right = mergeTrees(tt1.right, tt2.right)
        return tt1
    }
}

