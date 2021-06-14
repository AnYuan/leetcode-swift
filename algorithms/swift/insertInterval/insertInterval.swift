/*
57. Insert Interval
Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

You may assume that the intervals were initially sorted according to their start times.

Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

https://leetcode.com/problems/insert-interval/
*/
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else { return [newInterval] }
        guard !newInterval.isEmpty else { return intervals }
        
        var index = 0
        var result = [[Int]]()
        var newInterval = newInterval
        
        // skip all that comes before newInterval
        while index < intervals.count, intervals[index][1] < newInterval[0] {
            result.append(intervals[index])
            index += 1
        }
        
        // merge all interval overlap
        while index < intervals.count, intervals[index][0] <= newInterval[1] {
            newInterval[0] = min(intervals[index][0], newInterval[0])
            newInterval[1] = max(intervals[index][1], newInterval[1])
            index += 1
        }
        // append new interval
        result.append(newInterval)
        
        // add all reminding intervals
        for i in index..<intervals.count {
            result.append(intervals[i])
        }
        
        return result
    }
}