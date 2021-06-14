/*
438. Find All Anagrams in a String

Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

The order of output does not matter.

Example 1:

Input:
s: "cbaebabacd" p: "abc"

Output:
[0, 6]

Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".
Example 2:

Input:
s: "abab" p: "ab"

Output:
[0, 1, 2]

Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".

https://leetcode.com/problems/find-all-anagrams-in-a-string/
https://leetcode.com/problems/find-all-anagrams-in-a-string/discuss/92007/Sliding-Window-algorithm-template-to-solve-all-the-Leetcode-substring-search-problem.
*/
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var result = [Int]()
        var dict = [Character: Int]()
        var start = 0
        var matched = 0
        
        for c in p {
            dict[c, default: 0] += 1
        }
        
        let strings = Array(s)
        for end in 0..<strings.count {
            let c = strings[end]
            if let count = dict[c] {
                dict[c] = count - 1
                if count - 1 == 0 {
                    matched += 1
                }
            }
            
            if matched == dict.count {
                result.append(start)
            }
            
            if end >= p.length - 1 {
                let sc = strings[start]
                if let count = dict[sc] {
                    if count == 0 {
                        matched -= 1
                    }
                    dict[sc] = count + 1
                }
                start += 1
            }
        }
        return result
    }
}