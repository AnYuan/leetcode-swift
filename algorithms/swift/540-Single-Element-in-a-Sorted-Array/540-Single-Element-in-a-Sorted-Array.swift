/*
540. Single Element in a Sorted Array

You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

Example 1:

Input: [1,1,2,3,3,4,4,8,8]
Output: 2
Example 2:

Input: [3,3,7,7,10,11,11]
Output: 10
 

Note: Your solution should run in O(log n) time and O(1) space.

https://leetcode.com/problems/single-element-in-a-sorted-array/
https://leetcode.com/problems/single-element-in-a-sorted-array/discuss/100754/Java-Binary-Search-short-(7l)-O(log(n))-w-explanations
*/
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var lo = 0
        var hi = nums.count - 1
        while lo < hi {
            var mid = lo + (hi - lo) / 2
            if mid % 2 == 1 { mid = mid - 1 }
            if nums[mid] != nums[mid+1] { 
                hi = mid 
            } else {
                lo = mid + 2
            }
        }
        return nums[lo]
    }
}