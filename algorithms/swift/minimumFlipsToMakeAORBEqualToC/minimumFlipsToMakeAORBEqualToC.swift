/*
1318. Minimum Flips to Make a OR b Equal to c



Given 3 positives numbers a, b and c. Return the minimum flips required in some bits of a and b to make ( a OR b == c ). (bitwise OR operation).
Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

 

Example 1:

Input: a = 2, b = 6, c = 5
Output: 3
Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)

Example 2:

Input: a = 4, b = 2, c = 7
Output: 1

Example 3:

Input: a = 1, b = 2, c = 3
Output: 0

 

Constraints:

    1 <= a <= 10^9
    1 <= b <= 10^9
    1 <= c <= 10^9

https://leetcode.com/contest/weekly-contest-171/problems/minimum-flips-to-make-a-or-b-equal-to-c/
*/
class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var result = 0
        // max i is 30, since 10^9 in binary's length is 30
        for i in 0..<30 {
            let x = (a >> i) & 1
            let y = (b >> i) & 1
            let z = (c >> i) & 1
            if z == 1 {
                if x == 0, y == 0 {
                    result += 1
                }
            } else {
                /*
                *   a  |  0  |  1  |  1
                *   b  |  1  |  0  |  1
                *   c  |  0  |  0  |  0
                */
                result += (x + y)
            }
        }
        return result
    }
}