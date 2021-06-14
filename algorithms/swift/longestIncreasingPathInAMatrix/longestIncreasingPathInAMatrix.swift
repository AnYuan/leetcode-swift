/*
 329. Longest Increasing Path in a Matrix

 Given an integer matrix, find the length of the longest increasing path.

 From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).

 Example 1:

 Input: nums =
 [
 [9,9,4],
 [6,6,8],
 [2,1,1]
 ]
 Output: 4
 Explanation: The longest increasing path is [1, 2, 6, 9].

 Example 2:

 Input: nums =
 [
 [3,4,5],
 [3,2,6],
 [2,2,1]
 ]
 Output: 4
 Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.

 */


class Solution {

    let dx = [(1,0), (0, 1), (-1, 0), (0, -1)]

    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        guard !matrix.isEmpty else { return 0 }

        let row = matrix.count
        let col = matrix[0].count
        var memo = Array(repeating: Array(repeating: 0, count: col), count: row)
        var result = 1
        for i in 0..<row {
            for j in 0..<col {
                let len = dfs(matrix, i, j, row, col, &memo)
                result = max(result, len)
            }
        }
        return result
    }

    func dfs(_ matrix: [[Int]], _ i: Int, _ j: Int, _ row: Int, _ col: Int, _ memo: inout [[Int]]) -> Int {
        guard memo[i][j] == 0 else { return memo[i][j] }
        var result = 1
        for d in dx {
            let x = i + d.0
            let y = j + d.1
            // four directions, and check validation
            if x < 0 || x >= row || y < 0 || y >= col || matrix[x][y] <= matrix[i][j] { continue }
            let len = 1 + dfs(matrix, x, y, row, col, &memo)
            result = max(result, len)
        }
        memo[i][j] = result
        return result
    }
}
