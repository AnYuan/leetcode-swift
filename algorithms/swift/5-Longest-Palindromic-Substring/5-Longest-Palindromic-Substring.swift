/*
5. Longest Palindromic Substring

Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Example 2:

Input: "cbbd"
Output: "bb"

https://leetcode.com/problems/longest-palindromic-substring/
*/
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cs = [Character](s)
        guard cs.count > 1 else { return s }
        var start = 0
        var end = 0
        var len = 0
        for i in 0..<cs.count {
            let len1 = lengthOfPalindromeSubString(cs, i, i) //odd
            let len2 = lengthOfPalindromeSubString(cs, i, i+1) // even
            len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(cs[start...end])
    }
    
    func lengthOfPalindromeSubString(_ cs: [Character], _ l: Int, _ r: Int) -> Int {
        var l = l
        var r = r
        while l >= 0, r < cs.count, cs[l] == cs[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
}