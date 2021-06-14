/*
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

 Example:

 Input: 4
 Output: [
 [".Q..",  // Solution 1
 "...Q",
 "Q...",
 "..Q."],

 ["..Q.",  // Solution 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 */

class Solution {
       
    var flags = [[Bool]]()
    var solution = [[String]]()
    var result = [[String]]()
    
    func solveNQueens(_ n: Int) -> [[String]] {

        if n == 1 { return [["Q"]] }
        guard n > 3 else { return [] }

        for _ in 0..<n {
            let t0 = Array(repeating: true, count: n)
            let t1 = Array(repeating: ".", count: n)

            flags.append(t0)
            solution.append(t1)
        }

        for i in 0..<n {
            let s = findSolution(board: solution, flags: flags, row:0, col:i)
            if s.count > 0 {
                result.append(contentsOf: s)
            }
        }
        return result
    }

    func findSolution(board: [[String]], flags:[[Bool]], row: Int, col: Int) -> [[String]] {

        var s = board
        var f = flags
        let n = board.count

        var tmpSol = [[String]]()

        s[row][col] = "Q"
        f[row][col] = false

        //terminate condition
        //if current index is last row index, then we found a solution
        guard row + 1 != n else {
            let string = s.map { array in
                array.joined()
            }

            tmpSol.append(string)
            return tmpSol
        }

        f = updateFlags(f, row: row, col: col)
        for i in 0..<n {
            if f[row+1][i] {
                let s = findSolution(board: s, flags: f, row: row+1, col: i)
                if s.count > 0 {
                    tmpSol.append(contentsOf: s)
                }
            }
        }

        return tmpSol
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
