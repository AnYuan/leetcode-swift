/*
Given a non-negative integer num represented as a string, 
remove k digits from the number so that the new number is the smallest possible.

Note:
* The length of num is less than 10002 and will be ≥ k.
* The given num does not contain any leading zero.

Example 1:

Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.

Example 2:

Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.

Example 3:

Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.

https://leetcode.com/problems/remove-k-digits/solution/
*/
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var cs = [Character](num)
        guard num.count > k else { return "0" }
        var stack = [Character]()
        var k = k

        for c in cs {
            while !stack.isEmpty, k > 0, stack[stack.endIndex-1] > c {
                stack.removeLast()
                k -= 1
            }
            stack.append(c)
        }
        
        // remaining k
        for i in 0..<k {
            stack.removeLast()
        }
        
        // remove leading zero
        while let c = stack.first, c == "0" {
            stack.removeFirst()
        }
        
        return stack.isEmpty ? "0" : String(stack)
    }
}
