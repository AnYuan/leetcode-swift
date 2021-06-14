/*
918. Maximum Sum Circular Subarray
Given a circular array C of integers represented by A, find the maximum possible sum of a non-empty subarray of C.

Here, a circular array means the end of the array connects to the beginning of the array.  (Formally, C[i] = A[i] when 0 <= i < A.length, and C[i+A.length] = C[i] when i >= 0.)

Also, a subarray may only include each element of the fixed buffer A at most once.  (Formally, for a subarray C[i], C[i+1], ..., C[j], there does not exist i <= k1, k2 <= j with k1 % A.length = k2 % A.length.)

 

Example 1:

Input: [1,-2,3,-2]
Output: 3
Explanation: Subarray [3] has maximum sum 3

Example 2:

Input: [5,-3,5]
Output: 10
Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10

Example 3:

Input: [3,-1,2,-1]
Output: 4
Explanation: Subarray [2,-1,3] has maximum sum 2 + (-1) + 3 = 4

Example 4:

Input: [3,-2,2,-3]
Output: 3
Explanation: Subarray [3] and [3,-2,2] both have maximum sum 3

Example 5:

Input: [-2,-3,-1]
Output: -1
Explanation: Subarray [-1] has maximum sum -1

 

Note:

    -30000 <= A[i] <= 30000
    1 <= A.length <= 30000

https://leetcode.com/problems/maximum-sum-circular-subarray/
https://leetcode.com/problems/maximum-sum-circular-subarray/discuss/178422/One-Pass
*/
class Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        var currMax = A[0]
        var maxSum = A[0]
        var currMin = A[0]
        var minSum = A[0]
        var sum = A[0]
        for i in 1..<A.count {
            // max
            currMax = max(A[i] + currMax, A[i])
            maxSum = max(currMax, maxSum)
            // min
            currMin = min(A[i] + currMin, A[i])
            minSum = min(currMin, minSum)
            // total
            sum += A[i]
        }
        return maxSum > 0 ? max(maxSum, sum - minSum) : maxSum
    }
}