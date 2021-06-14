/*
347. Top K Frequent Elements
Given a non-empty array of integers, return the k most frequent elements.

Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Example 2:

Input: nums = [1], k = 1
Output: [1]
Note:

* You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
* Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

https://leetcode.com/problems/top-k-frequent-elements/
using quick selection, similar with 
https://leetcode.com/problems/kth-largest-element-in-an-array/
*/
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count >= 2 else { return [nums[0]] }
        var dict = [Int: Int]() // num: freq
        var freq = [(Int, Int)]() // (num, freq)
        for i in 0..<nums.count {
            dict[nums[i], default: 0] += 1
        }
        for (k, v) in dict {
            freq.append((k,v))
        }
        let n = freq.count
        let k = n - k
        var lo = 0
        var hi = n - 1
        while lo < hi {
            let p = partition(&freq, lo, hi)
            if p == k {
                break
            } else if p > k {
                hi = p - 1
            } else {
                lo = p + 1
            }
        }
        var result = [Int]()
        for i in k..<n {
            result.append(freq[i].0)
        }
        return result
    }
    
    private func partition(_ nums: inout [(Int,Int)], _ lo: Int, _ hi: Int) -> Int { 
        let p = nums[lo].1
        var i = lo + 1
        var j = hi
        
        while true {
            while i < hi, nums[i].1 < p {
                i += 1
            }
            while lo < j, p < nums[j].1 {
                j -= 1
            }
            if i >= j {
                break
            }
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
        nums.swapAt(lo, j)
        return j
    }
}
