/*
1234. Replace the Substring for Balanced String

You are given a string containing only 4 kinds of characters 'Q', 'W', 'E' and 'R'.

A string is said to be balanced if each of its characters appears n/4 times where n is the length of the string.

Return the minimum length of the substring that can be replaced with any other string of the same length to make the original string s balanced.

Return 0 if the string is already balanced.

 

Example 1:

Input: s = "QWER"
Output: 0
Explanation: s is already balanced.

Example 2:

Input: s = "QQWE"
Output: 1
Explanation: We need to replace a 'Q' to 'R', so that "RQWE" (or "QRWE") is balanced.

Example 3:

Input: s = "QQQW"
Output: 2
Explanation: We can replace the first "QQ" to "ER". 

Example 4:

Input: s = "QQQQ"
Output: 3
Explanation: We can replace the last 3 'Q' to make s = "QWER".

 

Constraints:

    1 <= s.length <= 10^5
    s.length is a multiple of 4
    s contains only 'Q', 'W', 'E' and 'R'.

https://leetcode.com/problems/replace-the-substring-for-balanced-string/
https://leetcode.com/problems/replace-the-substring-for-balanced-string/discuss/408978/JavaC%2B%2BPython-Sliding-Window
*/
class Solution {
    func balancedString(_ s: String) -> Int {
        var dict = [Character: Int]()
        let cs = [Character](s)
        let n = s.count
        let k = n / 4
        var result = n
        for c in s {
            dict[c, default: 0] += 1
        }
        
        var i = 0
        var j = 0
        while j < n {
            dict[cs[j], default: 0] -= 1
            while i < n, dict["Q", default: 0] <= k, dict["W", default: 0] <= k, dict["E", default: 0] <= k, dict["R", default: 0] <= k {
                result = min(result, j-i+1)
                dict[cs[i], default: 0] += 1
                i += 1
            }
            j += 1
        }
        return result
    }
}