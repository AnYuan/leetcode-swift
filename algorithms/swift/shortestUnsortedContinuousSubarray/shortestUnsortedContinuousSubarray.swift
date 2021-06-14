/*
 581. Shortest Unsorted Continuous Subarray

 Given an integer array, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.

 You need to find the shortest such subarray and output its length.

 Example 1:
 Input: [2, 6, 4, 8, 10, 9, 15]
 Output: 5
 Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

 Note:

 1.Then length of the input array is in range [1, 10,000].
 2.The input array may contain duplicates, so ascending order here means <=.

 https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
 */
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let len = nums.count
        var m = nums[0], n = nums[len-1]
        var l = -1, r = -2
        for i in 0..<len {
            m = max(m, nums[i])
            n = min(n, nums[len-i-1])
            if m != nums[i] {
                r = i
            }
            if n != nums[len-i-1] {
                l = len-i-1
            }
        }
        return r-l+1

    }
}
