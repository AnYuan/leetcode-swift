/*
647. Palindromic Substrings

Given a string, your task is to count how many palindromic substrings in this string.

The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

Example 1:

Input: "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".

 

Example 2:

Input: "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".

 

Note:

    The input string length won't exceed 1000.


https://leetcode.com/problems/palindromic-substrings/
*/
class Solution {
    func countSubstrings(_ string: String) -> Int {
        var count = 0
        let n = string.count
        let charArr = Array(string)
        
        for center in 0..<2*n-1 {
            var left = center / 2
            var right = left + center % 2
            
            while left >= 0, right < n, charArr[left] == charArr[right] {
                left -= 1
                right += 1
                count += 1
            }
        }
        return count
    }
}