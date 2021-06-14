/*
 150. Evaluate Reverse Polish Notation

 Evaluate the value of an arithmetic expression in Reverse Polish Notation.

 Valid operators are +, -, *, /. Each operand may be an integer or another expression.

 Note:

 Division between two integers should truncate toward zero.
 The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.

 Example 1:

 Input: ["2", "1", "+", "3", "*"]
 Output: 9
 Explanation: ((2 + 1) * 3) = 9

 Example 2:

 Input: ["4", "13", "5", "/", "+"]
 Output: 6
 Explanation: (4 + (13 / 5)) = 6

 Example 3:

 Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
 Output: 22
 Explanation: 
 ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22

 https://leetcode.com/problems/evaluate-reverse-polish-notation/
 */
class Solution {

    private var nums = [Int]()

    func evalRPN(_ tokens: [String]) -> Int {
        for s in tokens {
            if s == "*" || s == "-" || s == "+" || s == "/" {
                let num1 = nums.removeLast()
                let num2 = nums.removeLast()
                if s == "/" {
                    nums.append(num2 / num1)
                } else if s == "-" {
                    nums.append(num2 - num1)
                } else if s == "*" {
                    nums.append(num1 * num2)
                } else {
                    nums.append(num1 + num2)
                }
            } else {
                nums.append(Int(s)!)
            }
        }
        return nums.removeLast()
    }
}
