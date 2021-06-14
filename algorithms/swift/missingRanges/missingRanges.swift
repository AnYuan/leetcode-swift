/*
 163. Missing Ranges

 Given a sorted integer array nums, where the range of elements are in the inclusive range [lower, upper], return its missing ranges.

 Example:

 Input: nums = [0, 1, 3, 50, 75], lower = 0 and upper = 99,
 Output: ["2", "4->49", "51->74", "76->99"]

 https://leetcode.com/problems/missing-ranges/
 https://leetcode.com/problems/missing-ranges/discuss/50631/Ten-line-python-solution
 */
class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var nums = nums
        nums.append(upper+1)
        var result = [String]()
        var pre = lower - 1
        for n in nums {
            if n == pre + 2 {
                result.append("\(n-1)")
            } else if n > pre + 2 {
                result.append("\(pre+1)->\(n-1)")
            }
            pre = n
        }
        return result
    }
}
