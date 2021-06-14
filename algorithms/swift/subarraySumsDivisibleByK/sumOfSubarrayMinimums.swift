/*
 974. Subarray Sums Divisible by K

 Given an array A of integers, return the number of (contiguous, non-empty) subarrays that have a sum divisible by K.


 Example 1:

 Input: A = [4,5,0,-2,-3,1], K = 5
 Output: 7
 Explanation: There are 7 subarrays with a sum divisible by K = 5:
 [4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]


 Note:

 1. 1 <= A.length <= 30000
 2. -10000 <= A[i] <= 10000
 3. 2 <= K <= 10000

 https://leetcode.com/problems/subarray-sums-divisible-by-k/
 explanation: https://leetcode.com/problems/subarray-sums-divisible-by-k/discuss/217980/Java-O(N)-with-HashMap-and-prefix-Sum
 */
class Solution {
    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        guard A.count > 0 else { return 0 }
        var array = [Int](repeating: 0, count: K)
        mods[0] = 1
        var count = 0, sum = 0
        for a in A {
            sum = (sum + a) % K
            // because -1 % 5 = -1,
            // but we need the positive mod 4
            if sum < 0 { sum += K }
            count += mods[sum]
            mods[sum] += 1
        }
        return count
    }
}
