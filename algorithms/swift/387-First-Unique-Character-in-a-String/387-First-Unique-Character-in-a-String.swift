/*
387. First Unique Character in a String

Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode",
return 2.

Note: You may assume the string contain only lowercase letters. 

https://leetcode.com/problems/first-unique-character-in-a-string/
*/
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        guard !s.isEmpty else { return -1 }
        var dict = [Character: Int]() // character : index
        s.forEach { c in
            dict[c, default: 0] += 1
        }
        for (i, c) in s.enumerated() {
            if let count = dict[c], count == 1 {
                return i
            }            
        }
        return -1
    }
}