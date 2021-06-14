/*
264. Ugly Number II

Write a program to find the n-th ugly number.

Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. 

Example:

Input: n = 10
Output: 12
Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.

Note:  

    1 is typically treated as an ugly number.
    n does not exceed 1690.

https://leetcode.com/problems/ugly-number-ii/
*/
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 0 else { return 0 }

        if n == 1 { return 1 }
        
        var i2 = 0
        var i3 = 0
        var i5 = 0
        var dp = [Int](repeating: 0, count: n)
        
        dp[0] = 1

        for i in 1..<n {
            dp[i] = min(dp[i2] * 2, min(dp[i3] * 3, dp[i5] * 5))
            if dp[i] == dp[i2] * 2 { i2 += 1 }
            if dp[i] == dp[i3] * 3 { i3 += 1 }
            if dp[i] == dp[i5] * 5 { i5 += 1 }
        }
        
        return dp[n - 1]
    }
}