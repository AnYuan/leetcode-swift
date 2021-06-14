/*
Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted array: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5

 https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
*/
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        let n = nums.count
        let root = TreeNode(nums[n/2]) // mid
        root.left = sortedArrayToBST(Array(nums[0..<n/2]))
        root.right = sortedArrayToBST(Array(nums[((n/2) + 1)..<n]))
        return root
    }
}