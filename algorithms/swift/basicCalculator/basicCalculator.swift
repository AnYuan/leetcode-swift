/*
Implement a basic calculator to evaluate a simple expression string.

The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .

Example 1:

Input: "1 + 1"
Output: 2

Example 2:

Input: " 2-1 + 2 "
Output: 3

Example 3:

Input: "(1+(4+5+2)-3)+(6+8)"
Output: 23

Note:
* You may assume that the given expression is always valid.
* Do not use the eval built-in library function.

*/

func calculate(_ s: String) -> Int {

    let cs: [Character] = Array(s)
    let ss = cs.map { String($0) }

    var operators = [String]() // operator stack
    var nums = [Int]() // numbers stack
    var current: Int = -1


    for i in 0..<ss.count { // numbers
        if let n = Int(ss[i]) {
            if current == -1 { current = n}
            else { current = current * 10 + n }

        } else if ss[i] == " " {
            continue
        } else {// operators
            if current != -1 {
                nums.append(current)
                current = -1
            }

            // calculate
            if let op = operators.last, op != "(", ss[i] != "(" {
                operators.popLast()
                if let b = nums.popLast(), let a = nums.popLast() {
                    nums.append(eval(a, b, op))
                }
            }
            if ss[i] == ")" {
                operators.popLast()
            } else {
                operators.append(ss[i])
            }
        }
    }

    if current != -1 { nums.append(current) }
    if operators.count > 0 {
        if let op = operators.last {
            operators.popLast()
            if let b = nums.popLast(), let a = nums.popLast() {
                nums.append(eval(a, b, op))
            }
        }
    }

    return nums.last!
}

func eval(_ a: Int, _ b: Int, _ op: String) -> Int {
    var result: Int
    if op == "+" {
        result = a + b
    } else if op == "-" {
        result = a - b
    } else {
        result = 0
    }
    return result
}



// Test Cases
calculate("1")
calculate("123")
calculate("1 + 1")
calculate("2-1 + 2")
calculate("10+11")
calculate("(1+(4+5+2)-3)+(6+8)")
calculate("1-(3-5)")
calculate("(123)")
calculate("1-(3+5-2+(3+19-(3-1-4+(9-4-(4-(1+(3)-2)-5)+8-(3-5)-1)-4)-5)-4+3-9)-4-(3+2-5)-10")
