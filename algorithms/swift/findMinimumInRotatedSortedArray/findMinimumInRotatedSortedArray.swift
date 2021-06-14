/*
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

Find the minimum element.

You may assume no duplicate exists in the array.

Example 1:

Input: [3,4,5,1,2] 
Output: 1

Example 2:

Input: [4,5,6,7,0,1,2]
Output: 0
*/

class Solution {    
    func findMin(_ nums: [Int]) -> Int {

        var start = 0
        var end = nums.count-1
        while start < end {
            //ordered array
            if nums[start] < nums[end] { return nums[start] }
            
            var mid = (end-start)/2 + start
            if nums[start] > nums[mid] { 
                //rotate point is left of mid,
                //so min value is at left
                end = mid
            } else {
                //otherwise, min value is at right
                start = mid + 1
            }
        }
        return nums[start]
    }
}