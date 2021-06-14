/*
 56. Merge Intervals

 Given a collection of intervals, merge all overlapping intervals.

 Example 1:

 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.


 https://leetcode.com/problems/merge-intervals/
 */
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] }
        var result = [[Int]]()
        result.append(intervals[0])

        for interval in intervals {

            let last = result[result.endIndex-1]

            if last[1] < interval[0] {
                result.append(interval)
            } else {
                result.removeLast()
                result.append([last[0], max(last[1], interval[1])])
            }
        }
        return result
    }
}
