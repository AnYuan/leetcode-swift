/*
1120. Maximum Average Subtree

Given the root of a binary tree, find the maximum average value of any subtree of that tree.

(A subtree of a tree is any node of that tree plus all its descendants. The average value of a tree is the sum of its values, divided by the number of nodes.)

 

Example 1:

Input: [5,6,1]
Output: 6.00000
Explanation: 
For the node with value = 5 we have an average of (5 + 6 + 1) / 3 = 4.
For the node with value = 6 we have an average of 6 / 1 = 6.
For the node with value = 1 we have an average of 1 / 1 = 1.
So the answer is 6 which is the maximum.

 

Note:

    The number of nodes in the tree is between 1 and 5000.
    Each node will have a value between 0 and 100000.
    Answers will be accepted as correct if they are within 10^-5 of the correct answer.

https://leetcode.com/problems/maximum-average-subtree/
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var maxAvg: Double = 0.0
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        dfs(root)    
        return maxAvg
    }
    
    // return subtreee sum and node count
    func dfs(_ node: TreeNode?) -> (Int, Int) {
        guard let node = node else { return (0, 0) }
        if node.left == nil, node.right == nil {
            maxAvg = max(Double(node.val), maxAvg)
            return (node.val, 1)
        }
        var sum = node.val
        var count = 1
        if let left = node.left {
            let (leftSum, leftCount) = dfs(left)
            sum += leftSum
            count += leftCount
        }
        
        if let right = node.right {
            let (rightSum, rightCount) = dfs(right)
            sum += rightSum
            count += rightCount
        }
        maxAvg = max(Double(sum)/Double(count), maxAvg)
        return (sum, count)
    }
}