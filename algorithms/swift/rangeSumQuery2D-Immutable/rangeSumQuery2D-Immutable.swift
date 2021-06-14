/*
304. Range Sum Query 2D - Immutable

Given a 2D matrix matrix, find the sum of the elements inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).

Range Sum Query 2D
The above rectangle (with the red border) is defined by (row1, col1) = (2, 1) and (row2, col2) = (4, 3), which contains sum = 8.

Example:

Given matrix = [
  [3, 0, 1, 4, 2],
  [5, 6, 3, 2, 1],
  [1, 2, 0, 1, 5],
  [4, 1, 0, 1, 7],
  [1, 0, 3, 0, 5]
]

sumRegion(2, 1, 4, 3) -> 8
sumRegion(1, 1, 2, 2) -> 11
sumRegion(1, 2, 2, 4) -> 12

Note:

    * You may assume that the matrix does not change.
    * There are many calls to sumRegion function.
    * You may assume that row1 ≤ row2 and col1 ≤ col2.

https://leetcode.com/problems/range-sum-query-2d-immutable/
https://leetcode.com/problems/range-sum-query-2d-immutable/discuss/75350/Clean-C%2B%2B-Solution-and-Explaination-O(mn)-space-with-O(1)-time
*/
class NumMatrix {
    let prefixSum: [[Int]]
    init(_ matrix: [[Int]]) {
        guard matrix.count > 0, matrix[0].count > 0 else {
            prefixSum = [[Int]]()
            return
        }
        
        let m = matrix.count
        let n = matrix[0].count
        var prefixSum = [[Int]](repeatElement([Int](repeatElement(0, count: n + 1)), count: m + 1))
        
        for i in 1...m {
            for j in 1...n {
                prefixSum[i][j] = prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1] + matrix[i - 1][j - 1]
            }
        }
        self.prefixSum = prefixSum
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        
        return prefixSum[row2 + 1][col2 + 1] - prefixSum[row2 + 1][col1] - prefixSum[row1][col2 + 1] + prefixSum[row1][col1]
    }    
}


/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */