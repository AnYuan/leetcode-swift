/*
1143. Longest Common Subsequence

Given two strings text1 and text2, return the length of their longest common subsequence.

A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

 

If there is no common subsequence, return 0.

 

Example 1:

Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.

Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.

Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.

 

Constraints:

    1 <= text1.length <= 1000
    1 <= text2.length <= 1000
    The input strings consist of lowercase English characters only.

https://leetcode.com/problems/longest-common-subsequence/
https://leetcode.com/problems/longest-common-subsequence/discuss/348884/C%2B%2B-with-picture-O(nm)
*/

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard !text1.isEmpty, !text2.isEmpty else { return 0 }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: text2.length+1), count: text1.length+1)
        let t1 = [Character](text1)
        let t2 = [Character](text2)
        
        for i in 1...t1.count {
            for j in 1...t2.count {
                if t1[i-1] == t2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[t1.count][t2.count]
    }
}