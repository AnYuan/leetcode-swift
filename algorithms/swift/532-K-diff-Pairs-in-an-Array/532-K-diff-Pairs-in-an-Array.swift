/*
532. K-diff Pairs in an Array

 Given an array of integers and an integer k, you need to find the number of unique k-diff pairs in the array. Here a k-diff pair is defined as an integer pair (i, j), where i and j are both numbers in the array and their absolute difference is k.

Example 1:

Input: [3, 1, 4, 1, 5], k = 2
Output: 2
Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
Although we have two 1s in the input, we should only return the number of unique pairs.

Example 2:

Input:[1, 2, 3, 4, 5], k = 1
Output: 4
Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).

Example 3:

Input: [1, 3, 1, 5, 4], k = 0
Output: 1
Explanation: There is one 0-diff pair in the array, (1, 1).

Note:

    The pairs (i, j) and (j, i) count as the same pair.
    The length of the array won't exceed 10,000.
    All the integers in the given input belong to the range: [-1e7, 1e7].

https://leetcode.com/problems/k-diff-pairs-in-an-array/
*/
class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var start = 0
        var end = 1
        var result = 0
        while start < nums.count, end < nums.count {
            if start == end || nums[end] - nums[start] < k {
                end += 1
            } else if nums[end] - nums[start] > k {
                start += 1
            } else {
                start += 1
                result += 1
                while start < nums.count, nums[start] == nums[start-1] {
                    start += 1
                }
            }
        }
        return result
    }
}