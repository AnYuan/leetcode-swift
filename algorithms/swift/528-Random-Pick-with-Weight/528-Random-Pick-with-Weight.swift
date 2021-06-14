/*
528. Random Pick with Weight

Given an array w of positive integers, where w[i] describes the weight of index i, write a function pickIndex which randomly picks an index in proportion to its weight.

Note:

    1 <= w.length <= 10000
    1 <= w[i] <= 10^5
    pickIndex will be called at most 10000 times.

Example 1:

Input: 
["Solution","pickIndex"]
[[[1]],[]]
Output: [null,0]

Example 2:

Input: 
["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
[[[1,3]],[],[],[],[],[]]
Output: [null,0,1,1,1,0]

Explanation of Input Syntax:

The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array w. pickIndex has no arguments. Arguments are always wrapped with a list, even if there aren't any.

https://leetcode.com/problems/random-pick-with-weight/
*/
class Solution {
    var sums = [Int]()
    init(_ w: [Int]) {
        sums = w
        for i in 1..<w.count {
            sums[i] += sums[i-1];
        }
    }

    func pickIndex() -> Int {
        let idx = Int.random(in: 0..<sums[sums.count-1]) + 1
        var left = 0, right = sums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if sums[mid] == idx { return mid }
            else if sums[mid] < idx { left = mid + 1 }
            else { right = mid }
        }
        return left
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */