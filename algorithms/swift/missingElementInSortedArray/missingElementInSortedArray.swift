/*
1060. Missing Element in Sorted Array

Given a sorted array A of unique numbers, find the K-th missing number starting from the leftmost number of the array.

 

Example 1:

Input: A = [4,7,9,10], K = 1
Output: 5
Explanation: 
The first missing number is 5.

Example 2:

Input: A = [4,7,9,10], K = 3
Output: 8
Explanation: 
The missing numbers are [5,6,8,...], hence the third missing number is 8.

Example 3:

Input: A = [1,2,4], K = 3
Output: 6
Explanation: 
The missing numbers are [3,5,6,7,...], hence the third missing number is 6.

 

Note:

    1 <= A.length <= 50000
    1 <= A[i] <= 1e7
    1 <= K <= 1e8

https://leetcode.com/problems/missing-element-in-sorted-array/
*/
class Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        var lo = 0
        var hi = nums.count
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            // missing number is at left side
            if nums[mid] - mid >= nums[0] + k {
                hi = mid
            } else {
                // missing number is at right side
                lo = mid + 1
            }
        }
        return nums[0] + lo + k - 1
    }
}

class Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        
        var k = k
        
        for i in 0..<nums.count-1 {
            var first = nums[i]
            let sec = nums[i+1]
            
            var diff = sec - first - 1 
            while k != 0 && diff != 0 {
                k -= 1
                diff -= 1
                first += 1
            }
            
            if k == 0 {
                return first    
            }
        }
        
        if k != 0 {
            return nums[nums.count - 1] + k
        }
        
        return -1
    }
}