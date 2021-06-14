/*
 661. Image Smoother

 Given a 2D integer matrix M representing the gray scale of an image, you need to design a smoother to make the gray scale of each cell becomes the average gray scale (rounding down) of all the 8 surrounding cells and itself. If a cell has less than 8 surrounding cells, then use as many as you can.

 Example 1:
 Input:
 [[1,1,1],
 [1,0,1],
 [1,1,1]]
 Output:
 [[0, 0, 0],
 [0, 0, 0],
 [0, 0, 0]]
 Explanation:
 For the point (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
 For the point (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
 For the point (1,1): floor(8/9) = floor(0.88888889) = 0

 Note:
 1. The value in the given matrix is in the range of [0, 255].
 2. The length and width of the given matrix are in the range of [1, 150].

 https://leetcode.com/problems/image-smoother/
 */
class Solution {
    func imageSmoother(_ M: [[Int]]) -> [[Int]] {
        let row = M.count
        let col = M[0].count
        var result = M
        for i in M.indices {
            for j in M[0].indices {
                result[i][j] = smooth(M, i, j)
            }
        }
        return result
    }

    private func smooth(_ M: [[Int]], _ x: Int, _ y: Int) -> Int {
        let row = M.count
        let col = M[0].count
        var sum = 0
        var count = 0

        for i in -1...1 {
            for j in -1...1 {
                if x + i < 0 || x + i >= row || y + j < 0 || y + j >= col {
                    continue
                }
                count += 1
                sum += M[x + i][y + j]
            }
        }
        return sum / count
    }
}
