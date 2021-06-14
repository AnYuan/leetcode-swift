/*
 442. Find All Duplicates in an Array

 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements that appear twice in this array.

 Could you do it without extra space and in O(n) runtime?

 Example:
 Input:
 [4,3,2,7,8,2,3,1]

 Output:
 [2,3]
 */

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var s = Set<Int>()
        for i in nums {
            if s.contains(i) {
                result.append(i)
            } else {
                s.insert(i)
            }
        }
        return result
    }
}
