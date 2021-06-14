/*
993. Cousins in Binary Tree

In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

Return true if and only if the nodes corresponding to the values x and y are cousins.

 

Example 1:

Input: root = [1,2,3,4], x = 4, y = 3
Output: false

Example 2:

Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
Output: true

Example 3:

Input: root = [1,2,3,null,4], x = 2, y = 3
Output: false

 

Note:

    The number of nodes in the tree will be between 2 and 100.
    Each node has a unique integer value from 1 to 100.

https://leetcode.com/problems/cousins-in-binary-tree/
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var dict = [Int: (Int, Int)]() // node value : (depth, parent value)
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        dfs(root, 0, 0)
        let p0 = dict[x]!
        let p1 = dict[y]!
        return p0.0 == p1.0 && p0.1 != p1.1 // dpeth is the same, parent is not the same
    }
    func dfs(_ node: TreeNode?, _ depth: Int, _ parent: Int) {
        guard let node = node else { return }
        dict[node.val] = (depth, parent)
        dfs(node.left, depth+1, node.val)
        dfs(node.right, depth+1, node.val)
    }
}