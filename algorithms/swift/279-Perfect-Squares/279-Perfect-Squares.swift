/*
279. Perfect Squares

Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.

Example 1:

Input: n = 12
Output: 3 
Explanation: 12 = 4 + 4 + 4.

Example 2:

Input: n = 13
Output: 2
Explanation: 13 = 4 + 9.

https://leetcode.com/problems/perfect-squares/
*/
class Solution {
    func numSquares(_ n: Int) -> Int {
        guard n > 3 else { return n }
        var dp = [Int](repeating: Int.max, count: n+1)
        for i in 0...3 {
            dp[i] = i
        }

        for i in 1...n {
            var j = 1
            while j * j <= i {
                dp[i] = min(dp[i], dp[i-j*j]+1)
                j += 1
            }
        }
        return dp[n]
    }
}