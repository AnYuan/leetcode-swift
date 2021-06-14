/*
1123. Lowest Common Ancestor of Deepest Leaves

Given a rooted binary tree, return the lowest common ancestor of its deepest leaves.

Recall that:

    The node of a binary tree is a leaf if and only if it has no children
    The depth of the root of the tree is 0, and if the depth of a node is d, the depth of each of its children is d+1.
    The lowest common ancestor of a set S of nodes is the node A with the largest depth such that every node in S is in the subtree with root A.

 

Example 1:

Input: root = [1,2,3]
Output: [1,2,3]
Explanation: 
The deepest leaves are the nodes with values 2 and 3.
The lowest common ancestor of these leaves is the node with value 1.
The answer returned is a TreeNode object (not an array) with serialization "[1,2,3]".

Example 2:

Input: root = [1,2,3,4]
Output: [4]

Example 3:

Input: root = [1,2,3,4,5]
Output: [2,4,5]

 

Constraints:

    The given tree will have between 1 and 1000 nodes.
    Each node of the tree will have a distinct value between 1 and 1000.

https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/
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
    var result: TreeNode?
    var deepest = 0
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        dfs(root,0)
        return result
    }
    
    func dfs(_ node: TreeNode?, _ level: Int) -> Int {
        deepest = max(level, deepest)
        guard let node = node else {
            return level
        }
        let left = dfs(node.left, level+1)
        let right = dfs(node.right, level+1)
        if left == deepest, right == deepest {
            result = node
        }
        return max(left, right)
    }
}