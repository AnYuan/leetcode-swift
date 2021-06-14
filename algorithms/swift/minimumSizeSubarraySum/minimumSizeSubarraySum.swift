/*
 209. Minimum Size Subarray Sum

 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

 Example:

 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 Follow up:
 If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).


 */

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var result = Int.max
        var sum = 0
        var left = 0
        for i in nums.indices {
            sum += nums[i]
            while sum >= s {
                // i + 1 - left is the size of current subarray
                result = min(result, i+1-left)
                sum -= nums[left]
                left += 1
            }
        }
        return result != Int.max ? result : 0
    }
}
