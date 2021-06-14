/*
 880. Decoded String at Index

 An encoded string S is given.  To find and write the decoded string to a tape, the encoded string is read one character at a time and the following steps are taken:

If the character read is a letter, that letter is written onto the tape.
If the character read is a digit (say d), the entire current tape is repeatedly written d-1 more times in total.
Now for some encoded string S, and an index K, find and return the K-th letter (1 indexed) in the decoded string.

Example 1:

Input: S = "leet2code3", K = 10
Output: "o"
Explanation:
The decoded string is "leetleetcodeleetleetcodeleetleetcode".
The 10th letter in the string is "o".
Example 2:

Input: S = "ha22", K = 5
Output: "h"
Explanation:
The decoded string is "hahahaha".  The 5th letter is "h".
Example 3:

Input: S = "a2345678999999999999999", K = 1
Output: "a"
Explanation:
The decoded string is "a" repeated 8301530446056247680 times.  The 1st letter is "a".

Note:

  1. 2 <= S.length <= 100
  2. S will only contain lowercase letters and digits 2 through 9.
  3. S starts with a letter.
  4. 1 <= K <= 10^9
  5. The decoded string is guaranteed to have less than 2^63 letters.

  https://leetcode.com/problems/decoded-string-at-index/
 */
class Solution {
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        let input:[Character] = Array(S)
        var count = 0 // character count
        var K = K
        var index = 0
        for c in input {
            if c.isNumber {
                count *= c.wholeNumberValue!
            } else {
                count += 1
            }
            index += 1
            if K <= count { break }
        }

        for j in (0..<index).reversed() {
            let cc = input[j]
            if cc.isNumber {
                count /= cc.wholeNumberValue!
                K %= count
            } else {
                if K == 0 || K == count {
                    return String(cc)
                } else {
                    count -= 1
                }
            }
        }
        return ""
    }
}
