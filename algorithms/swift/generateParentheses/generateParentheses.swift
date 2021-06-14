/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]

 https://leetcode.com/problems/generate-parentheses/
 */
class Solution {
    var result = [String]()
    func generateParenthesis(_ n: Int) -> [String] {
        helper("", n, 0)
        return result
    }
    
    private func helper(_ string: String, _ left: Int, _ right: Int) {
        
        if left == 0, right == 0 {
            result.append(string)
            return
        }

        if left > 0 {
            helper(string + "(", left-1, right+1)
        }
        if right > 0 {
            helper(string + ")", left, right-1)
        }
    }
}