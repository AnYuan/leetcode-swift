/*
 11. Container With Most Water
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.

 Example:

 Input: [1,8,6,2,5,4,8,3,7]
 Output: 49

 https://leetcode.com/problems/container-with-most-water/
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 0 else { return 0 }
        var result = 0
        var l = 0
        var r = height.count-1
        while l < r {
            result = max(result, (r-l) * min(height[r], height[l]))

            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return result
    }
}
