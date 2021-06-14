/*
1248. Count Number of Nice Subarrays

Given an array of integers nums and an integer k. A subarray is called nice if there are k odd numbers on it.

Return the number of nice sub-arrays.

 

Example 1:

Input: nums = [1,1,2,1,1], k = 3
Output: 2
Explanation: The only sub-arrays with 3 odd numbers are [1,1,2,1] and [1,2,1,1].

Example 2:

Input: nums = [2,4,6], k = 1
Output: 0
Explanation: There is no odd numbers in the array.

Example 3:

Input: nums = [2,2,2,1,2,2,1,2,2,2], k = 2
Output: 16

 

Constraints:

    1 <= nums.length <= 50000
    1 <= nums[i] <= 10^5
    1 <= k <= nums.length

https://leetcode.com/problems/count-number-of-nice-subarrays/
*/
class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var i = 0, j = 0, res = 0, count = 0, prefix = 0
        
        while j < nums.count {
            count += nums[j] % 2
            if count == k {
                prefix = 0
            }
            while count == k {
                prefix += 1
                count -= nums[i] % 2
                i += 1
            }
            res += prefix
            j += 1
        }
        return res
    }
}