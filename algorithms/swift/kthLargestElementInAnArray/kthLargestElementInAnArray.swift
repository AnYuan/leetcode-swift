/*

 215. Kth Largest Element in an Array


 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Example 1:

 Input: [3,2,1,5,6,4] and k = 2
 Output: 5


 Example 2:

 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4

 Note:

 You may assume k is always valid, 1 ≤ k ≤ array's length.


 https://leetcode.com/problems/kth-largest-element-in-an-array/
 */
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let k = nums.count - k
        var lo = 0
        var hi = nums.count - 1
        while lo < hi {
            let i = partition(&nums, lo, hi)
            if i == k {
                //found
                break
            } else if i > k {
                hi = i - 1
            } else {
                lo = i + 1
            }
        }
        return nums[k]
    }

    func partition(_ nums: inout [Int], _ lo: Int, _ hi: Int) -> Int {
        var i = lo + 1
        var j = hi
        // using lo as pivot index
        while true {
            // i -->
            while i < hi, nums[i] < nums[lo] {
                i += 1
            }
            // <-- j 
            while j > lo, nums[lo] < nums[j] {
                j -= 1
            }
            // overlap
            if i >= j {
                break
            }
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
        // since we minus j before leave the outter while loop,
        // j from [p, |<---lower--->|j<---greater--->|]
        // to [p, |<---lower--->j|<---greater--->|]
        // so we swap p and j
        // [|<---lower--->|p|<---greater--->|]
        nums.swapAt(lo, j)
        return j
    }
}
