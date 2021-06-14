/*
 Implement pow(x, n), which calculates x raised to the power n (xn).

e.g. 1

Input: 2.00000, 10
Output: 1024.00000

e.g. 2

Input: 2.10000, 3
Output: 9.26100

e.g. 3

Input: 2.00000, -2
Output: 0.25000
Explanation: 2-2 = 1/22 = 1/4 = 0.25

https://leetcode.com/problems/powx-n/

*/

class Solution {
    var memo = [Int:Double]()

    func myPow(_ x: Double, _ n: Int) -> Double {

        // edge and base case
        if x == 0 { return Double(0) }
        if x == 1 { return Double(1) }

        if n == 0 { return Double(1) }
        if n == 1 { return Double(x) }

        if n == -1 { return Double(1/x) }

        // n can be negative
        let index = abs(n)
        if let m = memo[index] { return m }
        // recursivly call myPow
        var result = myPow(x, n/2)

        result =  result * result

        if index % 2 == 1 {
            var factor = x
            if n < 0 {
                factor = 1 / factor
            }
            result = result * factor
        }
        // memo current result
        memo[index] = result

        return result
    }
}
