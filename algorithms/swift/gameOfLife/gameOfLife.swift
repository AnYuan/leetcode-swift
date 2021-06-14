/*
 289. Game of Life

 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

  1.Any live cell with fewer than two live neighbors dies, as if caused by under-population.
  2.Any live cell with two or three live neighbors lives on to the next generation.
  3.Any live cell with more than three live neighbors dies, as if by over-population..
  4.Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.

Example:

Input:
[
  [0,1,0],
  [0,0,1],
  [1,1,1],
  [0,0,0]
]
Output:
[
  [0,0,0],
  [1,0,1],
  [0,1,1],
  [0,1,0]
]
Follow up:

  1.Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.

  2.In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?

  https://leetcode.com/problems/game-of-life/
 */

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let row = board.count
        let col = board[0].count
        guard row > 0, col > 0 else {
            return
        }

        for i in 0..<row {
            for j in 0..<col {
                // dead cell with exactly three live neighbors becomes a live cell.
                if board[i][j] == 0, ones(board, i, j) == 3 {
                    board[i][j] = 3
                }
                // live cell with fewer than two live neighbors dies,
                // with more than three live neighbors dies
                if board[i][j] == 1 {
                    let count = ones(board, i, j)
                    if count < 2 || count > 3 {
                        board[i][j] = 2
                    }
                }
            }
        }


        for i in 0..<row {
            for j in 0..<col {
                board[i][j] %= 2
            }
        }
    }

    // get live neighbors (horizontal, vertical, diagonal)
    private func ones(_ board: [[Int]], _ i: Int, _ j: Int) -> Int {
        // eight directions
        let dxy = [[0,1], [0,-1], [1,0], [-1, 0], [1,1], [-1,-1], [1,-1], [-1,1]]

        var ones = 0

        for d in dxy {
            let x = d[0] + i
            let y = d[1] + j
            // edge cases
            guard x >= 0, x < board.count, y >= 0, y < board[0].count else {
                continue
            }
            // live cells for now, including 2 because of 2 is about to die, but still alive.
            // not including 3, since 3 is from dead cell, and about to live.
            if board[x][y] == 1 || board[x][y] == 2 {
                ones += 1
            }
        }
        return ones
    }
}
