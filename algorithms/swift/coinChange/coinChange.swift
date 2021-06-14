/*
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 Example 1:
 Input: coins = [1, 2, 5], amount = 11
 Output: 3 
 Explanation: 11 = 5 + 5 + 1

 Example 2:

 Input: coins = [2], amount = 3
 Output: -1

 Note:
 You may assume that you have an infinite number of each kind of coin.


 https://leetcode.com/problems/coin-change/
 */

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
                
        guard coins.count > 0 else { return 0 }
        guard amount > 0 else { return amount }
        
        var dp = [Int](repeating: Int.max, count: amount+1)
        for c in coins where c <= amount {
            dp[c] = 1
        }
        
        for i in 1..<amount+1 {
            for c in coins where i >= c && dp[i-c] != Int.max {
                dp[i] = min(dp[i], dp[i-c]+1)
            }
        }
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}

