/*
 Given two strings s and t , write a function to determine if t is an anagram of s.
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 
 Note:
 You may assume the string contains only lowercase alphabets.
 
 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 
 https://leetcode.com/problems/valid-anagram/
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var charMap = [Int](repeating: 0, count: 26)
    
    for num in s.utf8 {
        charMap[Int(num) - 97] += 1
    }
    
    for num in t.utf8 {
        charMap[Int(num) - 97] -= 1
        if charMap[Int(num) - 97] < 0 {
            return false
        }
    }
    return true
}
