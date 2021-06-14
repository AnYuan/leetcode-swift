/*
1314. Matrix Block Sum

Given a m * n matrix mat and an integer K, return a matrix answer where each answer[i][j] is the sum of all elements mat[r][c] for i - K <= r <= i + K, j - K <= c <= j + K, and (r, c) is a valid position in the matrix.


Example 1:

Input: mat = [[1,2,3],[4,5,6],[7,8,9]], K = 1
Output: [[12,21,16],[27,45,33],[24,39,28]]

Example 2:

Input: mat = [[1,2,3],[4,5,6],[7,8,9]], K = 2
Output: [[45,45,45],[45,45,45],[45,45,45]]

 

Constraints:

    m == mat.length
    n == mat[i].length
    1 <= m, n, K <= 100
    1 <= mat[i][j] <= 100

https://leetcode.com/problems/matrix-block-sum/
*/
class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        let r = mat.count
        let c = mat[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: c+1), count: r+1)
        for i in 0..<r {
            for j in 0..<c {
                dp[i+1][j+1] = dp[i+1][j] + dp[i][j+1] - dp[i][j] + mat[i][j]
            }
        }
        var result = [[Int]](repeating: [Int](repeating:0, count: c), count: r)
        for i in 0..<r {
            for j in 0..<c {
                let r1 = max(0, i-K)
                let c1 = max(0, j-K)
                let r2 = min(r, i+K+1)
                let c2 = min(c, j+K+1)
                result[i][j] = dp[r2][c2] - dp[r2][c1] - dp[r1][c2] + dp[r1][c1]
            }
        }
        return result
    }
}