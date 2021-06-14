/*
1031. Maximum Sum of Two Non-Overlapping Subarrays

Given an array A of non-negative integers, return the maximum sum of elements in two non-overlapping (contiguous) subarrays, which have lengths L and M.  (For clarification, the L-length subarray could occur before or after the M-length subarray.)

Formally, return the largest V for which V = (A[i] + A[i+1] + ... + A[i+L-1]) + (A[j] + A[j+1] + ... + A[j+M-1]) and either:

    0 <= i < i + L - 1 < j < j + M - 1 < A.length, or
    0 <= j < j + M - 1 < i < i + L - 1 < A.length.

 

Example 1:

Input: A = [0,6,5,2,2,5,1,9,4], L = 1, M = 2
Output: 20
Explanation: One choice of subarrays is [9] with length 1, and [6,5] with length 2.

Example 2:

Input: A = [3,8,1,3,2,1,8,9,0], L = 3, M = 2
Output: 29
Explanation: One choice of subarrays is [3,8,1] with length 3, and [8,9] with length 2.

Example 3:

Input: A = [2,1,5,6,0,9,5,0,3,8], L = 4, M = 3
Output: 31
Explanation: One choice of subarrays is [5,6,0,9] with length 4, and [3,8] with length 3.

 

Note:

    L >= 1
    M >= 1
    L + M <= A.length <= 1000
    0 <= A[i] <= 1000

https://leetcode.com/problems/maximum-sum-of-two-non-overlapping-subarrays/
https://leetcode.com/problems/maximum-sum-of-two-non-overlapping-subarrays/discuss/278251/JavaC%2B%2BPython-O(N)Time-O(1)-Space
*/
class Solution {
    func maxSumTwoNoOverlap(_ A: [Int], _ L: Int, _ M: Int) -> Int {
        guard A.count > 0 else { return 0 }
        var presum = [Int](repeating: 0, count: A.count + 1)
        for i in 0..<A.count {
            presum[i+1] = A[i] + presum[i]
        }
        var lMax = presum[L]
        var mMax = presum[M]
        var result = presum[L+M]
        for i in L+M...A.count {
            // L is before M
            lMax = max(lMax, presum[i-M]-presum[i-M-L])
            // M is before L
            mMax = max(mMax, presum[i-L]-presum[i-M-L])
            result = max(result, max(lMax+presum[i]-presum[i-M], mMax+presum[i]-presum[i-L]))
        }
        return result
    }
}