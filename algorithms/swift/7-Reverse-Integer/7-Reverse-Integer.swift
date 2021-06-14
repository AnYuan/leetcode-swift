/*
7. Reverse Integer

Given a 32-bit signed integer, reverse digits of an integer.

Note:
Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

 

Example 1:

Input: x = 123
Output: 321

Example 2:

Input: x = -123
Output: -321

Example 3:

Input: x = 120
Output: 21

Example 4:

Input: x = 0
Output: 0

 

Constraints:

    -231 <= x <= 231 - 1

https://leetcode.com/problems/reverse-integer/
*/
class Solution {
    func reverse(_ x: Int) -> Int {
        var result = 0
        var current = x
        while current != 0 {
            let d = current % 10
            current /= 10
            result = 10 * result + d
            if result > Int32.max || result < Int32.min {
                return 0
            }
        }
        return result
    }
}