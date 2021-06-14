/*

 456. 132 Pattern

 Given a sequence of n integers a1, a2, ..., an, a 132 pattern is a subsequence ai, aj, ak such that i < j < k and ai < ak < aj. Design an algorithm that takes a list of n numbers as input and checks whether there is a 132 pattern in the list.

 Note: n will be less than 15,000.

 Example 1:
 Input: [1, 2, 3, 4]

 Output: False

 Explanation: There is no 132 pattern in the sequence.

 Example 2:
 Input: [3, 1, 4, 2]

 Output: True

 Explanation: There is a 132 pattern in the sequence: [1, 4, 2].

 Example 3:

 Input: [-1, 3, 2, 0]

 Output: True

 Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].

 https://leetcode.com/problems/132-pattern/
 */

func find132pattern(_ nums: [Int]) -> Bool {

    guard nums.count > 2 else { return false }

    var m = Array(repeating: Int.max, count: nums.count)
    m[0] = nums[0]

    var stack = [Int]()

    for i in 1..<nums.count {
        m[i] = min(nums[i], m[i-1])
    }

    for j in (0..<nums.count).reversed() {

        if nums[j] > m[j] {
            if stack.isEmpty || stack.last! > nums[j] {
                stack.append(nums[j])
            }

            while let top = stack.last, top <= m[j] {
                stack.popLast()
            }

            if let top = stack.last, top > m[j] && top < nums[j] {
                return true
            }
        }
    }
    return false
}
