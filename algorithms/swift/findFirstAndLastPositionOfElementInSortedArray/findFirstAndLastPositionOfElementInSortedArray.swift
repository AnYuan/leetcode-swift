/*
 34. Find First and Last Position of Element in Sorted Array

 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

 Your algorithm's runtime complexity must be in the order of O(log n).

 If the target is not found in the array, return [-1, -1].

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]

 https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [-1, -1]
        result[0] = search(nums, target, false)
        if result[0] != -1 {
            result[1] = search(nums, target, true)
        }
        return result
    }
    
    // modified Binary Search
    private func search(_ nums: [Int], _ target: Int, _ findMaxIndex: Bool) -> Int {
        var lo = 0
        var hi = nums.count - 1
        var index = -1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target {
                index = mid
                if findMaxIndex {
                    // search ahead to find the last index of 'target'
                    lo = mid + 1
                } else {
                    // search behind to find the first index of 'target'
                    hi = mid - 1
                }
            } else if nums[mid] > target {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return index
    }
}
