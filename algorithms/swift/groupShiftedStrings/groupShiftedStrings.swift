/*
249. Group Shifted Strings

Given a string, we can "shift" each of its letter to its successive letter, for example: "abc" -> "bcd". We can keep "shifting" which forms the sequence:

"abc" -> "bcd" -> ... -> "xyz"

Given a list of strings which contains only lowercase alphabets, group all strings that belong to the same shifting sequence.

Example:

Input: ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"],
Output: 
[
  ["abc","bcd","xyz"],
  ["az","ba"],
  ["acef"],
  ["a","z"]
]

https://leetcode.com/problems/group-shifted-strings/
*/
class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strings {
            let p = s.pattern
            dict[p, default: [String]()] += [s]
        }
        return Array(dict.values)
    }
}

extension String {
    var pattern: String {
        let asciiValue = unicodeScalars.map({Int($0.value)})
        let diffValue = asciiValue.map { v in
            (26 + (v - asciiValue[0])) % 26
        }
        return diffValue.reduce("", { $0 + " \($1)"})
    }
}