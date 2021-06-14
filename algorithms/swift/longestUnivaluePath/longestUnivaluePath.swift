/*
687. Longest Univalue Path

Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.

The length of path between two nodes is represented by the number of edges between them.

Example 1:

Input:

              5
             / \
            4   5
           / \   \
          1   1   5
Output: 2


Example 2:

Input:

              1
             / \
            4   5
           / \   \
          4   4   5
Output: 2 

Note: The given binary tree has not more than 10000 nodes. The height of the tree is not more than 1000.

https://leetcode.com/problems/longest-univalue-path/
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
    var result = 0
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        helper(root)    
        return result
    }
    
    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = helper(root.left)
        let right = helper(root.right)
        var lleft = 0
        var lright = 0
        if root.left != nil, root.left?.val == root.val {
            lleft += left + 1
        }
        if root.right != nil, root.right?.val == root.val {
            lright += right + 1
        }
        result = max(result, lleft + lright)
        return max(lleft, lright)
    }
}