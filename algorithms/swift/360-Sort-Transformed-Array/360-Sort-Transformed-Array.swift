/*
360. Sort Transformed Array

Given a sorted array of integers nums and integer values a, b and c. Apply a quadratic function of the form f(x) = ax2 + bx + c to each element x in the array.

The returned array must be in sorted order.

Expected time complexity: O(n)

Example 1:

Input: nums = [-4,-2,2,4], a = 1, b = 3, c = 5
Output: [3,9,15,33]

Example 2:

Input: nums = [-4,-2,2,4], a = -1, b = 3, c = 5
Output: [-23,-5,1,7]

https://leetcode.com/problems/sort-transformed-array/
*/
class Solution {
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var i = a >= 0 ? right : left
        var result = [Int](repeating: 0, count: nums.count)
        while left <= right {
            let n1 = nums[left]
            let r1 = a * n1 * n1 + b * n1 + c
            let n2 = nums[right]
            let r2 = a * n2 * n2 + b * n2 + c
            if a >= 0 {
                // descending
                if r1 >= r2 {
                    result[i] = r1
                    left += 1
                } else {
                    result[i] = r2
                    right -= 1
                }
                i -= 1
            } else {
                // ascending
                if r1 >= r2 {
                    result[i] = r2
                    right -= 1
                } else {
                    result[i] = r1
                    left += 1
                }
                i += 1
            }
        }
        return result
    }
}