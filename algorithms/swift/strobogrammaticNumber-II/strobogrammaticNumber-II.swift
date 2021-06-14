/*
247. Strobogrammatic Number II

A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

Find all strobogrammatic numbers that are of length = n.

Example:

Input:  n = 2
Output: ["11","69","88","96"]

https://leetcode.com/problems/strobogrammatic-number-ii/
*/
class Solution {
    func findStrobogrammatic(_ n: Int) -> [String] {
        return helper(n, n)
    }
    
    private func helper(_ n: Int, _ m: Int) -> [String] {
        if n == 0 { return [""] }
        if n == 1 { return ["0", "1", "8"] }
        
        let prev = helper(n-2, m) // avoid leading 0
        var result = [String]()
        
        for s in prev {
            if n != m { result.append("0" + s + "0") }
            result.append("1" + s + "1")
            result.append("6" + s + "9")
            result.append("9" + s + "6")
            result.append("8" + s + "8")
        }
        
        return result
    }
}