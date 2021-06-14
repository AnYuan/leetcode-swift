/*
463. Island Perimeter

You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

 

Example:

Input:
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

Output: 16

Explanation: The perimeter is the 16 yellow stripes in the image below:

https://leetcode.com/problems/island-perimeter/
*/
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let R = grid.count
        let C = grid[0].count
        var result = 0
                        
        let dxy = [(-1,0), (1, 0), (0, -1), (0, 1)]

        for r in 0..<R {
            for c in 0..<C {
                if grid[r][c] == 1 {
                    for d in dxy {
                        let dx = r + d.0
                        let dy = c + d.1
                        if (dx >= 0 && dx < R) && (dy >= 0 && dy < C) {
                            if grid[dx][dy] != 1 {
                                result += 1      
                            }
                        }
                        if dx < 0 || dy < 0 || dx >= R || dy >= C {
                            result += 1
                        }
                    }                    
                }
            }
        }
        return result
    }
}