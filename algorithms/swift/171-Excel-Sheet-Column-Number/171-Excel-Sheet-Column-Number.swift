/*
171. Excel Sheet Column Number

Given a column title as appear in an Excel sheet, return its corresponding column number.

For example:

    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...

Example 1:

Input: "A"
Output: 1

Example 2:

Input: "AB"
Output: 28

Example 3:

Input: "ZY"
Output: 701

 

Constraints:

    1 <= s.length <= 7
    s consists only of uppercase English letters.
    s is between "A" and "FXSHRXW".

https://leetcode.com/problems/excel-sheet-column-number/
*/
class Solution {
    func titleToNumber(_ s: String) -> Int {
        var result = 0
        var mult = 1
        for c in s.reversed(){
            result += mult * Int(c.asciiValue! - 64)
            mult *= 26
        }
        return result
    }
}