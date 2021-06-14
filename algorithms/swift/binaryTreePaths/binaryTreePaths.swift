/*
 257. Binary Tree Paths

 Given a binary tree, return all root-to-leaf paths.

 Note: A leaf is a node with no children.

 Example:

 Input:

    1
  /   \
 2     3
 \
  5

 Output: ["1->2->5", "1->3"]

 Explanation: All root-to-leaf paths are: 1->2->5, 1->3

 https://leetcode.com/problems/binary-tree-paths/
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

    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [String]()
        var stack = [String]()
        dfs(root, &stack, &result)
        return result
    }

    func dfs(_ root: TreeNode?, _ stack: inout [String], _ result: inout [String]) {
        guard let root = root else { return }
        stack.append(String(root.val))
        if root.left == nil, root.right == nil {
            result.append(stack.joined(separator: "->"))
        }
        dfs(root.left, &stack, &result)
        dfs(root.right, &stack, &result)
        stack.removeLast()
    }
}
