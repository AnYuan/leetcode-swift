/*
 Given a positive integer num, write a function which returns True if num is a perfect square else False.

 Note: Do not use any built-in library function such as sqrt.

 Example 1:
 Input: 16
 Output: true

 Example 2:
 Input: 14
 Output: false

 https://leetcode.com/problems/valid-perfect-square/
 */

func isPerfectSquare(_ num: Int) -> Bool {

    guard num > 1 else { return true }

    var lo = 1
    var hi = num

    while lo <= hi {
        var mid = lo + (hi - lo) / 2
        var result = mid * mid
        if result == num {
            return true
        } else if result > num {
            hi = mid - 1
        } else {
            lo = mid + 1
        }
    }

    return false
}
