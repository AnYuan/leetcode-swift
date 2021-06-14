/*
767. Reorganize String
Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.

If possible, output any possible result.  If not possible, return the empty string.

Example 1:

Input: S = "aab"
Output: "aba"
Example 2:

Input: S = "aaab"
Output: ""

Note:

* S will consist of lowercase letters and have length in range [1, 500].

https://leetcode.com/problems/reorganize-string/
https://www.educative.io/courses/grokking-the-coding-interview/xV7wx4o8ymB
*/
class Solution {
    func reorganizeString(_ S: String) -> String {
        let n = S.count
        
        guard n > 1 else { return S }
        
        let tuples = S.map { ($0, 1) }
        var counts = Dictionary(tuples, uniquingKeysWith: +)
        
        let (char, count) = counts.max { $0.1 < $1.1 }!
        
        guard count <= (n + 1) / 2 else { return "" }
        
        var result: [Character] = Array(repeating: " ", count: n)
        var i = 0
        
        for _ in 0..<count {
            result[i] = char
            i += 2
        }
        
        counts[char] = nil
        
        for (char, count) in counts {
            for _ in 0..<count {
                if i >= n { i = 1 }
                
                result[i] = char
                i += 2
            }
        }
        
        return String(result)            
    }
}