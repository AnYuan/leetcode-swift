/*
1213. Intersection of Three Sorted Arrays

Given three integer arrays arr1, arr2 and arr3 sorted in strictly increasing order, return a sorted array of only the integers that appeared in all three arrays.

 

Example 1:

Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
Output: [1,5]
Explanation: Only 1 and 5 appeared in the three arrays.

 

Constraints:

    1 <= arr1.length, arr2.length, arr3.length <= 1000
    1 <= arr1[i], arr2[i], arr3[i] <= 2000

https://leetcode.com/problems/intersection-of-three-sorted-arrays/
*/
class Solution {
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for i in arr1 {
            dict[i, default: 0] += 1
        } 
        
        for j in arr2 {
            dict[j, default: 0] += 1
        }
  
        var result = [Int]()

        for k in arr3 {
            let v = dict[k, default: 0]
            if v == 2 {
                result.append(k)
            }
        }
        return result
    }
}