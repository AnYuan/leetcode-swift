//
//  findPivotIndex.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Given an array of integers nums, write a method that returns the "pivot" index of this array.
 
 We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.
 
 If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.
 
 https://leetcode.com/articles/find-pivot-index/
 */

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        guard nums.count > 1 else { return nums.isEmpty ? -1 : 0 }
        
        let sum = nums.reduce(0, +)
        
        if sum - nums[0] == 0 { return 0 }
        
        var leftTotal = 0
        for i in 1..<nums.count {
            leftTotal += nums[i-1]
            if (sum - leftTotal - nums[i]) == leftTotal {
                return i;
            }
        }
        
        return -1
    }
}
