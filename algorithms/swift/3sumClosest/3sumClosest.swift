/*
 16. 3Sum Closest
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

 Example:

 Given array nums = [-1, 2, 1, -4], and target = 1.

 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

 https://leetcode.com/problems/3sum-closest/
 */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let nums = nums.sorted()
    var result = nums[0] + nums[1] + nums[2]
    for i in 0..<nums.count {
        if i>=1 && nums[i] == nums[i-1] { continue }
        var tmp = 0
        var left = i + 1, right = nums.count - 1
        while left < right {
            tmp = nums[i] + nums[left] + nums[right]
            if tmp < target {
                left += 1
                while left < nums.count && nums[left] == nums[left-1] {
                    left += 1
                }
            } else {
                right -= 1
                while right > left && nums[right] == nums[right+1] {
                    right -= 1
                }
            }
            if abs(result-target) > abs(tmp-target) {
                result = tmp
            }
        }
    }
    return result
}
