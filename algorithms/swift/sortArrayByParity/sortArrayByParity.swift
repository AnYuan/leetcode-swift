/*
 905. Sort Array By Parity

 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.

 Example 1:

 Input: [3,1,2,4]
 Output: [2,4,3,1]
 The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.

 https://leetcode.com/problems/sort-array-by-parity/
 */

class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        guard A.count > 1 else { return A }
        var even = 0
        var odd = A.count-1
        var result = A
        while even < odd {

            if result[even] % 2 > result[odd] % 2 {
                result.swapAt(even, odd)
            }

            if result[even] % 2 == 0 {
                even += 1
            }

            if result[odd] % 2 == 1 {
                odd -= 1
            }
        }
        return result
    }
}
