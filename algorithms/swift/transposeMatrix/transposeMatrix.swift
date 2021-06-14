/*
 867. Transpose Matrix

 Given a matrix A, return the transpose of A.

 The transpose of a matrix is the matrix flipped over it's main diagonal, switching the row and column indices of the matrix.



 Example 1:

 Input: [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[1,4,7],[2,5,8],[3,6,9]]
 Example 2:

 Input: [[1,2,3],[4,5,6]]
 Output: [[1,4],[2,5],[3,6]]


 Note:

 1. 1 <= A.length <= 1000
 2. 1 <= A[0].length <= 1000
 */

class Solution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        let row = A.count
        let col = A[0].count
        guard row > 0, col > 0 else { return A }
        var result = [[Int]](repeating: [Int](repeating: 0, count: row), count: col)
        for i in A.indices {
            for j in A[0].indices {
                result[j][i] = A[i][j]
            }
        }
        return result
    }
}
