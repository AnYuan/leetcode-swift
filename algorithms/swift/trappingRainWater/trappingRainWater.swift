/*
42. Trapping Rain Water
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

Example:

Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6

https://leetcode.com/problems/trapping-rain-water/
*/

class Solution {
    func trap(_ height: [Int]) -> Int {
        var water = 0
        var level = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            var lower = 0
            if height[left] < height[right] {       
                lower = height[left]
                left = left + 1
            } else {         
                lower = height[right]
                right = right - 1
            }
            
            level = max(level, lower)
            water = water + (level - lower)
        }
        return water
    }
}