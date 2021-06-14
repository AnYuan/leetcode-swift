/*
1277. Count Square Submatrices with All Ones

Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

 

Example 1:

Input: matrix =
[
  [0,1,1,1],
  [1,1,1,1],
  [0,1,1,1]
]
Output: 15
Explanation: 
There are 10 squares of side 1.
There are 4 squares of side 2.
There is  1 square of side 3.
Total number of squares = 10 + 4 + 1 = 15.

Example 2:

Input: matrix = 
[
  [1,0,1],
  [1,1,0],
  [1,1,0]
]
Output: 7
Explanation: 
There are 6 squares of side 1.  
There is 1 square of side 2. 
Total number of squares = 6 + 1 = 7.

 

Constraints:

    1 <= arr.length <= 300
    1 <= arr[0].length <= 300
    0 <= arr[i][j] <= 1

https://leetcode.com/problems/count-square-submatrices-with-all-ones/
*/

class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let r = matrix.count
        let c = matrix[0].count
        var m = matrix
        var result = 0
        
        for i in 0..<c {
            result += matrix[0][i]
        }
        
        for j in 0..<r {
            result += matrix[j][0]
        }
		// added marix[0][0] twice
		result -= matrix[0][0]
        
        for i in 1..<r {
            for j in 1..<c {
                if m[i][j] == 1 {
                    m[i][j] = min(m[i-1][j-1], m[i-1][j], m[i][j-1]) + 1
                    result += m[i][j]                   
                }
            }
        }
        return result
    }
}