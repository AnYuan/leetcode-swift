/*
529. Minesweeper
Let's play the minesweeper game (Wikipedia, online game)!

You are given a 2D char matrix representing the game board. 'M' represents an unrevealed mine, 'E' represents an unrevealed empty square, 'B' represents a revealed blank square that has no adjacent (above, below, left, right, and all 4 diagonals) mines, digit ('1' to '8') represents how many mines are adjacent to this revealed square, and finally 'X' represents a revealed mine.

Now given the next click position (row and column indices) among all the unrevealed squares ('M' or 'E'), return the board after revealing this position according to the following rules:

    If a mine ('M') is revealed, then the game is over - change it to 'X'.
    If an empty square ('E') with no adjacent mines is revealed, then change it to revealed blank ('B') and all of its adjacent unrevealed squares should be revealed recursively.
    If an empty square ('E') with at least one adjacent mine is revealed, then change it to a digit ('1' to '8') representing the number of adjacent mines.
    Return the board when no more squares will be revealed.

 

Example 1:

Input: 

[['E', 'E', 'E', 'E', 'E'],
 ['E', 'E', 'M', 'E', 'E'],
 ['E', 'E', 'E', 'E', 'E'],
 ['E', 'E', 'E', 'E', 'E']]

Click : [3,0]

Output: 

[['B', '1', 'E', '1', 'B'],
 ['B', '1', 'M', '1', 'B'],
 ['B', '1', '1', '1', 'B'],
 ['B', 'B', 'B', 'B', 'B']]

Explanation:

Example 2:

Input: 

[['B', '1', 'E', '1', 'B'],
 ['B', '1', 'M', '1', 'B'],
 ['B', '1', '1', '1', 'B'],
 ['B', 'B', 'B', 'B', 'B']]

Click : [1,2]

Output: 

[['B', '1', 'E', '1', 'B'],
 ['B', '1', 'X', '1', 'B'],
 ['B', '1', '1', '1', 'B'],
 ['B', 'B', 'B', 'B', 'B']]

Explanation:

 

Note:

    The range of the input matrix's height and width is [1,50].
    The click position will only be an unrevealed square ('M' or 'E'), which also means the input board contains at least one clickable square.
    The input board won't be a stage when game is over (some mines have been revealed).
    For simplicity, not mentioned rules should be ignored in this problem. For example, you don't need to reveal all the unrevealed mines when the game is over, consider any cases that you will win the game or flag any squares.

https://leetcode.com/problems/minesweeper/
*/
class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {

        var b = board
        if board[click[0]][click[1]] == "M" {
            b[click[0]][click[1]] = "X"
            return b
        } else if board[click[0]][click[1]] == "B" || board[click[0]][click[1]].isNumber {
            return board
        }

        // adjacent directions
        let dxy = [(0,1), (0,-1), (1,0), (-1,0), (1,1), (-1,1),(1,-1),(-1,-1)]
        var queue = [(Int,Int)]()
        queue.append((click[0], click[1]))
        
        while !queue.isEmpty {
            let l = queue.removeLast()
            let x = l.0
            let y = l.1
            var counter = 0
            if b[x][y] == "E" {
                for d in dxy {
                    let xx = x + d.0
                    let yy = y + d.1
                    if xx >= 0, xx < b.count, 
                       yy >= 0, yy < b[0].count {
                       if b[xx][yy] == "M" || b[xx][yy] == "X" {
                           counter += 1
                       }
                    }
                }
                if counter == 0 {
                    // update current
                    b[x][y] = "B"
                    for d in dxy {
                        let xx = x + d.0
                        let yy = y + d.1
                        if xx >= 0, xx < b.count, 
                        yy >= 0, yy < b[0].count {
                            if b[xx][yy] == "E" {
                                queue.append((xx,yy))
                            }
                        }
                    }
                } else {
                    b[x][y] = Character(String(counter))
                }
            }
        }
        return b
    }
}