/*
 718. Maximum Length of Repeated Subarray

 Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

 Example 1:

 Input:
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 Output: 3
 Explanation:
 The repeated subarray with maximum length is [3, 2, 1].


 Note:

 1. 1 <= len(A), len(B) <= 1000
 0. 0 <= A[i], B[i] < 100

 https://leetcode.com/problems/maximum-length-of-repeated-subarray/
 */

class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        guard !A.isEmpty, !B.isEmpty else { return 0 }
        // dp[i][j] is the longest common prefix of A[i:], B[j:]
        var dp = [[Int]](repeating: [Int](repeating: 0, count: B.count+1),
                         count: A.count+1)

        var result = 0
        for i in A.indices.reversed() {
            for j in B.indices.reversed() {
                if A[i] == B[j] {
                    dp[i][j] = dp[i+1][j+1] + 1
                    result = max(result, dp[i][j])
                }
            }
        }
        return result
    }
}
