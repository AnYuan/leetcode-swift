/*
349. Intersection of Two Arrays

Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
Note:

Each element in the result must be unique.
The result can be in any order.

https://leetcode.com/problems/intersection-of-two-arrays/
*/
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        
        var unique: Set<Int> = []
        for num in nums1 {
            unique.insert(num)
        }
        
        for num in nums2 where unique.contains(num) {
            result.append(num)
            unique.remove(num)
        }
        
        return result
    }
}
