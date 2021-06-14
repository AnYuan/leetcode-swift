/*
 73. Set Matrix Zeroes

 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

 Example 1:

 Input: 
 [
 [1,1,1],
 [1,0,1],
 [1,1,1]
 ]
 Output: 
 [
 [1,0,1],
 [0,0,0],
 [1,0,1]
 ]
 Example 2:

 Input: 
 [
 [0,1,2,0],
 [3,4,5,2],
 [1,3,1,5]
 ]
 Output: 
 [
 [0,0,0,0],
 [0,4,5,0],
 [0,3,1,0]
 ]
 Follow up:

 * A straight forward solution using O(mn) space is probably a bad idea.
 * A simple improvement uses O(m + n) space, but still not the best solution.
 * Could you devise a constant space solution?

 https://leetcode.com/problems/set-matrix-zeroes/
 */

class Solution {

    func setZeroes(_ matrix: inout [[Int]]) {

        guard matrix.count > 0, matrix[0].count > 0 else { return }

        let marked = Int.min

        for i in matrix.indices {
            for j in matrix[0].indices {
                if matrix[i][j] == 0 {
                    for r in matrix.indices where matrix[r][j] != 0 {
                        matrix[r][j] = marked
                    }

                    for c in matrix[0].indices where matrix[i][c] != 0 {
                        matrix[i][c] = marked
                    }
                }
            }
        }

        for i in matrix.indices {
            for j in matrix[0].indices {
                if matrix[i][j] == marked {
                    matrix[i][j] = 0
                }
            }
        }
    }
}
