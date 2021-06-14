/*
253. Meeting Rooms II
Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.

Example 1:

Input: [[0, 30],[5, 10],[15, 20]]
Output: 2
Example 2:

Input: [[7,10],[2,4]]
Output: 1
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

https://leetcode.com/problems/meeting-rooms-ii/
*/
class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else { return 0 }
        
        var startTimes = [Int]()
        var endTimes = [Int]()
        
        intervals.forEach { i in
            startTimes.append(i[0])
            endTimes.append(i[1])
        }
        
        startTimes.sort()
        endTimes.sort()
        var result = 0
        var startIndex = 0
        var endIndex = 0
        while startIndex < startTimes.count {
            let s = startTimes[startIndex]
            let e = endTimes[endIndex]
            
            if s >= e {
                endIndex += 1
                result -= 1
            }
            
            startIndex += 1
            result += 1
        }
        return result
    }
}