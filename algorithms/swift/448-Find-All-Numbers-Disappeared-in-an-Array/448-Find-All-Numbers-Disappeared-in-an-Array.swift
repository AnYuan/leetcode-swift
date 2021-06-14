/*
 448. Find All Numbers Disappeared in an Array

 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements of [1, n] inclusive that do not appear in this array.

 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

 Example:

 Input:
 [4,3,2,7,8,2,3,1]

 Output:
 [5,6]


 */
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        var nums = nums
        var i = 0
        while i < nums.count {
            let j = nums[i] - 1
            if nums[i] != nums[j] {
                nums.swapAt(i, j)
            } else {
                i += 1
            }
        }
                        
        var result = [Int]()
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                result.append(i+1)
            }
        }
        
        return result
    }
}
