/*
530. Minimum Absolute Difference in BST

Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.

Example:

Input:

   1
    \
     3
    /
   2

Output:
1

Explanation:
The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
 

Note: There are at least two nodes in this BST.

https://leetcode.com/problems/minimum-absolute-difference-in-bst/
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
    var result = [Int]()
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        inorder(root)
        var minValue = Int.max
        for i in 0..<result.count-1 {
            let first = result[i]
            let second = result[i+1]
            minValue = min(minValue, abs(first - second))
        }
        return minValue
    }
    
    private func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        inorder(node.left)
        result.append(node.val)
        inorder(node.right)
    }
}