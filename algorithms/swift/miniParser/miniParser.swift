/*
 385. Mini Parser

 Given a nested list of integers represented as a string, implement a parser to deserialize it.

 Each element is either an integer, or a list -- whose elements may also be integers or other lists.

 Note: You may assume that the string is well-formed:

 String is non-empty.
 String does not contain white spaces.
 String contains only digits 0-9, [, - ,, ].

 Example 1:

 Given s = "324",

 You should return a NestedInteger object which contains a single integer 324.

 Example 2:

 Given s = "[123,[456,[789]]]",

 Return a NestedInteger object containing a nested list with 2 elements:

 1. An integer containing value 123.
 2. A nested list containing two elements:
   i.  An integer containing value 456.
   ii. A nested list with one element:
     a. An integer containing value 789.


https://leetcode.com/problems/mini-parser/
 */
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func deserialize(_ s: String) -> NestedInteger {

        guard !s.isEmpty else { return NestedInteger() }

        let result = NestedInteger()
        var chars = Array(s)
        var stack = [NestedInteger]()
        var idx = 0
        var sign = 1
        while idx < chars.count {
            let char = chars[idx]
            if char == "[" {
                stack.append(NestedInteger())
            } else if char >= "0" && char <= "9" {
                var number = Int(String(chars[idx]))!
                while idx + 1 < chars.count && (chars[idx + 1] >= "0" && chars[idx + 1] <= "9") {
                    number = number*10 + Int(String(chars[idx + 1]))!
                    idx += 1
                }
                number *= sign
                if !stack.isEmpty {
                    stack.last!.add(NestedInteger(number))
                } else {
                    stack.append(NestedInteger(number))
                }
                sign = 1
            } else if char == "-" {
                sign = -1
            } else if char == "]" && stack.count > 1 {
                let num = stack.removeLast()
                stack.last!.add(num)
            }
            idx += 1
        }
        return stack.first!
    }
}
