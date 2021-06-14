/*
 485. Max Consecutive Ones

 Given a binary array, find the maximum number of consecutive 1s in this array.

 Example 1:
 Input: [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s.
 The maximum number of consecutive 1s is 3.

 Note:

 * The input array will only contain 0 and 1.
 * The length of input array is a positive integer and will not exceed 10,000

 https://leetcode.com/problems/max-consecutive-ones/
 */
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var result = 0
        var count = 0
        for num in nums {
            if num == 1 {
                count += 1
            } else {
                result = max(result, count)
                count = 0
            }
        }
        return max(result, count)
    }
}
