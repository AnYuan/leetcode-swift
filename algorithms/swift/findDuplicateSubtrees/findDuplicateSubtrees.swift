/*
 652. Find Duplicate Subtrees

 Given a binary tree, return all duplicate subtrees. For each kind of duplicate subtrees, you only need to return the root node of any one of them.

 Two trees are duplicate if they have the same structure with same node values.

 Example 1:

      1
     / \
    2   3
   /   / \
  4   2   4
 /
4
 The following are two duplicate subtrees:

  2
 /
4
 and

4
 Therefore, you need to return above trees' root in the form of a list.

 https://leetcode.com/problems/find-duplicate-subtrees/
 https://www.youtube.com/watch?v=LYU3y0-59_k
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
    var map = [String: Int]()
    var ans = [TreeNode?]()

    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {

        _ = serialize(root)
        return ans
    }

    private func serialize(_ node: TreeNode?) -> String {
        var rootString = ""
        guard let root = node else {
            rootString = "#"
            return rootString
        }
        rootString.append(String(root.val))
        rootString.append(serialize(root.left))
        rootString.append(serialize(root.right))
        map[rootString] = (map[rootString] ?? 0) + 1
        if map[rootString] == 2 {
            ans.append(root)
        }
        return rootString
    }
}
