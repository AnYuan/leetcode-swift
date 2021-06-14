/*
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input:
 11110
 11010
 11000
 00000

 Output: 1

 Example 2:

 Input:
 11000
 11000
 00100
 00011

 Output: 3
 */

class Solution {
    var directions = [(1,0), (0,1), (-1,0), (0,-1)]
    var current = 1
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" {
                    current += 1
                    bfs(&grid, i, j)
                }
            }
        }
        return current - 1
   }        
   func bfs(_ grid: inout [[Character]], _ ix: Int, _ iy: Int) {
       var queue = [(Int, Int)]() // pos: (x,y)
       var r = grid.count
       var c = grid[0].count
       queue.append((ix, iy))
       while !queue.isEmpty {
           let pos = queue.removeFirst()
           let val = grid[pos.0][pos.1]
           if val == "0" { continue }
           grid[pos.0][pos.1] = "0"
           for d in directions {
               let x = pos.0 + d.0
               let y = pos.1 + d.1
               if x >= 0, x < r, y >= 0, y < c, grid[x][y] == "1" {
                   queue.append((x,y))
               }
           }
       }            
    }
}
