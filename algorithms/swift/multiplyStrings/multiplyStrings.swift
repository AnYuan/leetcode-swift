/*
43. Multiply Strings

Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Example 1:

Input: num1 = "2", num2 = "3"
Output: "6"

Example 2:

Input: num1 = "123", num2 = "456"
Output: "56088"

Note:

    The length of both num1 and num2 is < 110.
    Both num1 and num2 contain only digits 0-9.
    Both num1 and num2 do not contain any leading zero, except the number 0 itself.
    You must not use any built-in BigInteger library or convert the inputs to integer directly.

https://leetcode.com/problems/multiply-strings/
https://leetcode.com/problems/multiply-strings/discuss/17769/One-Easy-solution-with-C%2B%2B
*/
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        var c1 = [Character](num1)
        var c2 = [Character](num2)
        let len1 = c1.count
        let len2 = c2.count

        var result = [Int](repeating: 0, count: len1 + len2)
        var carry: Int
        for i in (0..<len1) {
            carry = 0
            for j in (0..<len2) {
                let d1 = c1[len1-i-1].wholeNumberValue!
                let d2 = c2[len2-j-1].wholeNumberValue!
                var tmp = d1 * d2 + carry + result[i+j]
                carry = tmp / 10
                result[i+j] = tmp % 10
            }
            if carry > 0 {
                result[i+len2] += carry
            }
        }
        
        result = result.reversed()
        
        var start = 0
        while result[start] == 0 {
            start += 1
        }

        return result[start..<result.count].map { String($0) }.joined()
    }
}