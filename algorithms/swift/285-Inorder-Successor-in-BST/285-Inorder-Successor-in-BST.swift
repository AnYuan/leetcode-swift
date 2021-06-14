/*
285. Inorder Successor in BST

Given a binary search tree and a node in it, find the in-order successor of that node in the BST.

The successor of a node p is the node with the smallest key greater than p.val.

 

Example 1:

Input: root = [2,1,3], p = 1
Output: 2
Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.

Example 2:

Input: root = [5,3,6,2,4,null,null,1], p = 6
Output: null
Explanation: There is no in-order successor of the current node, so the answer is null.

 

Note:

    If the given node has no in-order successor in the tree, return null.
    It's guaranteed that the values of the tree are unique.

https://leetcode.com/problems/inorder-successor-in-bst/
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
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p else { return nil }    
        var current: TreeNode? = root
        var result: TreeNode? = nil
        while current != nil {
            if current!.val > p.val {
                result = current
                current = current?.left
            } else {
                current = current?.right
            }
        }
        return result
    }
}