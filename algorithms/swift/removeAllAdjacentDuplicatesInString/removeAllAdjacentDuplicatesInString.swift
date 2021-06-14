/*
 1047. Remove All Adjacent Duplicates In String

 Given a string S of lowercase letters, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.

 We repeatedly make duplicate removals on S until we no longer can.

 Return the final string after all such duplicate removals have been made.  It is guaranteed the answer is unique.


 Example 1:

 Input: "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".


 Note:

  1.1 <= S.length <= 20000
  2.S consists only of English lowercase letters.

  https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
 */
class Solution {
    func removeDuplicates(_ S: String) -> String {
        guard !S.isEmpty else { return S }
        var stack = [Character]()
        for c in S {
            if stack.isEmpty || stack.last! != c {
                stack.append(c)
            } else {
                stack.removeLast()
            }
        }
        return String(stack)
    }
}
