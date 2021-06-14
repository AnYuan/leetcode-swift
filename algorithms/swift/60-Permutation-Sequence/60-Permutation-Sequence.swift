/*
60. Permutation Sequence

The set [1,2,3,...,n] contains a total of n! unique permutations.

By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

    "123"
    "132"
    "213"
    "231"
    "312"
    "321"

Given n and k, return the kth permutation sequence.

Note:

    Given n will be between 1 and 9 inclusive.
    Given k will be between 1 and n! inclusive.

Example 1:

Input: n = 3, k = 3
Output: "213"

Example 2:

Input: n = 4, k = 9
Output: "2314"

https://leetcode.com/problems/permutation-sequence/
*/

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var nums: [Int] = []
        for i in 1...n {
            nums.append(i)
        }
        var result: String = ""
        backtracking(&nums, n, k, factorial(n - 1), &result)
        return result
    }
    
    func backtracking(_ nums: inout [Int], _ n: Int, _ k: Int, _ count: Int, _ result: inout String) {
        if nums.count == 1 {
            result += String(nums[0])
            return
        }
        
        var index = k / count
        var nextIndex = k % count
        
        if nextIndex == 0 {
            index -= 1
            nextIndex = count
        }
        
        result += String(nums.remove(at: index))
        backtracking(&nums, n - 1, nextIndex, count / (n - 1), &result)
    }
    
    func factorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 1 {
            result *= n
            n -= 1
        }
        return result
    }
}