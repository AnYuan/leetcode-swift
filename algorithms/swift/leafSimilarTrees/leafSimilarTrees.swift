/*
 872. Leaf-Similar Trees

 Consider all the leaves of a binary tree.  From left to right order, the values of those leaves form a leaf value sequence.

 For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).

 Two binary trees are considered leaf-similar if their leaf value sequence is the same.

 Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.


 Note:

 * Both of the given trees will have between 1 and 100 nodes.
 https://leetcode.com/problems/leaf-similar-trees/
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
    var leaf1 = [Int]()
    var leaf2 = [Int]()
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        dfs(root1, &leaf1)
        dfs(root2, &leaf2)
        return leaf1 == leaf2
    }

    private func dfs(_ root: TreeNode?, _ leaf: inout [Int]) {
        guard let root = root else { return }
        if root.left == nil, root.right == nil {
            leaf.append(root.val)
        }
        dfs(root.left, &leaf)
        dfs(root.right, &leaf)
    }
}
