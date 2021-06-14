/*
 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example:

 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]

 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.

 */

class Solution {

    var mark = [[Bool]]()
    var found = false

    func exist(_ board: [[Character]], _ word: String) -> Bool {

        let cWord:[Character] = Array(word)

        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == cWord[0] {
                    found = match(board, i, j, cWord)
                    if found { return found }
                }
            }
        }
        return found
    }

    func match(_ board: [[Character]], _ row: Int, _ col: Int, _ word: [Character]) -> Bool {

        mark = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        return _match(board, row, col, word, mark, 0)
    }

    func _match(_ board: [[Character]], _ row: Int, _ col: Int,_ word: [Character], _ mark:[[Bool]], _ current: Int) -> Bool {

        var mark = mark
        guard mark[row][col] == false else { return false }
        mark[row][col] = true

        // found it
        if current == word.count-1 { return true }

        var result = false

        // lower
        if row + 1 < board.count && !mark[row+1][col] && board[row+1][col] == word[current+1] {
            result = _match(board, row+1, col, word, mark, current+1)
        }

        guard result == false else { return true }

        //upper
        if row - 1 >= 0 && !mark[row-1][col] && board[row-1][col] == word[current+1] {
            result = _match(board, row-1, col, word, mark, current+1)
        }

        guard result == false else { return true }

        // left
        if col - 1 >= 0 && !mark[row][col-1] && board[row][col-1] == word[current+1] {
            result = _match(board, row, col-1, word, mark, current+1)
        }
        guard result == false else { return true }

        // right
        if col + 1 < board[0].count && !mark[row][col+1] && board[row][col+1] == word[current+1] {
            result = _match(board, row, col+1, word, mark, current+1)
        }

        return result
    }

}
