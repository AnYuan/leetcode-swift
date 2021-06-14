/*
 33. Search in Rotated Sorted Array

Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of O(log n).

Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4

Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1

https://leetcode.com/problems/search-in-rotated-sorted-array/
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1

        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target {
                return mid
                
            } else if nums[mid] >= nums[lo] {
                //if left part is monotonically increasing, or the pivot point is on the right part
                //must use ">=" at here since we need to make sure target is in the left part,
                if target < nums[mid], target >= nums[lo] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else {
                //if right part is monotonically increasing, or the pivot point is on the left part
                if target > nums[mid], target <= nums[hi] {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        return -1
    }
}