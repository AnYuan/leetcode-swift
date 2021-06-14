/*
340. Longest Substring with At Most K Distinct Characters

Given a string, find the length of the longest substring T that contains at most k distinct characters.

Example 1:

Input: s = "eceba", k = 2
Output: 3
Explanation: T is "ece" which its length is 3.
Example 2:

Input: s = "aa", k = 1
Output: 2
Explanation: T is "aa" which its length is 2.

https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/
*/
class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var dict = [Character: Int]()
        var start = 0
        var result = 0
        let strings = Array(s)
        for end in 0..<strings.count {
            dict[strings[end], default: 0] += 1
            while dict.count > k {
                if let count = dict[strings[start]] {
                    if count == 1 {
                        dict[strings[start]] = nil
                    } else {
                        dict[strings[start]] = count - 1
                    }
                    
                    // move window left
                    start += 1
                }
            }
            
            result = max(result, end - start + 1)
        }
        return result
    }
}