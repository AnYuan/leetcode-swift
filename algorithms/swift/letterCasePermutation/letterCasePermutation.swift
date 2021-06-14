/*
784. Letter Case Permutation

Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.  Return a list of all possible strings we could create.

Examples:
Input: S = "a1b2"
Output: ["a1b2", "a1B2", "A1b2", "A1B2"]

Input: S = "3z4"
Output: ["3z4", "3Z4"]

Input: S = "12345"
Output: ["12345"]

Note:

* S will be a string with length between 1 and 12.
* S will consist only of letters or digits.

https://leetcode.com/problems/letter-case-permutation/
*/
class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        guard !S.isEmpty else { return [String]() }
        var string = Array(S)
        var permutations = [[Character]]()
        permutations.append(string)
        for i in string.indices {
            if string[i].isLetter {
                let n = permutations.count
                for j in 0..<n {
                    var chars = permutations[j]
                    if chars[i].isUppercase {
                        chars[i] = Character(chars[i].lowercased())
                    } else {
                        chars[i] = Character(chars[i].uppercased())
                    }
                    permutations.append(chars)
                }
            }
        }
        return permutations.map { String($0) }
    }
}