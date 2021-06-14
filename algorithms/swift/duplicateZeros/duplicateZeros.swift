/*
1089. Duplicate Zeros

Given a fixed length array arr of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.

Note that elements beyond the length of the original array are not written.

Do the above modifications to the input array in place, do not return anything from your function.

 

Example 1:

Input: [1,0,2,3,0,4,5,0]
Output: null
Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]

Example 2:

Input: [1,2,3]
Output: null
Explanation: After calling your function, the input array is modified to: [1,2,3]

 

Note:

    1 <= arr.length <= 10000
    0 <= arr[i] <= 9

https://leetcode.com/problems/duplicate-zeros/
*/
class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        guard !arr.isEmpty else { return }
        let n = arr.count
        var index = 0
        var end = n - 1
        while index < n {
            if arr[index] == 0, index < n {
                arr.remove(at: end)
                arr.insert(0, at: index)
                index += 2
            } else {            
                index += 1
            }
        }
    }
}