/*
487. Max Consecutive Ones II

 Given a binary array, find the maximum number of consecutive 1s in this array if you can flip at most one 0.

Example 1:

Input: [1,0,1,1,0]
Output: 4
Explanation: Flip the first zero will get the the maximum number of consecutive 1s.
    After flipping, the maximum number of consecutive 1s is 4.

Note:

    The input array will only contain 0 and 1.
    The length of input array is a positive integer and will not exceed 10,000

Follow up:
What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently? 

https://leetcode.com/problems/max-consecutive-ones-ii/
*/
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var result = 0
        var zeroCount = 0
        let n = nums.count
        while right < n {
            if nums[right] == 0 {
                zeroCount += 1
            }
            while zeroCount > 1 {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            result = max(result, right - left + 1)
            right += 1
        }
        return result
    }
}