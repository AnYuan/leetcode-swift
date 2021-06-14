//
//  largestNumberAtLeastTwiceOfOthers.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation

/*
 In a given integer array nums, there is always exactly one largest element.
 
 Find whether the largest element in the array is at least twice as much as every other number in the array.
 
 If it is, return the index of the largest element, otherwise return -1.
 */
//https://leetcode.com/problems/largest-number-at-least-twice-of-others/description/

/*
 class Solution {
 func dominantIndex(_ nums: [Int]) -> Int {
 
 guard nums.count > 1 else {
 return nums.count == 1 ? 0 : -1
 }
 
 let sort = nums.sorted()
 let max = sort.last!
 let sec = sort[nums.count - 2]
 
 return max >= sec * 2 ? nums.index(of: max)! : -1
 }
 }
 */

/*
 class Solution {
 func dominantIndex(_ nums: [Int]) -> Int {
 
 guard nums.count > 1 else {
 return nums.count == 1 ? 0 : -1
 }
 var maxIndex = 0
 var max = nums[maxIndex]
 for i in 0..<nums.count {
 if nums[i] > max {
 max = nums[i]
 maxIndex = i
 }
 }
 
 for i in 0..<nums.count {
 if i == maxIndex {
 continue
 }
 if nums[i] * 2 > max {
 return -1
 }
 }
 
 return maxIndex
 }
 }
 */

class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        
        guard nums.count > 1 else {
            return nums.count == 1 ? 0 : -1
        }
        
        var maxIndex = 0
        var max = 0
        var sec = 0
        
        if nums[0] > nums[1] {
            max = nums[0]
            sec = nums[1]
        } else {
            max = nums[1]
            maxIndex = 1
            sec = nums[0]
        }
        
        //        print("before max:\(max), index:\(maxIndex), sec:\(sec)")
        for (index, value) in nums.enumerated() {
            
            if value > max {
                sec = max
                max = value
                maxIndex = index
            }
            
            if value < max && value > sec {
                sec = value
            }
        }
        //        print("after max:\(max), index:\(maxIndex), sec:\(sec)")
        
        return max >= sec * 2 ? maxIndex : -1
    }
}
