/*
 74. Search a 2D Matrix

 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 * Integers in each row are sorted from left to right.
 *The first integer of each row is greater than the last integer of the previous row.

 Example 1:

 Input:
 matrix = [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 target = 3
 Output: true

 Example 2:

 Input:
 matrix = [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 target = 13
 Output: false

 https://leetcode.com/problems/search-a-2d-matrix/
 */
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }

        let row = matrix.count
        let col = matrix[0].count

        for i in matrix.indices where target >= matrix[i][0] && target <= matrix[i][col-1] {
            return binarySearch(matrix[i], target)
        }
        return false
    }

    private func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
        var lo = 0
        var hi = nums.count - 1
        while lo <= hi {
            var mid = lo + (hi - lo) / 2
            if nums[mid] > target {
                hi = mid - 1
            } else if nums[mid] < target {
                lo = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}
