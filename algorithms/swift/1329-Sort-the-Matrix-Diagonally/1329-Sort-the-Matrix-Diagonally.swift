/*
1329. Sort the Matrix Diagonally

Given a m * n matrix mat of integers, sort it diagonally in ascending order from the top-left to the bottom-right then return the sorted array.

 

Example 1:

Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]

 

Constraints:

    m == mat.length
    n == mat[i].length
    1 <= m, n <= 100
    1 <= mat[i][j] <= 100

https://leetcode.com/problems/sort-the-matrix-diagonally/
*/
class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        var dict = [Int: [Int]]()
        let r = mat.count
        let c = mat[0].count
        // same i-j value must on the same diagonal line,
        // so we first collect all the diagonal values, then sort
        for i in 0..<r {
            for j in 0..<c {
                dict[i-j, default: [Int]()].append(mat[i][j])
            }
        }
        // sort diagonal value
        for (k, v) in dict {
            dict[k] = v.sorted()
        }
        // pop the first value from sorted diagonal values
        // if we have priority queue here, we should use it.
        for i in 0..<r {
            for j in 0..<c {
                var values = dict[i-j]!
                mat[i][j] = values.removeFirst()
                dict[i-j] = values
            }
        }
        return mat
    }
}