/*
 907. Sum of Subarray Minimums

 Given an array of integers A, find the sum of min(B), where B ranges over every (contiguous) subarray of A.

 Since the answer may be large, return the answer modulo 10^9 + 7.

 Example 1:

 Input: [3,1,2,4]
 Output: 17
 Explanation: Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4].
 Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.  Sum is 17.

 Note:

 1. 1 <= A.length <= 30000
 2. 1 <= A[i] <= 30000

 https://leetcode.com/problems/sum-of-subarray-minimums/

 explanation: https://leetcode.com/problems/sum-of-subarray-minimums/discuss/178876/stack-solution-with-very-detailed-explanation-step-by-step
 */
func sumSubarrayMins(_ A: [Int]) -> Int {
    guard !A.isEmpty else { return 0 }
    var preStack = [Int]() // monotone stack using to store index
    var nextStack = [Int]()

    // left is for the distance to previous less element
    var left = A
    // right is for the distance to next less element
    var right = A

    // init
    for i in A.indices {
        left[i] = i + 1
        right[i] = A.count - i
    }

    for i in A.indices {
        // for previous less
        while !preStack.isEmpty, A[preStack.last!] > A[i] {
            preStack.popLast()
        }
        left[i] = preStack.isEmpty ? i + 1 : i - preStack.last!
        preStack.append(i)
        // for next less
        while !nextStack.isEmpty, A[nextStack.last!] > A[i] {
            right[nextStack.last!] = i - nextStack.last!
            nextStack.popLast()
        }
        nextStack.append(i)
    }
    var result = 0
    let mod = Int(1e9) + 7
    for i in A.indices {
        result = (result + A[i] * left[i] * right[i]) % mod
    }
    return result
}
