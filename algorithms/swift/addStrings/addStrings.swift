/*
415. Add Strings

Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

Note:

    The length of both num1 and num2 is < 5100.
    Both num1 and num2 contains only digits 0-9.
    Both num1 and num2 does not contain any leading zero.
    You must not use any built-in BigInteger library or convert the inputs to integer directly.

https://leetcode.com/problems/add-strings/
*/

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var carry = 0
        let c1:[Character] = [Character](num1).reversed()
        let c2:[Character] = [Character](num2).reversed()
        var result = [String]()
        let length = min(c1.count, c2.count)
        for i in 0..<length {
            let n1 = Int(String(c1[i]))!
            let n2 = Int(String(c2[i]))!
            result.append(String((n1 + n2 + carry) % 10))
            carry = (n1 + n2 + carry) / 10
        }
        let tmp: [Character] = c1.count > c2.count ? c1 : c2
        
        for i in length..<abs(c1.count-c2.count)+length {
            let num = Int(String(tmp[i]))! + carry                        
            result.append(String(num % 10))
            carry = num / 10
        }
        
        if carry == 1 {
            result.append(String(carry))
        }
        return result.reversed().joined()
    }
}