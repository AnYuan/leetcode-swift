/*
348. Design Tic-Tac-Toe

Design a Tic-tac-toe game that is played between two players on a n x n grid.

You may assume the following rules:

    A move is guaranteed to be valid and is placed on an empty block.
    Once a winning condition is reached, no more moves is allowed.
    A player who succeeds in placing n of their marks in a horizontal, vertical, or diagonal row wins the game.

Example:

Given n = 3, assume that player 1 is "X" and player 2 is "O" in the board.

TicTacToe toe = new TicTacToe(3);

toe.move(0, 0, 1); -> Returns 0 (no one wins)
|X| | |
| | | |    // Player 1 makes a move at (0, 0).
| | | |

toe.move(0, 2, 2); -> Returns 0 (no one wins)
|X| |O|
| | | |    // Player 2 makes a move at (0, 2).
| | | |

toe.move(2, 2, 1); -> Returns 0 (no one wins)
|X| |O|
| | | |    // Player 1 makes a move at (2, 2).
| | |X|

toe.move(1, 1, 2); -> Returns 0 (no one wins)
|X| |O|
| |O| |    // Player 2 makes a move at (1, 1).
| | |X|

toe.move(2, 0, 1); -> Returns 0 (no one wins)
|X| |O|
| |O| |    // Player 1 makes a move at (2, 0).
|X| |X|

toe.move(1, 0, 2); -> Returns 0 (no one wins)
|X| |O|
|O|O| |    // Player 2 makes a move at (1, 0).
|X| |X|

toe.move(2, 1, 1); -> Returns 1 (player 1 wins)
|X| |O|
|O|O| |    // Player 1 makes a move at (2, 1).
|X|X|X|

Follow up:
Could you do better than O(n2) per move() operation? 

https://leetcode.com/problems/design-tic-tac-toe/
*/

class TicTacToe {

    var rows: [Int]
    var cols: [Int]
    var diagonal = 0
    var antiDiagonal = 0
    let n: Int
    
    /** Initialize your data structure here. */
    init(_ n: Int) {
        rows = [Int](repeating: 0, count: n)
        cols = [Int](repeating: 0, count: n) 
        self.n = n    
    }
    
    /** Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins. */
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let add = player == 1 ? 1 : -1
        rows[row] += add
        cols[col] += add
        // diagonal
        if row == col {
            diagonal += add
        } 
        // anti diagonal
        if row + col == n - 1 {
            antiDiagonal += add
        }
        
        if abs(diagonal) == n ||
        abs(antiDiagonal) == n ||
        abs(rows[row]) == n ||
        abs(cols[col]) == n {
            return player
        }
        return 0
    }
}

/**
 * Your TicTacToe object will be instantiated and called as such:
 * let obj = TicTacToe(n)
 * let ret_1: Int = obj.move(row, col, player)
 */