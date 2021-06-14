/*
 560. Subarray Sum Equals K

 Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

 Example 1:
 Input:nums = [1,1,1], k = 2
 Output: 2
 Note:
 1.The length of the array is in range [1, 20,000].
 2.The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].

 https://leetcode.com/problems/subarray-sum-equals-k/
 */
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
                
        // Sliding window -- No, contains negative number
        // hashmap + preSum
        /*
            1. dict[sum[0,i - 1], frequency]
            2. sum[i, j] = sum[0, j] - sum[0, i - 1]    --> sum[0, i - 1] = sum[0, j] - sum[i, j]
                   k           sum      hashmap-key     -->  hashmap-key  =  sum - k
            3. now, we have k and sum.  
                  As long as we can find a sum[0, i - 1], we then get a valid subarray
                 which is as long as we have the hashmap-key,  we then get a valid subarray
            4. Why don't map.put(sum[0, i - 1], 1) every time ?
                  if all numbers are positive, this is fine
                  if there exists negative number, there could be preSum frequency > 1
        */
        var count = 0
        var sum = 0
        var dict = [Int:Int]()
        // when sum == k, we want increase count by 1
        dict[0] = 1
        for n in nums {
            sum += n
            if let val = dict[sum-k] {
                count += val
            }
            dict[sum, default:0] += 1
        }
        return count
    }
}
