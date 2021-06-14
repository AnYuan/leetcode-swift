/*
 414. Third Maximum Number

 Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).

 Example 1:
 Input: [3, 2, 1]

 Output: 1

 Explanation: The third maximum is 1.
 Example 2:
 Input: [1, 2]

 Output: 2

 Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
 Example 3:
 Input: [2, 2, 3, 1]

 Output: 1

 Explanation: Note that the third maximum here means the third maximum distinct number.
 Both numbers with value 2 are both considered as second maximum.

 https://leetcode.com/problems/third-maximum-number/
 */
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var top3 = Set<Int>()
        for num in nums {
            top3.insert(num)
            if top3.count > 3, let min = top3.min() {
                top3.remove(min)
            }
        }
        return (top3.count == 3) ? top3.min()! : top3.max()!
    }
}
