/*
1616. Split Two Strings to Make Palindrome

You are given two strings a and b of the same length. Choose an index and split both strings at the same index, splitting a into two strings: aprefix and asuffix where a = aprefix + asuffix, and splitting b into two strings: bprefix and bsuffix where b = bprefix + bsuffix. Check if aprefix + bsuffix or bprefix + asuffix forms a palindrome.

When you split a string s into sprefix and ssuffix, either ssuffix or sprefix is allowed to be empty. For example, if s = "abc", then "" + "abc", "a" + "bc", "ab" + "c" , and "abc" + "" are valid splits.

Return true if it is possible to form a palindrome string, otherwise return false.

Notice that x + y denotes the concatenation of strings x and y.

 

Example 1:

Input: a = "x", b = "y"
Output: true
Explaination: If either a or b are palindromes the answer is true since you can split in the following way:
aprefix = "", asuffix = "x"
bprefix = "", bsuffix = "y"
Then, aprefix + bsuffix = "" + "y" = "y", which is a palindrome.

Example 2:

Input: a = "abdef", b = "fecab"
Output: true

Example 3:

Input: a = "ulacfd", b = "jizalu"
Output: true
Explaination: Split them at index 3:
aprefix = "ula", asuffix = "cfd"
bprefix = "jiz", bsuffix = "alu"
Then, aprefix + bsuffix = "ula" + "alu" = "ulaalu", which is a palindrome.

Example 4:

Input: a = "xbdef", b = "xecab"
Output: false

 

Constraints:

    1 <= a.length, b.length <= 105
    a.length == b.length
    a and b consist of lowercase English letters

https://leetcode.com/problems/split-two-strings-to-make-palindrome/
*/
class Solution {
    func checkPalindromeFormation(_ a: String, _ b: String) -> Bool {
        let ca = [Character](a)    
        let cb = [Character](b)
        return check(ca, cb) || check(cb, ca)
    }
    
    func check(_ a: [Character], _ b: [Character]) -> Bool {
        var i = 0
        var j = a.count - 1
        while i < j && a[i] == b[j] {
            i += 1
            j -= 1
        }
        return isPalindrome(a, i, j) || isPalindrome(b, i, j)
    }
    
    func isPalindrome(_ s: [Character], _ i: Int, _ j: Int) -> Bool {
        var i = i
        var j = j
        while i < j && s[i] == s[j] {
            i += 1
            j -= 1
        }
        return i >= j
    }
}