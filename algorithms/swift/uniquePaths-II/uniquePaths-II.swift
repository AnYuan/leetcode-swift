/*
 63. Unique Paths II

 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 Now consider if some obstacles are added to the grids. How many unique paths would there be?

 An obstacle and empty space is marked as 1 and 0 respectively in the grid.

 Note: m and n will be at most 100.

 Example 1:

 Input:
 [
 [0,0,0],
 [0,1,0],
 [0,0,0]
 ]
 Output: 2

 Explanation:
 There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right

 https://leetcode.com/problems/unique-paths-ii/
 */
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid[0][0] != 1 else { return 0 }
        var dp = obstacleGrid
        let row = dp.count
        let col = dp[0].count

        // starting cell
        dp[0][0] = 1

        // init first col
        for i in 1..<row {
            if dp[i][0] == 0 && dp[i-1][0] == 1 {
                dp[i][0] = 1
            } else {
                dp[i][0] = 0
            }
        }

        // init first row
        for i in 1..<col {
            if dp[0][i] == 0 && dp[0][i-1] == 1 {
                dp[0][i] = 1
            } else {
                dp[0][i] = 0
            }
        }

        // traverse
        for i in 1..<row {
            for j in 1..<col {
                if dp[i][j] == 0 {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                } else {
                    dp[i][j] = 0
                }
            }
        }
        return dp[row-1][col-1]
    }
}
