/*
29. Divide Two Integers

Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.

Return the quotient after dividing dividend by divisor.

The integer division should truncate toward zero.

Example 1:

Input: dividend = 10, divisor = 3
Output: 3

Example 2:

Input: dividend = 7, divisor = -3
Output: -2

Note:

    * Both dividend and divisor will be 32-bit signed integers.
    * The divisor will never be 0.
    * Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.

https://leetcode.com/problems/divide-two-integers/
https://leetcode.com/problems/divide-two-integers/discuss/13407/C%2B%2B-bit-manipulations
*/
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        
        if dividend == Int32.min, divisor == -1 {
            return Int(Int32.max)
        }
        
        var dvdSign = dividend < 0
        var dvsSign = divisor < 0
        
        let sign = dvdSign != dvsSign ? -1 : 1
        
        var dvd = abs(dividend)
        var dvs = abs(divisor)

        var result = 0
        while dvd >= dvs {
            var tmp = dvs
            var m = 1
            while (tmp << 1) <= dvd {
                tmp <<= 1
                m <<= 1
            }
            dvd -= tmp
            result += m
        }
        return sign * result
    }
}