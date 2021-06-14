//
//  3Sum.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note: The solution set must not contain duplicate triplets.

 For example, given array S = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]

 https://leetcode.com/problems/3sum/
 */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sort = nums.sorted()
        var result = [[Int]]()
        for i in sort.indices where i < sort.count - 2 {
            if i > 0 && sort[i] == sort[i-1] {
                continue
            }
            var lo = i + 1
            var hi = sort.count - 1
            let sum = -sort[i]
            while lo < hi {
                if sort[lo] + sort[hi] == sum {
                    result.append([sort[i], sort[lo], sort[hi]])
                    while lo < hi, sort[lo] == sort[lo+1] {
                        lo += 1
                    }
                    while lo < hi, sort[hi] == sort[hi-1] {
                        hi -= 1
                    }
                    lo += 1
                    hi -= 1
                } else if sort[lo] + sort[hi] < sum {
                    lo += 1
                } else {
                    hi -= 1
                }
            }
        }
        return result
    }
}
