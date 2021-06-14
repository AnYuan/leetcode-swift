/*
325. Maximum Size Subarray Sum Equals k

Given an array nums and a target value k, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.

Note:
The sum of the entire nums array is guaranteed to fit within the 32-bit signed integer range.

Example 1:

Input: nums = [1, -1, 5, -2, 3], k = 3
Output: 4 
Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.

Example 2:

Input: nums = [-2, -1, 2, 1], k = 1
Output: 2 
Explanation: The subarray [-1, 2] sums to 1 and is the longest.

Follow Up:
Can you do it in O(n) time?

https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/
https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/discuss/77784/O(n)-super-clean-9-line-Java-solution-with-HashMap
*/
class Solution {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var length = 0
        var dict = [Int: Int]() //sum : index
        for i in 0..<nums.count {
            sum += nums[i]
            if sum == k {
                length = i + 1
            } else if let index = dict[sum - k] {
                length = max(length, i - index)
            }
            if dict[sum] == nil {
                dict[sum] = i
            }
        }
        return length
    }
}
