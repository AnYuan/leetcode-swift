/*
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

 For example, given the following triangle

 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]

 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

 Note:

 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.


 https://leetcode.com/problems/triangle/
 */

func minimumTotal(_ triangle: [[Int]]) -> Int {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle

        for i in (0..<triangle.count-1).reversed() {
            for j in 0..<triangle[i].count {
                dp[i][j] += min(dp[i+1][j], dp[i+1][j+1])
            }
        }
        return dp[0][0]
    }
}

