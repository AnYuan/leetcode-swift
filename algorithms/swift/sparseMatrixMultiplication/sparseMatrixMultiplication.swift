/*
311. Sparse Matrix Multiplication

Given two sparse matrices A and B, return the result of AB.

You may assume that A's column number is equal to B's row number.

Example:

Input:

A = [
  [ 1, 0, 0],
  [-1, 0, 3]
]

B = [
  [ 7, 0, 0 ],
  [ 0, 0, 0 ],
  [ 0, 0, 1 ]
]

Output:

     |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
                  | 0 0 1 |

https://leetcode.com/problems/sparse-matrix-multiplication/
*/
class Solution {
    func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        
        var result = [[Int]](repeating: [Int](repeating: 0, count: B[0].count), count: A.count)
        
        for ra in 0..<A.count {
            for ca in 0..<A[0].count {
                if A[ra][ca] != 0 {
                    for cb in 0..<B[0].count {
                        result[ra][cb] += A[ra][ca] * B[ca][cb]
                    }
                }
            }
        }
        return result
    }
}