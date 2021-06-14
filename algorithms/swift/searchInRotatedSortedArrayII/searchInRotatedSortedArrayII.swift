/*
81. Search in Rotated Sorted Array II

Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).

You are given a target value to search. If found in the array return true, otherwise return false.

Example 1:
Input: nums = [2,5,6,0,0,1,2], target = 0
Output: true

Example 2:

Input: nums = [2,5,6,0,0,1,2], target = 3
Output: false

Follow up:

* This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
* Would this affect the run-time complexity? How and why?

https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
*/
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var lo = 0, hi = nums.count-1
        while lo <= hi {
            
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target { return true }
            if nums[lo] == nums[mid], nums[mid] == nums[hi] {
                lo += 1
                hi -= 1
            } else if nums[lo] <= nums[mid] { // lo..mid is sorted
                //target in sorted range
                if nums[mid] > target, nums[lo] <= target { 
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else { //mid..hi is sorted
                //target in sorted range
                if nums[hi] >= target, nums[mid] < target {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        return false
    }
}
