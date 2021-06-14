//
//  2SumII.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 
 Note:
 
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 
 https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var left = 0
        var right = numbers.count-1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else {
                break
            }
        }
        return [left+1, right+1]
    }
}
