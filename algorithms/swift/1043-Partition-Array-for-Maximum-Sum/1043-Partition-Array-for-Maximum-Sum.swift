/*
1043. Partition Array for Maximum Sum

Given an integer array arr, you should partition the array into (contiguous) subarrays of length at most k. After partitioning, each subarray has their values changed to become the maximum value of that subarray.

Return the largest sum of the given array after partitioning.

 

Example 1:

Input: arr = [1,15,7,9,2,5,10], k = 3
Output: 84
Explanation: arr becomes [15,15,15,9,10,10,10]

Example 2:

Input: arr = [1,4,1,5,7,3,6,1,9,9,3], k = 4
Output: 83

Example 3:

Input: arr = [1], k = 1
Output: 1

 

Constraints:

    1 <= arr.length <= 500
    0 <= arr[i] <= 109
    1 <= k <= arr.length

https://leetcode.com/problems/partition-array-for-maximum-sum/
https://leetcode.com/problems/partition-array-for-maximum-sum/discuss/290863/JavaC%2B%2BPython-DP-O(K)-Space
*/
class Solution {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        guard !arr.isEmpty else { return 0 }
        let N = arr.count
        guard N > 1 else { return arr[0] }
        var dp = [Int](repeating: 0, count: N+1)
        for i in 0...N {
            var currentMax = 0
            var best = 0
            for j in 1...k where i - j >= 0 {
                currentMax = max(currentMax, arr[i-j])
                best = max(best, dp[i-j] + currentMax * j)
            }
            dp[i] = best
        }
        return dp[N]
    }
}