/*
1275. Find Winner on a Tic Tac Toe Game

Tic-tac-toe is played by two players A and B on a 3 x 3 grid.

Here are the rules of Tic-Tac-Toe:

    Players take turns placing characters into empty squares (" ").
    The first player A always places "X" characters, while the second player B always places "O" characters.
    "X" and "O" characters are always placed into empty squares, never on filled ones.
    The game ends when there are 3 of the same (non-empty) character filling any row, column, or diagonal.
    The game also ends if all squares are non-empty.
    No more moves can be played if the game is over.

Given an array moves where each element is another array of size 2 corresponding to the row and column of the grid where they mark their respective character in the order in which A and B play.

Return the winner of the game if it exists (A or B), in case the game ends in a draw return "Draw", if there are still movements to play return "Pending".

You can assume that moves is valid (It follows the rules of Tic-Tac-Toe), the grid is initially empty and A will play first.

 

Example 1:

Input: moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
Output: "A"
Explanation: "A" wins, he always plays first.
"X  "    "X  "    "X  "    "X  "    "X  "
"   " -> "   " -> " X " -> " X " -> " X "
"   "    "O  "    "O  "    "OO "    "OOX"

Example 2:

Input: moves = [[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]]
Output: "B"
Explanation: "B" wins.
"X  "    "X  "    "XX "    "XXO"    "XXO"    "XXO"
"   " -> " O " -> " O " -> " O " -> "XO " -> "XO " 
"   "    "   "    "   "    "   "    "   "    "O  "

Example 3:

Input: moves = [[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]]
Output: "Draw"
Explanation: The game ends in a draw since there are no moves to make.
"XXO"
"OOX"
"XOX"

Example 4:

Input: moves = [[0,0],[1,1]]
Output: "Pending"
Explanation: The game has not finished yet.
"X  "
" O "
"   "

 

Constraints:

    1 <= moves.length <= 9
    moves[i].length == 2
    0 <= moves[i][j] <= 2
    There are no repeated elements on moves.
    moves follow the rules of tic tac toe.

https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/
*/
class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var game = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        for (index, move) in moves.enumerated() {
            // A: 1, B: -1
            let player = index % 2 == 0 ? 1 : -1
            let row = move[0]
            let col = move[1]
            game[row][col] = player
        }

        for i in 0..<game.count {
            var rSum = 0
            for j in 0..<game[0].count {
                rSum += game[i][j]
                if abs(rSum) == 3 {
                    return rSum > 0 ? "A" : "B"
                }
            }            
        }
        
        for j in 0..<game[0].count {
            var cSum = 0
            for i in 0..<game.count {
                cSum += game[i][j]
                if abs(cSum) == 3 {
                    return cSum > 0 ? "A" : "B"
                }
            }
        }
        
        let d1 = game[0][0] + game[1][1] + game[2][2] 
        if abs(d1) == 3 {
            return d1 > 0 ? "A" : "B"
        }
        
        let d2 = game[0][2] + game[1][1] + game[2][0]
        if abs(d2) == 3 {
            return d2 > 0 ? "A" : "B"
        }
        
        return moves.count == 9 ? "Draw" : "Pending"
    }
}