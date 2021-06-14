/*
 103. Binary Tree Zigzag Level Order Traversal

 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its zigzag level order traversal as:
 [
 [3],
 [20,9],
 [15,7]
 ]

 https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {

        var result = [[Int]]()
        guard let root = root else { return result }
        var queue = [root]
        var isLeft = true
        while !queue.isEmpty {
            let count = queue.count
            var tmp = [Int]()
            for i in 0..<count {
                let current = queue.removeFirst()
                isLeft ? tmp.insert(current.val, at: 0) : tmp.append(current.val)

                if let right = current.right {
                    queue.append(right)
                }

                if let left = current.left {
                    queue.append(left)
                }
            }
            result.append(tmp)
            isLeft.toggle()
        }
        return result
    }
}
