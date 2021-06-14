/*
 821. Shortest Distance to a Character

 Given a string S and a character C, return an array of integers representing the shortest distance from the character C in the string.

 Example 1:

 Input: S = "loveleetcode", C = 'e'
 Output: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]


 Note:

 1.S string length is in [1, 10000].
 2.C is a single character, and guaranteed to be in string S.
 3.All letters in S and C are lowercase.

 https://leetcode.com/problems/shortest-distance-to-a-character/
 */
class Solution {
    func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        let chars = Array(S)
        let N = chars.count
        var result = Array(repeating: 0, count: N)
        var current = -N
        // left to right
        for (i,c) in chars.enumerated() {
            if C == c {
                current = i
            } else {
                result[i] = i - current
            }
        }

        //right to left
        for i in (0..<N).reversed() {
            if C == chars[i] {
                current = i
            } else {
                result[i] = min(result[i], abs(i - current))
            }
        }

        return result
    }
}
