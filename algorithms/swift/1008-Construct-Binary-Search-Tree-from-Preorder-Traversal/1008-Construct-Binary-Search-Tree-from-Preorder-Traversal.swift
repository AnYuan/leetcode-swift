/*
1008. Construct Binary Search Tree from Preorder Traversal

Return the root node of a binary search tree that matches the given preorder traversal.

(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

 
Example 1:

Input: [8,5,1,7,10,12]
Output: [8,5,10,1,7,null,12]

 

Note: 

1. 1 <= preorder.length <= 100
2. The values of preorder are distinct.

https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard let tv = preorder.first else { return nil }
        let t = TreeNode(tv)
        let i = preorder.firstIndex(where: { $0 > tv }) ?? preorder.count
        t.left = bstFromPreorder(Array(preorder[1..<i]))
        t.right = bstFromPreorder(Array(preorder[i...]))
        return t
    }
}