/*
567. Permutation in String

Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

 

Example 1:

Input: s1 = "ab" s2 = "eidbaooo"
Output: True
Explanation: s2 contains one permutation of s1 ("ba").
Example 2:

Input:s1= "ab" s2 = "eidboaoo"
Output: False
 

Note:

1. The input strings only contain lower case letters.
2. The length of both given strings is in range [1, 10,000].

https://leetcode.com/problems/permutation-in-string/
*/
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var start = 0
        var matched = 0
        var dict = [Character: Int]()
        for c in s1 {
            dict[c, default: 0] += 1
        }
        
        let strings = Array(s2)
        
        for end in 0..<strings.count {
            let c = strings[end]
            if let count = dict[c] {
                dict[c] = count - 1
                if count - 1 == 0 {
                    matched += 1
                }
            }
            
            if matched == dict.count {
                return true
            }
            
            if end >= s1.length - 1 {
                let cc = strings[start]                

                if let count = dict[cc] {
                    if count == 0 {
                        matched -= 1
                    }
                    dict[cc] = count + 1
                }
                start += 1
            }
        }
        return false
    }
}