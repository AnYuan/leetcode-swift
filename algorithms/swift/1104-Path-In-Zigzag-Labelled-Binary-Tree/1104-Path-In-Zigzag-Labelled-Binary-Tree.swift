/*
1104. Path In Zigzag Labelled Binary Tree

In an infinite binary tree where every node has two children, the nodes are labelled in row order.

In the odd numbered rows (ie., the first, third, fifth,...), the labelling is left to right, while in the even numbered rows (second, fourth, sixth,...), the labelling is right to left.

Given the label of a node in this tree, return the labels in the path from the root of the tree to the node with that label.

 

Example 1:

Input: label = 14
Output: [1,3,4,14]

Example 2:

Input: label = 26
Output: [1,2,6,10,26]

 

Constraints:

    1 <= label <= 10^6

https://leetcode.com/problems/path-in-zigzag-labelled-binary-tree/
https://leetcode.com/problems/path-in-zigzag-labelled-binary-tree/discuss/324011/Python-O(logn)-time-and-space-with-readable-code-and-step-by-step-explanation
*/
class Solution {
    func pathInZigZagTree(_ label: Int) -> [Int] {
        var result = [label]
        var level = 0
        var maxNum = 1
        while maxNum < label {
            level += 1
            maxNum += Int(pow(Double(2), Double(level)))
        }
        
        var current = label
        while current != 1 {
            // parent = (max + min - current) / 2
            let minNum = maxNum - Int(pow(Double(2), Double(level))) + 1
            var parent = (maxNum + minNum - current) / 2
            result.insert(parent, at: 0)
            current = parent
            // parent level maxNum
            maxNum -= Int(pow(Double(2), Double(level)))
            level -= 1
        }
        return result
    }
}