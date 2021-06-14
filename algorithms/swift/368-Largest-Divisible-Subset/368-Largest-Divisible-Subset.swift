/*
368. Largest Divisible Subset

Given a set of distinct positive integers, find the largest subset such that every pair (Si, Sj) of elements in this subset satisfies:

Si % Sj = 0 or Sj % Si = 0.

If there are multiple solutions, return any subset is fine.

Example 1:

Input: [1,2,3]
Output: [1,2] (of course, [1,3] will also be ok)

Example 2:

Input: [1,2,4,8]
Output: [1,2,4,8]

https://leetcode.com/problems/largest-divisible-subset/
*/
class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        // Every element is divisible by itself so largest divisible subset would be minimum of 1. Hence initializing the dp array with value 1
        var dp = [Int](repeating: 1, count: nums.count)
        let nums = nums.sorted()
        var result: [Int] = []
        var max = 1
        
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] % nums[j] == 0 && dp[i] <= dp[j] {
                    dp[i] = 1 + dp[j]
                    if dp[i] > max {
                        max = dp[i]
                    }
                }
            }
        }
        
        var prev = -1
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if dp[i] == max && (prev % nums[i] == 0 || prev == -1) {
                result.append(nums[i])
                max -= 1
                prev = nums[i]
            }
        }
        return result
    }