/*
678. Valid Parenthesis String

 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

    Any left parenthesis '(' must have a corresponding right parenthesis ')'.
    Any right parenthesis ')' must have a corresponding left parenthesis '('.
    Left parenthesis '(' must go before the corresponding right parenthesis ')'.
    '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
    An empty string is also valid.

Example 1:

Input: "()"
Output: True

Example 2:

Input: "(*)"
Output: True

Example 3:

Input: "(*))"
Output: True

Note:

    The string size will be in the range [1, 100].

https://leetcode.com/problems/valid-parenthesis-string/
https://leetcode.com/problems/valid-parenthesis-string/discuss/107570/JavaC%2B%2BPython-One-Pass-Count-the-Open-Parenthesis
*/
class Solution {
    func checkValidString(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        var cmin = 0
        var cmax = 0
        for c in s {
            if c == "(" {
                cmin += 1
                cmax += 1
            } else if c == ")" {
                cmin = max(cmin-1, 0)
                cmax -= 1
            } else {
                cmax += 1
                cmin = max(cmin-1, 0)
            }
            if cmax < 0 {
                return false
            }
        }
        return cmin == 0
    }
}