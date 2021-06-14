/*
 228. Summary Ranges

 Given a sorted integer array without duplicates, return the summary of its ranges.

 Example 1:

 Input:  [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.

 Example 2:

 Input:  [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.

 https://leetcode.com/problems/summary-ranges/
 */

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 0 else { return [] }

        var result = [String]()
        var current = 0
        while current < nums.count {
            var start = nums[current]
            while current + 1 < nums.count, nums[current + 1] - nums[current] == 1 {
                current += 1
            }
            var end = nums[current]
            if end != start {
                result.append("\(start)->\(end)")
            } else {
                result.append("\(start)")
            }
            current += 1
        }
        return result
    }
}
