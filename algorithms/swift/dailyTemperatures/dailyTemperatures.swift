/*
 739. Daily Temperatures

 Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

 For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

 Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].

 https://leetcode.com/problems/daily-temperatures/
 */
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var stack = [Int]()
        var result = [Int](repeating: 0, count: T.count)
        for i in 0..<T.count {
            while !stack.isEmpty && T[i] > T[stack[stack.endIndex-1]] {
                let idx = stack.removeLast()
                result[idx] = i - idx
            }
            stack.append(i)
        }
        return result
    }
}
