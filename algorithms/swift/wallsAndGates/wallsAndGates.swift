/*
286. Walls and Gates

You are given a m x n 2D grid initialized with these three possible values.

    -1 - A wall or an obstacle.
    0 - A gate.
    INF - Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.

Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

Example: 

Given the 2D grid:

INF  -1  0  INF
INF INF INF  -1
INF  -1 INF  -1
  0  -1 INF INF

After running your function, the 2D grid should be:

  3  -1   0   1
  2   2   1  -1
  1  -1   2  -1
  0  -1   3   4

https://leetcode.com/problems/walls-and-gates/
*/
class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        guard !rooms.isEmpty else { return }
        var queue = [(x: Int, y: Int)]()
        let r = rooms.count
        let c = rooms[0].count
        // find all gates first
        for i in 0..<r {
            for j in 0..<c {
                if rooms[i][j] == 0 {
                    queue.append((x: i, y: j))
                }
            }
        }
        
        let dxy = [(1,0), (-1,0), (0, 1), (0, -1)]
        while !queue.isEmpty {
            let l = queue.removeFirst()
            let value = rooms[l.x][l.y]
            for d in dxy {
                let x = l.x + d.0
                let y = l.y + d.1
                
                if x >= 0 && x < r && y >= 0 && y < c {
                    // empty
                    if rooms[x][y] == 2147483647 {
                        rooms[x][y] = value + 1
                        queue.append((x: x, y: y))
                    }
                }
            }
        }
    }
}


