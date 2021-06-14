//
//  removeElement.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation

/*
 Given an array nums and a value val, remove all instances of that value in-place and return the new length.
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 https://leetcode.com/problems/remove-element/
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var length = 0
    let count = nums.count
    for (index, value) in nums.enumerated() {
        if value == val {
            nums.remove(at: (index - length))
            length += 1
        }
    }
    return count - length
}
