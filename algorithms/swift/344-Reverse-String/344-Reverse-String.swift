//
//  reverseString.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Write a function that reverses a string. The input string is given as an array of characters char[].
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 You may assume all the characters consist of printable ascii characters.
 
 https://leetcode.com/problems/reverse-string/
 */
class Solution {
    func reverseString(_ s: inout [Character]) {
        guard !s.isEmpty else { return }
        var left = 0
        var right = s.count-1
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
