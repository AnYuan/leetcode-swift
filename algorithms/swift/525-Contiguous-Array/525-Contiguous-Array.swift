/*
525. Contiguous Array

Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

Example 1:

Input: [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.

Example 2:

Input: [0,1,0]
Output: 2
Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.

Note: The length of the given binary array will not exceed 50,000. 

https://leetcode.com/problems/contiguous-array/
*/
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        
        var dict: [Int:Int] = [:] // count: index
        dict[0] = -1 // num of 0 is equal to num of 1
        var count = 0
        var result = 0
        for i in 0..<nums.count {
            count += nums[i] == 0 ? -1 : 1
            if let index = dict[count] {
                result = max(result, i - index)
            } else {
                dict[count] = i
            }
        }
        return result
    }
}