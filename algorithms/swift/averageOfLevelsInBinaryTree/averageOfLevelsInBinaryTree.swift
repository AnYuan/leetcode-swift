/*
 637. Average of Levels in Binary Tree

 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:
 Input:
    3
   / \
  9  20
    /  \
   15   7
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].

 Note:
 1.The range of node's value is in the range of 32-bit signed integer.


 https://leetcode.com/problems/average-of-levels-in-binary-tree/
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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }

        var result = [Double]()
        var queue = [root]

        while !queue.isEmpty {
            let count = queue.count
            var sum = 0
            for _ in 0..<count {
                let node = queue.removeFirst()
                sum += node.val
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            let avarage = Double(sum) / Double(count)
            result.append(avarage)
        }

        return result
    }
}
