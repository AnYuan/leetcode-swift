/*
378. Kth Smallest Element in a Sorted Matrix

Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.

Note that it is the kth smallest element in the sorted order, not the kth distinct element.

Example:

matrix = [
   [ 1,  5,  9],
   [10, 11, 13],
   [12, 13, 15]
],
k = 8,

return 13.
Note:
You may assume k is always valid, 1 ≤ k ≤ n2.

https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
*/
class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var left = matrix[0][0]
        var right = matrix[matrix.count - 1][matrix[0].count - 1] + 1
        var middle = 0
        var count = 0
        var j = matrix[0].count - 1

        while left < right {
            middle = left + (right - left) / 2
            count = 0
            j = matrix[0].count - 1
            for i in 0..<matrix.count {
                while j >= 0 && matrix[i][j] > middle {
                    j -= 1
                }
                count += (j + 1)
            }
            if count < k {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return left
    }
}