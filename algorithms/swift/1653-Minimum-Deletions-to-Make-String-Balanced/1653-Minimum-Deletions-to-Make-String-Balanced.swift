/*
 1653. Minimum Deletions to Make String Balanced



You are given a string s consisting only of characters 'a' and 'b'​​​​.

You can delete any number of characters in s to make s balanced. s is balanced if there is no pair of indices (i,j) such that i < j and s[i] = 'b' and s[j]= 'a'.

Return the minimum number of deletions needed to make s balanced.

 

Example 1:

Input: s = "aababbab"
Output: 2
Explanation: You can either:
Delete the characters at 0-indexed positions 2 and 6 ("aababbab" -> "aaabbb"), or
Delete the characters at 0-indexed positions 3 and 6 ("aababbab" -> "aabbbb").

Example 2:

Input: s = "bbaaaaabb"
Output: 2
Explanation: The only solution is to delete the first two characters.

 

Constraints:

    1 <= s.length <= 105
    s[i] is 'a' or 'b'​​.

https://leetcode.com/contest/biweekly-contest-39/problems/minimum-deletions-to-make-string-balanced/
*/
/*
aababbab
presum means how many 'a' are in front of current character,
postsum means how many 'b' are behand of current character,
then we traverse the string, try to get the min value which is the result.
in this example, 
presum:  [0, 0, 0, 1, 1, 2, 3, 3]
postsum: [3, 2, 2, 1, 1, 1, 0, 0]

min value is 2
*/
class Solution {
    func minimumDeletions(_ s: String) -> Int {
        let cs = [Character](s)
        let n = cs.count
        guard n > 1 else {
            return 0
        }
        var postASum = [Int](repeating: 0, count: n)
        var preBSum = [Int](repeating: 0, count: n)
        for i in (0..<(n-1)).reversed() {
            let c = cs[i+1]
            if c == "a" {
                postASum[i] = postASum[i+1] + 1
            } else {
                postASum[i] = postASum[i+1]
            }
        }
        
        for i in 1..<n {
            let c = cs[i-1]
            if c == "b" {
                preBSum[i] = preBSum[i-1] + 1
            } else {
                preBSum[i] = preBSum[i-1]
            }
        }

        var result = Int.max
        for i in 0..<n {
            let c = cs[i]
            result = min(result, preBSum[i] + postASum[i])
        }
        return result
    }
}