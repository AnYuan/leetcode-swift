/*
 255. Verify Preorder Sequence in Binary Search Tree

 Given an array of numbers, verify whether it is the correct preorder traversal sequence of a binary search tree.

 You may assume each number in the sequence is unique.

 Consider the following binary search tree:

     5
    / \
   2   6
   /    \
  1      3
 Example 1:

 Input: [5,2,6,1,3]
 Output: false
 Example 2:

 Input: [5,2,1,3,6]
 Output: true
 Follow up:
 Could you do it using only constant space complexity?

 https://leetcode.com/problems/verify-preorder-sequence-in-binary-search-tree/
 */
class Solution {
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        var low = Int.min
        var stack = [Int]()
        for i in preorder {
            guard i >= low else { return false }
            while !stack.isEmpty, i > stack.last! {
                low = stack.removeLast()
            }
            stack.append(i)
        }
        return true
    }
}
