/*
Given an array nums of n integers where n > 1,  
return an array output such that output[i] is equal to the product of 
all the elements of nums except nums[i].

Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]

Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? 
(The output array does not count as extra space for the purpose of space complexity analysis.)

https://leetcode.com/problems/product-of-array-except-self/
*/
  class Solution {
      func productExceptSelf(_ nums: [Int]) -> [Int] {
          let N = nums.count
          var result = [Int](repeating: 1, count: N)
          //left product
          for i in 1..<N {
              result[i] = result[i-1] * nums[i-1]
          }
          //right product
          var right = 1
          for i in (0..<N-1).reversed() {
              right = right * nums[i+1]
              result[i] *= right
          }
          return result
      }
  }
