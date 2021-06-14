/*
174. Dungeon Game

The demons had captured the princess (P) and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of M x N rooms laid out in a 2D grid. Our valiant knight (K) was initially positioned in the top-left room and must fight his way through the dungeon to rescue the princess.

The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.

Some of the rooms are guarded by demons, so the knight loses health (negative integers) upon entering these rooms; other rooms are either empty (0's) or contain magic orbs that increase the knight's health (positive integers).

In order to reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.

 

Write a function to determine the knight's minimum initial health so that he is able to rescue the princess.

For example, given the dungeon below, the initial health of the knight must be at least 7 if he follows the optimal path RIGHT-> RIGHT -> DOWN -> DOWN.
-2 (K) 	-3 	3
-5 	-10 	1
10 	30 	-5 (P)

 

Note:

    The knight's health has no upper bound.
    Any room can contain threats or power-ups, even the first room the knight enters and the bottom-right room where the princess is imprisoned.

https://leetcode.com/problems/dungeon-game/
*/
class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        guard !dungeon.isEmpty else { return 1 }

        let row = dungeon.count
        let col = dungeon[0].count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: col + 1), count: row+1)

        // init value
        dp[row][col - 1] = 1
        dp[row - 1][col] = 1

        for r in dungeon.indices.reversed() {
            for c in dungeon[r].indices.reversed() {
                let minHealth = min(dp[r + 1][c], dp[r][c + 1]) - dungeon[r][c]
                dp[r][c] = minHealth > 0 ? minHealth : 1
            }
        }

        return dp[0][0]
    }
}