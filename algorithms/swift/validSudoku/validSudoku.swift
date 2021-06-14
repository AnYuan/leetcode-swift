/*
 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 1.Each row must contain the digits 1-9 without repetition.
 2.Each column must contain the digits 1-9 without repetition.
 3.Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.

 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.


 e.g 1
 Input:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: true


 e.g 2
 Input:
 [
 ["8","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being
 modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

 Note:
 * A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 * Only the filled cells need to be validated according to the mentioned rules.
 * The given board contain only digits 1-9 and the character '.'.
 * The given board size is always 9x9.
 */

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        let n = board.count

        var tbtCheck0 = [Character:Bool]()
        var tbtCheck1 = [Character:Bool]()
        var tbtCheck2 = [Character:Bool]()
        var tbtCheck3 = [Character:Bool]()
        var tbtCheck4 = [Character:Bool]()
        var tbtCheck5 = [Character:Bool]()
        var tbtCheck6 = [Character:Bool]()
        var tbtCheck7 = [Character:Bool]()
        var tbtCheck8 = [Character:Bool]()
        // every row and col check
        for i in 0..<n {
            var rowCheck = [Character:Bool]()
            var colCheck = [Character:Bool]()


            for j in 0..<n {
                //col check
                let cc = board[j][i]
                if cc != "." {
                    guard colCheck[cc] == nil else { return false }
                    colCheck[cc] = true
                }

                let cr = board[i][j]
                guard cr != "." else { continue }

                //row check
                guard rowCheck[cr] == nil else { return false }
                rowCheck[cr] = true

                // 3x3 check
                if i <= 2 {
                    if j <= 2 {
                        guard tbtCheck0[cr] == nil else { return false }
                        tbtCheck0[cr] = true
                    } else if j > 2 && j <= 5 {
                        guard tbtCheck1[cr] == nil else { return false }
                        tbtCheck1[cr] = true
                    } else {
                        guard tbtCheck2[cr] == nil else { return false }
                        tbtCheck2[cr] = true
                    }
                } else if i>2 && i <= 5 {
                    if j <= 2 {
                        guard tbtCheck3[cr] == nil else { return false }
                        tbtCheck3[cr] = true
                    } else if j > 2 && j <= 5 {
                        guard tbtCheck4[cr] == nil else { return false }
                        tbtCheck4[cr] = true
                    } else {
                        guard tbtCheck5[cr] == nil else { return false }
                        tbtCheck5[cr] = true
                    }
                } else {
                    if j <= 2 {
                        guard tbtCheck6[cr] == nil else { return false }
                        tbtCheck6[cr] = true
                    } else if j > 2 && j <= 5 {
                        guard tbtCheck7[cr] == nil else { return false }
                        tbtCheck7[cr] = true
                    } else {
                        guard tbtCheck8[cr] == nil else { return false }
                        tbtCheck8[cr] = true
                    }
                }
            }
        }
        return true
    }
}
