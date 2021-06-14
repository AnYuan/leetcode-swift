/*
1249. Minimum Remove to Make Valid Parentheses

Given a string s of '(' , ')' and lowercase English characters. 

Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

Formally, a parentheses string is valid if and only if:

    It is the empty string, contains only lowercase characters, or
    It can be written as AB (A concatenated with B), where A and B are valid strings, or
    It can be written as (A), where A is a valid string.

 

Example 1:

Input: s = "lee(t(c)o)de)"
Output: "lee(t(c)o)de"
Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

Example 2:

Input: s = "a)b(c)d"
Output: "ab(c)d"

Example 3:

Input: s = "))(("
Output: ""
Explanation: An empty string is also valid.

Example 4:

Input: s = "(a(b(c)d)"
Output: "a(b(c)d)"

 

Constraints:

    1 <= s.length <= 10^5
    s[i] is one of  '(' , ')' and lowercase English letters.

https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
*/
class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var chars = [Character](s)
        guard !chars.isEmpty else { return s }
        var stack = [(Character, Int)]() // ("(" or ")", index)
        for i in chars.indices {
            if chars[i] == "(" {
                stack.append((chars[i], i))
            } else if chars[i] == ")" {
                if !stack.isEmpty {
                    if stack[stack.endIndex-1].0 == "(" {
                        stack.removeLast()
                    } else {
                        stack.append((chars[i], i))
                    }
                } else {
                    stack.append((chars[i], i))
                }
            }
        }
        let indexes = stack.map { $0.1 }
        // delete extra parentheses in reverse order
        for i in indexes.reversed() {
            chars.remove(at: i)
        }
        return String(chars)
    }
}