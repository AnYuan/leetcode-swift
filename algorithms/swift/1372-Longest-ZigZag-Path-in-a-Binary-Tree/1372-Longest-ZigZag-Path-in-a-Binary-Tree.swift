/*
1372. Longest ZigZag Path in a Binary Tree

Given a binary tree root, a ZigZag path for a binary tree is defined as follow:

    Choose any node in the binary tree and a direction (right or left).
    If the current direction is right then move to the right child of the current node otherwise move to the left child.
    Change the direction from right to left or right to left.
    Repeat the second and third step until you can't move in the tree.

Zigzag length is defined as the number of nodes visited - 1. (A single node has a length of 0).

Return the longest ZigZag path contained in that tree.

 

Example 1:

Input: root = [1,null,1,1,1,null,null,1,1,null,1,null,null,null,1,null,1]
Output: 3
Explanation: Longest ZigZag path in blue nodes (right -> left -> right).

Example 2:

Input: root = [1,1,1,null,1,null,null,1,1,null,1]
Output: 4
Explanation: Longest ZigZag path in blue nodes (left -> right -> left -> right).

Example 3:

Input: root = [1]
Output: 0

 

Constraints:

    Each tree has at most 50000 nodes..
    Each node's value is between [1, 100].

https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/
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
    var result = 0
    func longestZigZag(_ root: TreeNode?) -> Int {
        dfs(root?.left, 0, true)    
        dfs(root?.right, 0, false)
        return result
    }
    
    func dfs(_ node: TreeNode?, _ count: Int, _ fromLeft: Bool) {
                
        guard let node = node else { 
            result = max(result, count)
            return 
        }    
        
        var count = count + 1

        if fromLeft == true {
            dfs(node.right, count, false)
            dfs(node.left, 0, true)
            
        }
        if fromLeft == false {
            dfs(node.left, count, true)
            dfs(node.right, 0, false)
        }
    }
}