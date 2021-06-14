/*
1026. Maximum Difference Between Node and Ancestor

Given the root of a binary tree, find the maximum value V for which there exists different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.

(A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.)

 

Example 1:

Input: [8,3,10,1,6,null,14,null,null,4,7,13]
Output: 7
Explanation: 
We have various ancestor-node differences, some of which are given below :
|8 - 3| = 5
|3 - 7| = 4
|8 - 1| = 7
|10 - 13| = 3
Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.

 

Note:

    The number of nodes in the tree is between 2 and 5000.
    Each node will have value between 0 and 100000.

https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
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
    var result = Int.min
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        //preorder
        guard let root = root else { return 0 }
        dfs(root.left, root.val, root.val)   
        dfs(root.right, root.val, root.val)
        return result
    }
    
    func dfs(_ node: TreeNode?, _ maxVal: Int, _ minVal: Int) {
        guard let node = node else { return }    
        
        result = max(abs(node.val - maxVal), result)
        result = max(abs(node.val - minVal), result)
        
        let mav = max(node.val, maxVal)
        let miv = min(node.val, minVal)
        
        dfs(node.left, mav, miv)
        dfs(node.right, mav, miv)
    }
}