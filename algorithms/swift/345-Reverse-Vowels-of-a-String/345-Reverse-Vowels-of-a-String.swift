/*
345. Reverse Vowels of a String

Write a function that takes a string as input and reverse only the vowels of a string.

Example 1:

Input: "hello"
Output: "holle"

Example 2:

Input: "leetcode"
Output: "leotcede"

Note:
The vowels does not include the letter "y".

https://leetcode.com/problems/reverse-vowels-of-a-string/
*/
class Solution {
    func reverseVowels(_ s: String) -> String {
        var cs = [Character](s)
        let vowels:Set<Character> = Set(["a","e","i","o","u","A","E","I","O","U"])
        var start = 0
        var end = cs.count-1
        while start < end {
            while start < end, !vowels.contains(cs[start]) {
                start += 1
            }
            
            while start < end, !vowels.contains(cs[end]) {
                end -= 1
            }
            
            if start < end {
                (cs[start], cs[end]) = (cs[end], cs[start])
                start += 1
                end -= 1
            }
        }
        return String(cs)
    }
}