/*
 628. Maximum Product of Three Numbers

 Given an integer array, find three numbers whose product is maximum and output the maximum product.

 Example 1:

 Input: [1,2,3]
 Output: 6

 Example 2:

 Input: [1,2,3,4]
 Output: 24


 Note:

 1.The length of the given array will be in range [3,104] and all elements are in the range [-1000, 1000].
 2.Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.

 https://leetcode.com/problems/maximum-product-of-three-numbers/
 */

class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        var sorted = nums.sorted()
        let endIndex = sorted.endIndex
        return max(sorted[endIndex-1] * sorted[endIndex-2] * sorted[endIndex-3],
                   sorted[0] * sorted[1] * sorted[endIndex-1])
    }
}
