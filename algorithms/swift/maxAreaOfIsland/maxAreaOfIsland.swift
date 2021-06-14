/*
 695. Max Area of Island

 Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

 Example 1:

 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
 Example 2:

 [[0,0,0,0,0,0,0,0]]
 Given the above grid, return 0.
 Note: The length of each dimension in the given grid does not exceed 50.

 https://leetcode.com/problems/max-area-of-island/
 */

class Solution {

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        guard grid.count > 0, grid[0].count > 0 else { return 0 }
        var result = 0
        var current = 2
        for i in grid.indices {
            for j in grid[0].indices {
                if grid[i][j] == 1 {
                    grid[i][j] = current
                    result = max(result, connectedIsland(&grid, i, j, 1, current))
                    current += 1
                }
            }
        }
        return result
    }

    private func connectedIsland(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ count: Int, _ current: Int) -> Int {

        guard grid[i][j] == current else { return count }
        var result = count
        let dxy = [(0,1), (1,0), (0,-1), (-1,0)]
        for d in dxy {
            let row = i + d.0
            let col = j + d.1
            if row >= 0, row < grid.count,
            col >= 0, col < grid[0].count, grid[row][col] == 1 {
                grid[row][col] = current
                result = connectedIsland(&grid, row, col, result+1, current)
            }
        }
        return result
    }
}
