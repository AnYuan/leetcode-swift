/*
 64. Minimum Path Sum

 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.

 Example:

 Input:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.

 https://leetcode.com/problems/minimum-path-sum/
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else { return 0 }

        var dp = [[Int]](repeating: [Int](repeating: 0, count:grid[0].count ), count: grid.count)

        let row = grid.count
        let col = grid[0].count

        for i in (0..<row).reversed() {
            for j in (0..<col).reversed() {
                if i == row-1, j != col-1 {
                    dp[i][j] = grid[i][j] + dp[i][j+1] // bottom
                } else if j == col - 1, i != row - 1 {
                    dp[i][j] = grid[i][j] + dp[i+1][j] //right
                } else if j != col-1, i != row-1 {
                    dp[i][j] = grid[i][j] + min(dp[i+1][j], dp[i][j+1])// currernt = min (lower, right)
                } else {
                    dp[i][j] = grid[i][j] // bottom right
                }
            }
        }
        return dp[0][0]
    }
}
