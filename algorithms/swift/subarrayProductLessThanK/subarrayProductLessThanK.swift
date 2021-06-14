/*
 713. Subarray Product Less Than K

 Your are given an array of positive integers nums.

 Count and print the number of (contiguous) subarrays where the product of all the elements in the subarray is less than k.

 Example 1:
 Input: nums = [10, 5, 2, 6], k = 100
 Output: 8
 Explanation: The 8 subarrays that have product less than 100 are: [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6].
 Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.

 Note:

* 0 < nums.length <= 50000.
* 0 < nums[i] < 1000.
* 0 <= k < 10^6.

https://leetcode.com/problems/subarray-product-less-than-k/
 */
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        var product = 1, result = 0, left = 0
        // sliding window
        for right in 0..<nums.count {
            product *= nums[right]
            while product >= k {
                product /= nums[left]
                left += 1
            }
            result += right - left + 1
        }
        return result
    }
}
