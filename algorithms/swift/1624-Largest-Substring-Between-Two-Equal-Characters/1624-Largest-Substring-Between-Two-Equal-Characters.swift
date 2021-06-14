/*
 1624. Largest Substring Between Two Equal Characters



Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.

A substring is a contiguous sequence of characters within a string.

 

Example 1:

Input: s = "aa"
Output: 0
Explanation: The optimal substring here is an empty substring between the two 'a's.

Example 2:

Input: s = "abca"
Output: 2
Explanation: The optimal substring here is "bc".

Example 3:

Input: s = "cbzxy"
Output: -1
Explanation: There are no characters that appear twice in s.

Example 4:

Input: s = "cabbac"
Output: 4
Explanation: The optimal substring here is "abba". Other non-optimal substrings include "bb" and "".

 

Constraints:

    1 <= s.length <= 300
    s contains only lowercase English letters.

https://leetcode.com/contest/weekly-contest-211/problems/largest-substring-between-two-equal-characters/
*/
class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var cs = [Character](s)
        var dict = [Character: [Int]]()
        for i in 0..<cs.count {
            dict[cs[i], default: [Int]()].append(i)
        }
        var result = -1
        for indexes in dict.values where indexes.count >= 2 {
            let start = indexes[0]
            let end = indexes[indexes.endIndex-1]
            result = max(end - start - 1, result)
        }
        return result
    }
}