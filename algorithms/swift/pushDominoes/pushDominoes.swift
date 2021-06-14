/*
 838. Push Dominoes

 There are N dominoes in a line, and we place each domino vertically upright.

In the beginning, we simultaneously push some of the dominoes either to the left or to the right.



After each second, each domino that is falling to the left pushes the adjacent domino on the left.

Similarly, the dominoes falling to the right push their adjacent dominoes standing on the right.

When a vertical domino has dominoes falling on it from both sides, it stays still due to the balance of the forces.

For the purposes of this question, we will consider that a falling domino expends no additional force to a falling or already fallen domino.

Given a string "S" representing the initial state. S[i] = 'L', if the i-th domino has been pushed to the left; S[i] = 'R', if the i-th domino has been pushed to the right; S[i] = '.', if the i-th domino has not been pushed.

Return a string representing the final state. 

Example 1:

Input: ".L.R...LR..L.."
Output: "LL.RR.LLRRLL.."
Example 2:

Input: "RR.L"
Output: "RR.L"
Explanation: The first domino expends no additional force on the second domino.

Note:

1.0 <= N <= 10^5
2.String dominoes contains only 'L', 'R' and '.'

https://leetcode.com/problems/push-dominoes/
 */
class Solution {
    func pushDominoes(_ dominoes: String) -> String {

        let N = dominoes.length
        var counter = [Int](repeating: 0, count: N)
        let chars = Array(dominoes)
        var current = 0
        // right to left
        for index in 0..<N {
            if chars[index] == "R" {
                current = N
            } else if chars[index] == "L" {
                current = 0
            } else {
                current = max(current-1, 0)
            }
            counter[index] += current
        }

        // left to right
        current = 0
        for index in (0..<N).reversed() {
            if chars[index] == "L" {
                current = N
            } else if chars[index] == "R" {
                current = 0
            } else {
                current = max(current-1, 0)
            }
            counter[index] -= current
        }

        var result = [Character]()
        for value in counter {
            if value == 0 {
                result.append(".")
            } else if value > 0 {
                result.append("R")
            } else {
                result.append("L")
            }
        }
        return String(result)
    }
}
