/*
1339. Maximum Product of Splitted Binary Tree

Given a binary tree root. Split the binary tree into two subtrees by removing 1 edge such that the product of the sums of the subtrees are maximized.

Since the answer may be too large, return it modulo 10^9 + 7.

 

Example 1:

Input: root = [1,2,3,4,5,6]
Output: 110
Explanation: Remove the red edge and get 2 binary trees with sum 11 and 10. Their product is 110 (11*10)

Example 2:

Input: root = [1,null,2,3,4,null,null,5,6]
Output: 90
Explanation:  Remove the red edge and get 2 binary trees with sum 15 and 6.Their product is 90 (15*6)

Example 3:

Input: root = [2,3,9,10,7,8,6,5,4,11,1]
Output: 1025

Example 4:

Input: root = [1,1]
Output: 1

 

Constraints:

    Each tree has at most 50000 nodes and at least 2 nodes.
    Each node's value is between [1, 10000].

https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/
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
    var set = Set<Int>()
    func maxProduct(_ root: TreeNode?) -> Int {
        let sum = dfs(root)
        set.forEach { result = max(result, (sum - $0) * $0) }
        return result % 1000000007
    }
    
    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }    
        var s = 0
        s += dfs(node.left)
        s += dfs(node.right)
        node.val += s
        set.insert(node.val)
        return node.val
    }
}