/*
658. Find K Closest Elements
Given a sorted array, two integers k and x, find the k closest elements to x in the array. The result should also be sorted in ascending order. If there is a tie, the smaller elements are always preferred.

Example 1:
Input: [1,2,3,4,5], k=4, x=3
Output: [1,2,3,4]
Example 2:
Input: [1,2,3,4,5], k=4, x=-1
Output: [1,2,3,4]
Note:
The value k is positive and will always be smaller than the length of the sorted array.
Length of the given array is positive and will not exceed 104
Absolute value of elements in the array and x will not exceed 104
UPDATE (2017/9/19):
The arr parameter had been changed to an array of integers (instead of a list of integers). Please reload the code definition to get the latest changes.

https://leetcode.com/problems/find-k-closest-elements/
*/
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let index = binarySearch(arr, x)
        var left = index
        var right = index + 1
        var result = [Int]()
        for _ in 0..<k {
            if left >= 0, right < arr.count {
                let diff1 = abs(x - arr[left])
                let diff2 = abs(x - arr[right])
                if diff1 <= diff2 {
                    result.insert(arr[left], at:0)
                    left -= 1
                } else{
                    result.append(arr[right])
                    right += 1
                }
            } else if left >= 0 {
                result.insert(arr[left], at:0)
                left -= 1
            } else if right < arr.count {
                result.append(arr[right])
                right += 1
            }
        }
        return result
    }
    
    private func binarySearch(_ arr: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = arr.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if arr[mid] == target {
                return mid
            } else if arr[mid] > target {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return lo - 1 > 0 ? lo - 1 : lo
    }
}