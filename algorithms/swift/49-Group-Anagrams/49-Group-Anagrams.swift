/*
49. Group Anagrams

Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]

Note:

    All inputs will be in lowercase.
    The order of your output does not matter.

https://leetcode.com/problems/group-anagrams/
*/
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard !strs.isEmpty else { return [[String]]() }
        var dict = [String: [String]]()
        for i in 0..<strs.count {
            let key = String(Array(strs[i]).sorted())
            dict[key, default: [String]()].append(strs[i])
        }
        return Array(dict.values)
    }
}