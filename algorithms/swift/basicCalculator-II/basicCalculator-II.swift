/*
227. Basic Calculator II

Implement a basic calculator to evaluate a simple expression string.

The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.

Example 1:

Input: "3+2*2"
Output: 7

Example 2:

Input: " 3/2 "
Output: 1

Example 3:

Input: " 3+5 / 2 "
Output: 5

Note:

    You may assume that the given expression is always valid.
    Do not use the eval built-in library function.

https://leetcode.com/problems/basic-calculator-ii/
*/
class Solution {
    func calculate(_ s: String) -> Int {
        
        let ss = [Character](s)
        var result = [Int]() // stack
        var num = ""
        var op: Character = "+"
        for i in 0..<ss.count {
            if ss[i].isNumber {
                num.append(String(ss[i]))
            } 
            if (!ss[i].isNumber && ss[i] != " ") || i == ss.count-1 {
                if op == "+" {
                    result.append(Int(num)!)
                } else if op == "-" {
                    result.append(-Int(num)!)
                } else if op == "*" {
                    let n = result.removeLast()
                    result.append(n * Int(num)!)
                } else if op == "/" {
                    let n = result.removeLast()
                    result.append(n / Int(num)!)
                }
                num = ""
                op = ss[i]
            }
        }
        return result.reduce(0, +)
    }
}