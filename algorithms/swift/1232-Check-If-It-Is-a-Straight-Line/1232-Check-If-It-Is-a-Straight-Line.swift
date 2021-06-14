/*
1232. Check If It Is a Straight Line

You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.


Example 1:

Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
Output: true

Example 2:

Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
Output: false


Constraints:

    2 <= coordinates.length <= 1000
    coordinates[i].length == 2
    -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
    coordinates contains no duplicate point.

https://leetcode.com/problems/check-if-it-is-a-straight-line/
*/
class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count > 2 else { return true }
        let n = coordinates.count
        for i in 1..<n-1 {
            let p0 = coordinates[i-1]
            let p1 = coordinates[i]
            let p2 = coordinates[i+1]
            if p1[0] == p0[0] || p2[0] == p1[0] {
                if !(p1[0] == p0[0] && p1[0] == p2[0]) {
                    return false
                }
            } else {
                if Double((p1[1] - p0[1])) / Double((p1[0] - p0[0])) != Double((p2[1] - p1[1])) / Double((p2[0] - p1[0])) {
                    return false
                }
            }
        }
        return true
    }
}