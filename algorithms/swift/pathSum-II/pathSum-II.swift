/*
 113. Path Sum II

 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1

 Return:

 [
  [5,4,11,2],
  [5,8,4,5]
 ]

 https://leetcode.com/problems/path-sum-ii/
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
    
    var result = [[Int]]()
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        dfs(root, [Int]())
        return result.filter { $0.reduce(0, +) == sum }
    }
    
    private func dfs(_ node: TreeNode?, _ path: [Int]) {
        guard let node = node else { return }
        var path = path
        if node.left == nil, node.right == nil {
            path.append(node.val)
            result.append(path)
            return
        }
        
        path.append(node.val)
        dfs(node.left, path)
        dfs(node.right, path)
    }
}
