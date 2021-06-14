/*
733. Flood Fill

 An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

At the end, return the modified image.

Example 1:

Input: 
image = [[1,1,1],[1,1,0],[1,0,1]]
sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: 
From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected 
by a path of the same color as the starting pixel are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected
to the starting pixel.

Note:
The length of image and image[0] will be in the range [1, 50].
The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
The value of each color in image[i][j] and newColor will be an integer in [0, 65535].

https://leetcode.com/problems/flood-fill/
*/
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {

        let startColor = image[sr][sc]
        guard startColor != newColor else {
            return image
        }
        var image = image
        var queue = [(Int, Int)]() // point: x,y
        var r = image.count
        var c = image[0].count
        queue.append((sr, sc))
        // four directions
        let dxy = [(0,1), (0,-1), (1,0), (-1,0)]
        while !queue.isEmpty {
            let p = queue.removeFirst()
            image[p.0][p.1] = newColor
            for d in dxy {
                let x = p.0 + d.0
                let y = p.1 + d.1
                if x >= 0, x < r, y >= 0, y < c, image[x][y] == startColor {
                    queue.append((x,y))
                    image[x][y] = newColor
                }
            }
        }
        return image
    }
}