/*
750. Number Of Corner Rectangles

Given a grid where each entry is only 0 or 1, find the number of corner rectangles.

A corner rectangle is 4 distinct 1s on the grid that form an axis-aligned rectangle. Note that only the corners need to have the value 1. Also, all four 1s used must be distinct.

 

Example 1:

Input: grid = 
[[1, 0, 0, 1, 0],
 [0, 0, 1, 0, 1],
 [0, 0, 0, 1, 0],
 [1, 0, 1, 0, 1]]
Output: 1
Explanation: There is only one corner rectangle, with corners grid[1][2], grid[1][4], grid[3][2], grid[3][4].

 

Example 2:

Input: grid = 
[[1, 1, 1],
 [1, 1, 1],
 [1, 1, 1]]
Output: 9
Explanation: There are four 2x2 rectangles, four 2x3 and 3x2 rectangles, and one 3x3 rectangle.

 

Example 3:

Input: grid = 
[[1, 1, 1, 1]]
Output: 0
Explanation: Rectangles must have four distinct corners.

 

Note:

    The number of rows and columns of grid will each be in the range [1, 200].
    Each grid[i][j] will be either 0 or 1.
    The number of 1s in the grid will be at most 6000.

https://leetcode.com/problems/number-of-corner-rectangles/
*/
class Solution {
    func countCornerRectangles(_ grid: [[Int]]) -> Int {
        var counter = [Int: Int]()
        var result = 0
        for row in grid {
            for c1 in 0..<row.count where row[c1] == 1 {
                for c2 in (c1+1)..<row.count where row[c2] == 1 {
                    let position = c1 * 200 + c2
                    let count = counter[position, default: 0]
                    result += count
                    counter.updateValue(count+1, forKey: position)
                }
            }
        }
        return result
    }
}