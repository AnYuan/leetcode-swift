/*
159. Longest Substring with At Most Two Distinct Characters

Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.

Example 1:

Input: "eceba"
Output: 3
Explanation: t is "ece" which its length is 3.

Example 2:

Input: "ccaabbb"
Output: 5
Explanation: t is "aabbb" which its length is 5.

https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
*/
class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var cs = [Character](s)
        var result = 0
        var left = 0
        var set = Set<Character>()
        while left < cs.count {
            var right = left
            while right < cs.count {
                if !set.contains(cs[right]), set.count == 2 {
                    break
                } else {
                    set.insert(cs[right])
                }
                right += 1
            }
            result = max(result, right-left)
            set.remove(cs[left])
            left += 1
        }
        return result
    }
}