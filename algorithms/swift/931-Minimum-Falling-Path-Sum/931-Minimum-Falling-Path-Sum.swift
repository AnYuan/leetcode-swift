/*
931. Minimum Falling Path Sum

Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix.

A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).

 

Example 1:

Input: matrix = [[2,1,3],[6,5,4],[7,8,9]]
Output: 13
Explanation: There are two falling paths with a minimum sum underlined below:
[[2,1,3],      [[2,1,3],
 [6,5,4],       [6,5,4],
 [7,8,9]]       [7,8,9]]

Example 2:

Input: matrix = [[-19,57],[-40,-5]]
Output: -59
Explanation: The falling path with a minimum sum is underlined below:
[[-19,57],
 [-40,-5]]

Example 3:

Input: matrix = [[-48]]
Output: -48

 

Constraints:

    n == matrix.length
    n == matrix[i].length
    1 <= n <= 100
    -100 <= matrix[i][j] <= 100

https://leetcode.com/problems/minimum-falling-path-sum/
*/
class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        let n = matrix.count
        for row in 1..<n {
            for col in 0..<n {
                dp[row][col] += min(dp[row-1][col], dp[row-1][max(0, col-1)], dp[row-1][min(n-1, col+1)])
            } 
        }
        return dp[n-1].min()!
    }
}