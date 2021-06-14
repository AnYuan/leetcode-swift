/*
424. Longest Repeating Character Replacement

Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.

In one operation, you can choose any character of the string and change it to any other uppercase English character.

Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.

Note:
Both the string's length and k will not exceed 104.

Example 1:

Input:
s = "ABAB", k = 2

Output:
4

Explanation:
Replace the two 'A's with two 'B's or vice versa.
 

Example 2:

Input:
s = "AABABBA", k = 1

Output:
4

Explanation:
Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.

https://leetcode.com/problems/longest-repeating-character-replacement/
https://www.educative.io/courses/grokking-the-coding-interview/R8DVgjq78yR
*/
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var result = 0
        var start = 0
        var repeatChar = 0
        var dict = [Character: Int]()
        let strings = Array(s)
        for end in 0..<strings.count {
            dict[strings[end], default: 0] += 1
            repeatChar = max(repeatChar, dict[strings[end]]!)
            if end - start + 1 - repeatChar > k {
                dict[strings[start]] = dict[strings[start]]! - 1
                start += 1
            }
            result = max(result, end - start + 1)
        }
        return result
    }
}