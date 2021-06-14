/*
 Implement int sqrt(int x).

 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

 Example 1:
 Input: 4
 Output: 2

 Example 2:

 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since 
 the decimal part is truncated, 2 is returned.

 https://leetcode.com/problems/sqrtx/
 */

func mySqrt(_ x: Int) -> Int {
    guard x > 1 else { return x }

    var lo = 1
    var hi = x

    while lo <= hi {
        var mid = lo + (hi - lo) / 2
        var result = mid * mid
        if result == x {
            return mid
        } else if result > x {
            hi = mid - 1
        } else {
            lo = mid + 1
        }
    }

    return hi
}
