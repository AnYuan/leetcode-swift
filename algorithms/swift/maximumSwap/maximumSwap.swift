/*
670. Maximum Swap

 Given a non-negative integer, you could swap two digits at most once to get the maximum valued number. Return the maximum valued number you could get.

Example 1:

Input: 2736
Output: 7236
Explanation: Swap the number 2 and the number 7.

Example 2:

Input: 9973
Output: 9973
Explanation: No swap.

Note:

    The given number is in the range [0, 10^8]

https://leetcode.com/problems/maximum-swap/
*/
class Solution {
    func maximumSwap(_ num: Int) -> Int {
        guard num >= 10 else { return num }
        var chars = [Character](String(num))
        var last = [Int](repeating: 0, count: 10) // digit -> index
        for i in 0..<chars.count {
            last[chars[i].wholeNumberValue!] = i
        }
        
        for i in 0..<chars.count {
            for j in (0..<last.count).reversed() {
                if j > chars[i].wholeNumberValue!, last[j] > i {
                    chars.swapAt(i, last[j])
                    return Int(String(chars))!
                }
            }
        }
        return num
    }
}