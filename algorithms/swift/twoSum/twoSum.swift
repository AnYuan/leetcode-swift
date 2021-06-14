//
//  2Sum.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 UPDATE (2016/2/13):
 The return format had been changed to zero-based indices. Please read the above updated description carefully.
 https://leetcode.com/problems/two-sum/
 */


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else { return [-1,-1] } //edge case
    var dict = [Int:Int]() // value: index
    for i in nums.indices {
        let find = target - nums[i]
        if let index = dict[find] {
            return [index, i]
        }
        indexDic[current] = i
    }
    return [-1, -1] //not found
}
