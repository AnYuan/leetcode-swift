/*
 977. Squares of a Sorted Array

 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

 Example 1:

 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Example 2:

 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]


 Note:

 1.1 <= A.length <= 10000
 2.-10000 <= A[i] <= 10000
 3.A is sorted in non-decreasing order.
 */
class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        guard !A.isEmpty else { return A }
        var i = 0, j = A.count - 1
        var result = A
        for c in (0..<A.count).reversed() {
            if abs(A[i]) > abs(A[j]) {
                result[c] = A[i] * A[i]
                i += 1
            } else {
                result[c] = A[j] * A[j]
                j -= 1
            }
        }
        return result
    }
}
