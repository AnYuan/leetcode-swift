/*
221. Maximal Square

Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

Example:

Input: 

1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0

Output: 4

https://leetcode.com/problems/maximal-square/
*/
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else { return 0 }
        let r = matrix.count
        let c = matrix[0].count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: c+1), count: r+1)
        var size = 0
        for i in 1...r {
            for j in 1...c {
                if matrix[i-1][j-1] == "1" {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                    size = max(dp[i][j], size)
                }
            }
        }
        return size * size
    }
}