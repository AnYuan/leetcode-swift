/*
259. 3Sum Smaller

Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

Follow up: Could you solve it in O(n2) runtime?

 

Example 1:

Input: nums = [-2,0,1,3], target = 2
Output: 2
Explanation: Because there are two triplets which sums are less than 2:
[-2,0,1]
[-2,0,3]

Example 2:

Input: nums = [], target = 0
Output: 0

Example 3:

Input: nums = [0], target = 0
Output: 0

 

Constraints:

    n == nums.length
    0 <= n <= 300
    -100 <= nums[i] <= 100
    -100 <= target <= 100

https://leetcode.com/problems/3sum-smaller/
*/
class Solution {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return 0 }
        var result = 0
        let count = nums.count
        let nums = nums.sorted()
        var i = 0
        while i < count-2 {
            var j = i + 1
            var k = nums.count-1
            while j < k {
                let val = nums[i] + nums[j] + nums[k]
                if val < target {
                    result += k - j
                    j += 1
                } else {
                    k -= 1
                }
            }
            i += 1
        }
        return result
    }
}