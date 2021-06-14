/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 https://leetcode.com/problems/valid-parentheses/
 */

func isValid(_ s: String) -> Bool {
    guard !s.isEmpty else { return true }
    let parens: [Character: Character] = ["(", ")", "[": "]", "{": "}"]
    var stack = [Character]()
    for c in s {
        if c == "(" || c == "[" || c == "{" {
            stack.append(c)
        } else {
            guard !stack.isEmpty else { return false }
            let key = stack.removeLast()
            if parents[key] != c { return false }
        }
    }
    return stack.isEmpty
}
