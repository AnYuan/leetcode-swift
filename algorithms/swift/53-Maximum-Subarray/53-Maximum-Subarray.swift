/*
 53. Maximum Subarray

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

 https://leetcode.com/problems/maximum-subarray/
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var currMax = nums[0]
        var maxSum = nums[0]
        for i in 1..<nums.count {
            currMax = max(nums[i], nums[i] + currMax)
            maxSum = max(currMax, maxSum)
        }
        return maxSum
    }
}
