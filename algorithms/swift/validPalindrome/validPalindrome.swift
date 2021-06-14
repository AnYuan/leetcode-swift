/*
125. Valid Palindrome

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true

Example 2:

Input: "race a car"
Output: false

https://leetcode.com/problems/valid-palindrome/
*/
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var arr = Array(s.lowercased().filter("abcdefghijklmnopqrstuvwxyz0123456789".contains))
        var left = 0
        var right = arr.count - 1
        while left < right {
            if arr[left] != arr[right] { return false }
            left += 1
            right -= 1
        }
        return true
    }
}