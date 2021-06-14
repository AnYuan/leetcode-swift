/*
32. Longest Valid Parentheses

Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

Example 1:

Input: "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()"

Example 2:

Input: ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()"

https://leetcode.com/problems/longest-valid-parentheses/
*/
func longestValidParentheses(_ s: String) -> Int {

    let n = s.count
    guard n > 1 else { return 0 }

    var dp = Array(repeating: 0, count: n)
    let chars = Array(s)
    var left = 0 //num of left paren
    var result = 0
    for i in 0..<n {
        if chars[i] == "(" {
            left = left + 1
        }
        if chars[i] == ")" && left > 0 {
            dp[i] = dp[i-1] + 2
            // last valid paren
            if i - dp[i] > 0 {
                dp[i] = dp[i] + dp[i-dp[i]]
            }
            left = left - 1
        }
        if dp[i] > result {
            result = dp[i]
        }
    }
    return result
}
