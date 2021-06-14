/*
 3. Longest Substring Without Repeating Characters

 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 https://www.educative.io/courses/grokking-the-coding-interview/YMzBx1gE5EO
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var start = 0
        var dict = [Character: Int]() // character : lastIndex
        let strings = Array(s)
        for end in 0..<strings.count {
            let c = strings[end]
            
            if var index = dict[c] {
                // this is tricky; in the current window, we will not have any 'c' after its previous index
                // and if 'start' is already ahead of the last index of 'c', we'll keep 'start'
                start = max(start, index + 1)
            }
            
            dict[c] = end
            result = max(result, end - start + 1)
        }
        return result
    }
}
