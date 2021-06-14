/*
 35. Search Insert Position

 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.

 Example 1:

 Input: [1,3,5,6], 5
 Output: 2

 Example 2:

 Input: [1,3,5,6], 2
 Output: 1

 Example 3:

 Input: [1,3,5,6], 7
 Output: 4

 Example 4:

 Input: [1,3,5,6], 0
 Output: 0

 https://leetcode.com/problems/search-insert-position/
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count-1
        while lo <= hi {
            let mid = lo + (hi - lo) >> 1
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                hi = mid-1 
            } else {
                lo = mid+1
            }
        }
        return lo
    }
}
