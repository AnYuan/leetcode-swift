/*

 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

 Example:

 Input: 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown below.
 [
 [".Q..",  // Solution 1
 "...Q",
 "Q...",
 "..Q."],

 ["..Q.",  // Solution 2
 "Q...",
 "...Q",
 ".Q.."]
 ]

 https://leetcode.com/problems/n-queens-ii/
 */
class Solution {
    var flags = [[Bool]]()
    var sol = 0

    func totalNQueens(_ n: Int) -> Int {

        if n == 1 { return 1 }
        guard n > 3 else { return 0 }

        for _ in 0..<n {
            let t0 = Array(repeating: true, count: n)
            flags.append(t0)
        }

        for i in 0..<n {
            sol = sol + findSolution(flags, row:0, col:i)
        }
        return sol
    }

    func findSolution(_ flags:[[Bool]], row: Int, col: Int) -> Int {

        var f = flags
        let n = flags.count
        var subSol = 0

        f[row][col] = false

        //terminate condition
        //if current index is last row index, then we found a solution
        guard row + 1 != n else { return subSol+1 }

        f = updateFlags(f, row: row, col: col)
        for i in 0..<n {
            if f[row+1][i] {
                subSol = subSol + findSolution(f, row: row+1, col: i)
            }
        }

        return subSol
    }

    func updateFlags(_ flags:[[Bool]], row: Int, col: Int) -> [[Bool]] {
        var _flags = flags
        let n = flags.count

        //down
        for i in row..<n {
            _flags[i][col] = false
        }
        //lower left
        var i = row
        var j = col
        while i < n && j >= 0 {
            _flags[i][j] = false
            i = i + 1
            j = j - 1
        }

        //lower right
        i = row
        j = col
        while i < n && j < n {
            _flags[i][j] = false
            i = i + 1
            j = j + 1
        }

        return _flags
    }
}
