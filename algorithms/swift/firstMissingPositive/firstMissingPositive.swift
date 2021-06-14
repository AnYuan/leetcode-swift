/*
41. First Missing Positive

Given an unsorted integer array, find the smallest missing positive integer.

Example 1:

Input: [1,2,0]
Output: 3
Example 2:

Input: [3,4,-1,1]
Output: 2
Example 3:

Input: [7,8,9,11,12]
Output: 1
Note:

Your algorithm should run in O(n) time and uses constant extra space.

https://leetcode.com/problems/first-missing-positive/
https://www.educative.io/courses/grokking-the-coding-interview/R1GXQ071GQ0
*/
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 1 }
        
        var i = 0
        var nums = nums
        
        while i < nums.count {
            if nums[i] > 0 && nums[i] <= nums.count && nums[i] != nums[nums[i] - 1] {
                nums.swapAt(i, nums[i] - 1)
            } else {
                i += 1
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
}