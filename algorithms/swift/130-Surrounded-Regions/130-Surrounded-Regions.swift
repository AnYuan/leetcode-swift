/*
130. Surrounded Regions

Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

Example:

X X X X
X O O X
X X O X
X O X X

After running your function, the board should be:

X X X X
X X X X
X X X X
X O X X

Explanation:

Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.

https://leetcode.com/problems/surrounded-regions/
*/
class Solution {
    func solve(_ board: inout [[Character]]) {
        
        guard board.count > 0 else { return }
        
        var queue = [(row: Int, col: Int)]()
        let r = board.count
        let c = board[0].count
        
        for i in 0..<c {
            if board[0][i] == "O" {
                queue.append((row: 0, col: i))
                board[0][i] = "-"
            }
            if board[r-1][i] == "O" {
                queue.append((row: r-1, col: i))
                board[r-1][i] = "-"
            }
        }
        
        for j in 0..<r {
            if board[j][0] == "O" {
                queue.append((row: j, col: 0))
                board[j][0] = "-"
            }
            if board[j][c-1] == "O" {
                queue.append((row:j, col: c-1))
                board[j][c-1] = "-"
            }
        }
        
        let dxy = [(0,1), (1,0), (-1,0), (0,-1)]
        while !queue.isEmpty {
            let pos = queue.removeLast()
            for d in dxy {
                let row = pos.row + d.0
                let col = pos.col + d.1
                if row >= 0, row < r, col >= 0, col < c, board[row][col] == "O" {
                    queue.append((row: row, col: col))
                    board[row][col] = "-"
                }
            }
        }
        
        for i in 0..<r {
            for j in 0..<c {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "-" {
                    board[i][j] = "O"
                }
            }
        }
    }
}