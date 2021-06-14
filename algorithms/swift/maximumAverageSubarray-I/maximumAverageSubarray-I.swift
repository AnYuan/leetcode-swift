/*
 643. Maximum Average Subarray I

 Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.

 Example 1:

 Input: [1,12,-5,-6,50,3], k = 4
 Output: 12.75
 Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75


 Note:

1. 1 <= k <= n <= 30,000.
2. Elements of the given array will be in the range [-10,000, 10,000].

https://leetcode.com/problems/maximum-average-subarray-i/
 */
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard nums.count >= k else { return 0.0 }

        var total = 0
        for i in 0..<k {
            total += nums[i]
        }
        var result = total
        for i in k..<nums.count {
            total += nums[i] - nums[i-k]
            result = max(result, total)
        }

        return Double(result) / Double(k)
    }
}
