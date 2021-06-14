/*
 270. Closest Binary Search Tree Value

 Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.

 Note:

 Given target value is a floating point.
 You are guaranteed to have only one unique value in the BST that is closest to the target.
 Example:

 Input: root = [4,2,5,1,3], target = 3.714286

    4
   / \
  2   5
 / \
1   3

 Output: 4

 https://leetcode.com/problems/closest-binary-search-tree-value/

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
    var inorder = [Int]()
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        helper(root)
        var diff = Double(Int.max)
        var result = 0
        for i in inorder {
            let df = abs(target - Double(i))
            if diff > df {
                diff = df
                result = i
            }
        }
        return result
    }

    private func helper(_ root: TreeNode?) {
        guard let root = root else { return }
        helper(root.left)
        inorder.append(root.val)
        helper(root.right)
    }
}
