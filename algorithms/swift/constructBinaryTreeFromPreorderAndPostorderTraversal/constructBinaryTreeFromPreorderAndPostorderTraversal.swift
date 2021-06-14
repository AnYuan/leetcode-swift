/*
 889. Construct Binary Tree from Preorder and Postorder Traversal

 Return any binary tree that matches the given preorder and postorder traversals.

 Values in the traversals pre and post are distinct positive integers.

 Example 1:

 Input: pre = [1,2,4,5,3,6,7], post = [4,5,2,6,7,3,1]
 Output: [1,2,3,4,5,6,7]

 Note:

 * 1 <= pre.length == post.length <= 30
 * pre[] and post[] are both permutations of 1, 2, ..., pre.length.
 * It is guaranteed an answer exists. If there exists multiple answers, you can return any of them.


 https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
 https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/discuss/161268/C%2B%2BJavaPython-One-Pass-Real-O(N)

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
    var preIndex = 0
    var postIndex = 0
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        let root = TreeNode(pre[preIndex])
        preIndex += 1
        //since root node will be lastly iterated in post order
        if root.val != post[postIndex] {
            root.left = constructFromPrePost(pre, post)
        }
        if root.val != post[postIndex] {
            root.right = constructFromPrePost(pre, post)
        }
        postIndex += 1
        return root
    }
}
