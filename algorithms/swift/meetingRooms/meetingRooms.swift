/*
252. Meeting Rooms

Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.

Example 1:

Input: [[0,30],[5,10],[15,20]]
Output: false
Example 2:

Input: [[7,10],[2,4]]
Output: true
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

https://leetcode.com/problems/meeting-rooms/
*/
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        
        guard !intervals.isEmpty else { return true }
        
        var intervals = intervals
        //sort by start time
        intervals.sort { i1, i2 in
            i1[0] < i2[1]
        }
        
        for i in 0..<intervals.count-1 {
            let i1 = intervals[i]
            let i2 = intervals[i+1]
            
            // overlap
            if i1[1] > i2[0] {
                return false
            }
        }
        
        return true
    }
}