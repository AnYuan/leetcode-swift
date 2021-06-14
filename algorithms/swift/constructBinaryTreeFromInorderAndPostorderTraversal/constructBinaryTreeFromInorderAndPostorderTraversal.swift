/*
 106. Construct Binary Tree from Inorder and Postorder Traversal

 Given inorder and postorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
 Return the following binary tree:

  3
 / \
 9  20
 /  \
 15   7

 https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return helper(0, inorder.count - 1, 0, postorder.count - 1, inorder, postorder)
    }

    private func helper(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int, 
                        _ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard postStart <= postEnd else {
            return nil
        }

        let root = TreeNode(postorder[postEnd])
        let inIndex = inorder.firstIndex(of: root.val)!

        root.left = helper(inStart, inIndex - 1, postStart, postStart + inIndex - inStart - 1, inorder, postorder)
        root.right = helper(inIndex + 1, inEnd, postEnd - inEnd + inIndex, postEnd - 1, inorder, postorder)

        return root
    }
}
