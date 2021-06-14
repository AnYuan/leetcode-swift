/*
 856. Score of Parentheses

 Given a balanced parentheses string S, compute the score of the string based on the following rule:

 () has score 1
 AB has score A + B, where A and B are balanced parentheses strings.
 (A) has score 2 * A, where A is a balanced parentheses string.


 Example 1:

 Input: "()"
 Output: 1
 Example 2:

 Input: "(())"
 Output: 2
 Example 3:

 Input: "()()"
 Output: 2
 Example 4:

 Input: "(()(()))"
 Output: 6


 Note:

 1.S is a balanced parentheses string, containing only ( and ).
 2.2 <= S.length <= 50

 https://leetcode.com/problems/score-of-parentheses/
 */
class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        var stack = [Int]()
        var current = 0
        for s in S {
            if s == "(" {
                stack.append(current)
                current = 0
            } else {
                current = stack.removeLast() + max(current * 2, 1)
            }
        }
        return current
    }
}
