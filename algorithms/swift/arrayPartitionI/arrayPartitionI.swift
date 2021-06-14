//
//  arrayPartitionI.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 
 Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
 https://leetcode.com/problems/array-partition-i/
 */

func arrayPairSum(_ nums: [Int]) -> Int {
    var sorted = nums
    sorted.sort { $0 < $1 }
    var result = 0
    let count = nums.count/2
    for i in 0..<count {
        result += sorted[i * 2]
    }
    return result
}
