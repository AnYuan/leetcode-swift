/*
384. Shuffle an Array

Shuffle a set of numbers without duplicates.

Example:

// Init an array with set 1, 2, and 3.
int[] nums = {1,2,3};
Solution solution = new Solution(nums);

// Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
solution.shuffle();

// Resets the array back to its original configuration [1,2,3].
solution.reset();

// Returns the random shuffling of array [1,2,3].
solution.shuffle();

https://leetcode.com/problems/shuffle-an-array/
*/

class Solution {

    private let origin: [Int]
    init(_ nums: [Int]) {
        origin = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return origin
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var result = origin
        for i in 0..<result.count {
            let j = Int.random(in: i..<result.count)
            result.swapAt(i, j)             
        }
        return result
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */