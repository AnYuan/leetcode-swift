/*
76. Minimum Window Substring

Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

Example:

Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
Note:

* If there is no such window in S that covers all characters in T, return the empty string "".
* If there is such window, you are guaranteed that there will always be only one unique minimum window in S.

https://leetcode.com/problems/minimum-window-substring/
*/
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        
        var dict = [Character: Int]()
        for c in t {
            dict[c, default: 0] += 1
        }
        
        var start = 0
        var matched = 0
        var minLength = Int.max
        var subStringStart = -1
        
        let strings = Array(s)
        
        for end in 0..<strings.count {
            let c = strings[end]
            if let count = dict[c] {
                dict[c] = count - 1
                if count - 1 == 0 {
                    matched += 1
                }
            }
            
            while matched == dict.count {
                if end - start + 1 < minLength {
                    minLength = end - start + 1
                    subStringStart = start
                }
                
                let c = strings[start]
                if let count = dict[c] {
                    if count == 0 {
                        matched -= 1
                    }
                    dict[c] = count + 1
                }
                start += 1
            }
        }
        return subStringStart == -1 ? "" : String(strings[subStringStart..<subStringStart+minLength])
    }
}