/*
 543. Diameter of Binary Tree

 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 Example:
 Given a binary tree
    1
   / \
  2   3
 / \
4   5
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

 Note: The length of path between two nodes is represented by the number of edges between them.

 https://leetcode.com/problems/diameter-of-binary-tree/
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
    var treeDiameter = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        calculateHeight(root)
        return treeDiameter
    }

    func calculateHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = calculateHeight(root.left)
        let right = calculateHeight(root.right)

        // diameter at the current node will be equal to the height of left subtree +
        // the height of right sub-trees + '1' for the current node, and minus one.
        let diameter = left + right

        // update the global tree diameter
        treeDiameter = max(treeDiameter, diameter)
        // height of the current node will be equal to the maximum of the hights of
        // left or right subtrees plus '1' for the current node
        return 1 + max(left, right)
    }
}