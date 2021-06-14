/*
 611. Valid Triangle Number

 Given an array consists of non-negative integers, your task is to count the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.

 Example 1:
 Input: [2,2,3,4]
 Output: 3
 Explanation:
 Valid combinations are:
 2,3,4 (using the first 2)
 2,3,4 (using the second 2)
 2,2,3

 Note:
 1.The length of the given array won't exceed 1000.
 2.The integers in the given array are in the range of [0, 1000].

 https://leetcode.com/problems/valid-triangle-number/
 */
class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        var count = 0
        var nums = nums.sorted()
        for k in (2..<nums.count).reversed() {
            var j = k - 1
            var i = 0
            while(i < j) {
                if(nums[i] + nums[j] > nums[k]) {
                    count = count + j - i
                    j -= 1
                }
                else {
                    i += 1
                }
            }
        }
        return count
    }
}
