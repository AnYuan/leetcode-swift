/*
549. Binary Tree Longest Consecutive Sequence II

Given a binary tree, you need to find the length of Longest Consecutive Path in Binary Tree.

Especially, this path can be either increasing or decreasing. For example, [1,2,3,4] and [4,3,2,1] are both considered valid, but the path [1,2,4,3] is not valid. On the other hand, the path can be in the child-Parent-child order, where not necessarily be parent-child order.

Example 1:

Input:
        1
       / \
      2   3
Output: 2
Explanation: The longest consecutive path is [1, 2] or [2, 1].

 

Example 2:

Input:
        2
       / \
      1   3
Output: 3
Explanation: The longest consecutive path is [1, 2, 3] or [3, 2, 1].

 

Note: All the values of tree nodes are in the range of [-1e7, 1e7].

https://leetcode.com/problems/binary-tree-longest-consecutive-sequence-ii/
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
    var length = 0
    func longestConsecutive(_ root: TreeNode?) -> Int {
        postorder(root)
        return length
    }
    
    func postorder(_ node: TreeNode?) -> [Int] {
        guard let root = node else { return [0, 0] } // increasing, decreasing
        var result = [1, 1]
        if let left = root.left {
            let l = postorder(left)
            // root -> node is decreasing
            if left.val == root.val - 1 {
                result[1] = l[1] + 1
                //root -> node is increasing
            } else if left.val == root.val + 1 {
                result[0] = l[0] + 1
            }
        }
        if let right = root.right {
            let r = postorder(right)
            // root -> node is decreasing
            if right.val == root.val - 1 {
                result[1] = max(result[1], r[1] + 1)
                // root -> node is increasing
            } else if right.val == root.val + 1 {
                result[0] = max(result[0], r[0] + 1)
            }
        }
        // calculate root twice, so minus 1
        length = max(length, result[0] + result[1] - 1)
        return result
    }
}