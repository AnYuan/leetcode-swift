/*
246. Strobogrammatic Number
A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

Write a function to determine if a number is strobogrammatic. The number is represented as a string.

Example 1:

Input:  "69"
Output: true

Example 2:

Input:  "88"
Output: true

Example 3:

Input:  "962"
Output: false

https://leetcode.com/problems/strobogrammatic-number/
*/
class Solution {
    func isStrobogrammatic(_ num: String) -> Bool {
        var out = ""
        for n in num.reversed() {
            if let match = map(n) {
                out += match
            }
        }
        return num == out
    }
    
    
    func map(_ num: Character) -> String? {
        switch num {
            case "0": return "0"
            case "1": return "1"
            case "8": return "8"
            case "6": return "9"
            case "9": return "6"
            default: return nil
        }
    }
}