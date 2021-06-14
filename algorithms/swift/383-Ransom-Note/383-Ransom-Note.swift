/*
 383. Ransom Note

 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.

 Note:
 You may assume that both strings contain only lowercase letters.

 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true

 https://leetcode.com/problems/ransom-note/
 */
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        // count all characters in magazine
        magazine.forEach { dict[$0, default: 0] += 1 }
        for c in ransomNote {
            guard let val = dict[c] else { return false }
            if val - 1 < 0 {
                return false
            } else {
                dict[c] = val - 1
            }
        }
        return true
    }
}
