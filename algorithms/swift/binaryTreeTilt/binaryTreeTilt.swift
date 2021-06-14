/*
563. Binary Tree Tilt

Given a binary tree, return the tilt of the whole tree.

The tilt of a tree node is defined as the absolute difference between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.

The tilt of the whole tree is defined as the sum of all nodes' tilt.

Example:
Input: 
         1
       /   \
      2     3
Output: 1
Explanation: 
Tilt of node 2 : 0
Tilt of node 3 : 0
Tilt of node 1 : |2-3| = 1
Tilt of binary tree : 0 + 0 + 1 = 1
Note:

1.The sum of node values in any subtree won't exceed the range of 32-bit integer.
2.All the tilt values won't exceed the range of 32-bit integer.

https://leetcode.com/problems/binary-tree-tilt/
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
    func findTilt(_ root: TreeNode?) -> Int {
        return helper(root).1
    }
    
    private func helper(_ root: TreeNode?) -> (Int, Int) { // (Sum, tilt)
        guard let root = root else { return (0,0) }
        // leaf
        if root.left == nil, root.right == nil {
            return (root.val, 0)
        }
        
        let (sumOfLeft, tiltOfLeft) = helper(root.left)
        let (sumOfRight, tiltOfRight) = helper(root.right)
        
        return (sumOfLeft + sumOfRight + root.val, 
                abs(sumOfLeft - sumOfRight) + tiltOfLeft + tiltOfRight)
    }
}