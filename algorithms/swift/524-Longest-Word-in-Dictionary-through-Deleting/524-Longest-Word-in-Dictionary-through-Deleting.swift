/*
524. Longest Word in Dictionary through Deleting

 Given a string and a string dictionary, find the longest string in the dictionary that can be formed by deleting some characters of the given string. If there are more than one possible results, return the longest word with the smallest lexicographical order. If there is no possible result, return the empty string.

Example 1:

Input:
s = "abpcplea", d = ["ale","apple","monkey","plea"]

Output: 
"apple"

Example 2:

Input:
s = "abpcplea", d = ["a","b","c"]

Output: 
"a"

Note:

    All the strings in the input will only contain lower-case letters.
    The size of the dictionary won't exceed 1,000.
    The length of all the strings in the input won't exceed 1,000.

https://leetcode.com/problems/longest-word-in-dictionary-through-deleting/
*/
class Solution {
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        let chars = [Character](s)
        var result = ""
        var i = 0
        
        for dictWord in d {
            i = 0
            let dictWordChars = [Character](dictWord)
            for char in chars {
                if i < dictWordChars.count && char == dictWordChars[i] {
                    i += 1
                }
            }
            if i == dictWordChars.count && dictWordChars.count >= result.length {
                if dictWordChars.count > result.length || dictWord < result {
                    result = dictWord
                }
            }
        }
        
        return result
    }
}
