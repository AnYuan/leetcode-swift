/*
 606. Construct String from Binary Tree

 You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.

 The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.

 Example 1:
 Input: Binary tree: [1,2,3,4]
      1
    /   \
   2     3
  /
 4

 Output: "1(2(4))(3)"

 Explanation: Originallay it needs to be "1(2(4)())(3()())",
 but you need to omit all the unnecessary empty parenthesis pairs.
 And it will be "1(2(4))(3)".
 Example 2:
 Input: Binary tree: [1,2,3,null,4]
     1
   /   \
  2     3
  \
   4

 Output: "1(2()(4))(3)"

 Explanation: Almost the same as the first example,
 except we can't omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.

 https://leetcode.com/problems/construct-string-from-binary-tree/
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
    var result = ""
    func tree2str(_ t: TreeNode?) -> String {
        traverse(t)
        return result
    }

    private func traverse(_ t: TreeNode?) {
        guard let t = t else { return }

        if t.left == nil, t.right == nil {
            result.append(String(t.val))
            return
        }
        result.append(String(t.val))
        result.append("(")
        if let left = t.left {
            traverse(left)
        }
        result.append(")")
        if let right = t.right {
            result.append("(")
            traverse(right)
            result.append(")")
        }
    }
}
