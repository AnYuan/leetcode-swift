/*
333. Largest BST Subtree

Given a binary tree, find the largest subtree which is a Binary Search Tree (BST), where largest means subtree with largest number of nodes in it.

Note:
A subtree must include all of its descendants.

Example:

Input: [10,5,15,1,8,null,7]

   10 
   / \ 
  5  15 
 / \   \ 
1   8   7

Output: 3
Explanation: The Largest BST Subtree in this case is the highlighted one.
             The return value is the subtree's size, which is 3.

Follow up:
Can you figure out ways to solve it with O(n) time complexity?

https://leetcode.com/problems/largest-bst-subtree/
https://leetcode.com/problems/largest-bst-subtree/discuss/78899/Very-Short-Simple-Java-O(N)-Solution
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
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        let result = dfs(root)
        return result.2
    }
    
    // (min, max, largest BST in its subtree)
    func dfs(_ node: TreeNode?) -> (Int, Int, Int) {
        guard let node = node else { return (Int.max, Int.min, 0) }
        let left = dfs(node.left)
        let right = dfs(node.right)
        // valid bst
        if node.val > left.1, node.val < right.0 {
            return (min(node.val, left.0), max(node.val, right.1), left.2 + right.2 + 1)
        }
        return (Int.min, Int.max, max(left.2, right.2))
    }
}