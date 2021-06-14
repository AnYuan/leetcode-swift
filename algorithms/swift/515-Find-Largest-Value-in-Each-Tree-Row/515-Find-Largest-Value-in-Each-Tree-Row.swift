/*
515. Find Largest Value in Each Tree Row

You need to find the largest value in each row of a binary tree.

Example:

Input: 

          1
         / \
        3   2
       / \   \  
      5   3   9 

Output: [1, 3, 9]

https://leetcode.com/problems/find-largest-value-in-each-tree-row/
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [root]
        var result = [Int]()
        while !queue.isEmpty {
            let count = queue.count
            var lMax = Int.min
            for _ in 0..<count {
                let node = queue.removeFirst()
                lMax = max(lMax, node.val) 
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(lMax)
        }
        return result
    }
}