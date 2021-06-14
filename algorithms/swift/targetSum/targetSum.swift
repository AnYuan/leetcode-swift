/*
 You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

Find out how many ways to assign symbols to make sum of integers equal to target S.

Example 1:

Input: nums is [1, 1, 1, 1, 1], S is 3. 
Output: 5
Explanation: 

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3

There are 5 ways to assign symbols to make the sum of nums be target 3.

Note:

    The length of the given array is positive and will not exceed 20.
    The sum of elements in the given array will not exceed 1000.
    Your output answer is guaranteed to be fitted in a 32-bit integer.

https://leetcode.com/problems/target-sum/
*/
class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var memo = [[Int]](repeating: [Int](repeating: Int.min, count: 2001), count: nums.count)
        return helper(nums, 0, 0, S, &memo)
    }

    func helper(_ nums: [Int], _ i: Int, _ sum: Int, _ target: Int, _ memo: inout [[Int]]) -> Int {
        if nums.count == i {
            if sum == target {
                return 1
            } else {
                return 0
            }
        } else {
            if memo[i][sum+1000] != Int.min {
                return memo[i][sum+1000]
            }
            let add = helper(nums, i + 1, sum - nums[i], target, &memo)
            let subtract = helper(nums, i + 1, sum + nums[i], target, &memo)
            memo[i][sum+1000] = add + subtract
            return memo[i][sum+1000]
        }
    }
}