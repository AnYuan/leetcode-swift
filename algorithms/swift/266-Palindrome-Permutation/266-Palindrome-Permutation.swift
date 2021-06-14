/*
266. Palindrome Permutation

Given a string, determine if a permutation of the string could form a palindrome.

Example 1:

Input: "code"
Output: false

Example 2:

Input: "aab"
Output: true

Example 3:

Input: "carerac"
Output: true

https://leetcode.com/problems/palindrome-permutation/
*/
class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        
        var dict = [Character: Int]()
        
        for c in s {
            dict[c, default: 0] += 1
        }
        
        var odd = 0
        for v in dict.values {
            if v % 2 != 0 {
                odd += 1
                if odd > 1 {
                    return false
                }
            }
        }
        return true
    }
}