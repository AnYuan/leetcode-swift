/*
971. Flip Binary Tree To Match Preorder Traversal

Given a binary tree with N nodes, each node has a different value from {1, ..., N}.

A node in this binary tree can be flipped by swapping the left child and the right child of that node.

Consider the sequence of N values reported by a preorder traversal starting from the root.  Call such a sequence of N values the voyage of the tree.

(Recall that a preorder traversal of a node means we report the current node's value, then preorder-traverse the left child, then preorder-traverse the right child.)

Our goal is to flip the least number of nodes in the tree so that the voyage of the tree matches the voyage we are given.

If we can do so, then return a list of the values of all nodes flipped.  You may return the answer in any order.

If we cannot do so, then return the list [-1].

 

Example 1:

Input: root = [1,2], voyage = [2,1]
Output: [-1]

Example 2:

Input: root = [1,2,3], voyage = [1,3,2]
Output: [1]

Example 3:

Input: root = [1,2,3], voyage = [1,2,3]
Output: []

 

Note:

    1 <= N <= 100

https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal/
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
    //using index to indicate current node value in voyage
    var index = 0
    var result = [Int]()
    
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        return dfs(root, voyage) ? result : [-1]
    }
    
    func dfs(_ node: TreeNode?, _ voyage: [Int]) -> Bool {
        guard let node = node else { return true }
        if node.val != voyage[index] { return false }
        index += 1
        if let left = node.left, left.val != voyage[index] {
            result.append(node.val)
            // flip left and right
            return dfs(node.right, voyage) && dfs(node.left, voyage)
        }
        return dfs(node.left, voyage) && dfs(node.right, voyage)
    }
}