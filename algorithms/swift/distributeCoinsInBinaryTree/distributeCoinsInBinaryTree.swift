/*
 979. Distribute Coins in Binary Tree

 Given the root of a binary tree with N nodes, each node in the tree has node.val coins, and there are N coins total.

 In one move, we may choose two adjacent nodes and move one coin from one node to another.  (The move may be from parent to child, or from child to parent.)

 Return the number of moves required to make every node have exactly one coin.


 Input: [3,0,0]
 Output: 2
 Explanation: From the root of the tree, we move one coin to its left child, and one coin to its right child.


 Input: [0,3,0]
 Output: 3
 Explanation: From the left child of the root, we move two coins to the root [taking two moves].  Then, we move one coin from the root of the tree to the right child.

 Input: [1,0,2]
 Output: 2

 Input: [1,0,0,null,3]
 Output: 4


 Note:

 * 1<= N <= 100
 * 0 <= node.val <= N

 https://leetcode.com/problems/distribute-coins-in-binary-tree/

 https://leetcode.com/problems/distribute-coins-in-binary-tree/discuss/221939/C%2B%2B-with-picture-post-order-traversal
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
    func distributeCoins(_ root: TreeNode?) -> Int {
        dfs(root)
        return result
    }

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = dfs(root.left)
        let right = dfs(root.right)
        result += abs(left) + abs(right)
        return root.val + left + right - 1 // keep one coin for the root
    }
}
