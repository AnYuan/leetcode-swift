/*
 96. Unique Binary Search Trees

 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

 Example:

 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:

  1         3     3      2      1
   \       /     /      / \      \
    3     2     1      1   3      2
   /     /       \                 \
  2     1         2                 3

  https://leetcode.com/problems/unique-binary-search-trees/
 */
class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n+1) // 1...n
        dp[0] = 1
        dp[1] = 1 
        
        guard n >= 2 else { return n }        
        //enumerate each number i,
        //num of binary search tree is dp(1...i-1) - i - dp (i+1...n)
        //dp(n) is the sume of dp(i-1)*dp(n-i) where i from 1...n
        for root in 2...n {
            for left in 1...root {
                // root = (num of left tree) * (num of right tree)
                dp[root] += dp[left-1] * dp[root-left]
            }
        }
        return dp[n]
    }
}