/*
508. Most Frequent Subtree Sum

 Given the root of a tree, you are asked to find the most frequent subtree sum. The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself). So what is the most frequent subtree sum value? If there is a tie, return all the values with the highest frequency in any order.

Examples 1
Input:

  5
 /  \
2   -3

return [2, -3, 4], since all the values happen only once, return all of them in any order.

Examples 2
Input:

  5
 /  \
2   -5

return [2], since 2 happens twice, however -5 only occur once.

Note: You may assume the sum of values in any subtree is in the range of 32-bit signed integer. 

https://leetcode.com/problems/most-frequent-subtree-sum/
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
    var result = [Int: Int]() // sum : count
    var maxCount = 0
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }        
        sum(root)
        return result.filter { (_, count) in
            count == maxCount
        }.map { (sum, _) in
            sum
        }
    }
    
    func sum(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }    
        let value = node.val + sum(node.left) + sum(node.right)
        let count = result[value, default: 0] + 1
        result[value] = count
        maxCount = max(maxCount, count)
        return value
    }
}