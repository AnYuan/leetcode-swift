//
//  longestCommonPrefix.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

/*
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 https://leetcode.com/problems/longest-common-prefix/
 */

import Foundation
func longestCommonPrefix(_ strs: [String]) -> String {
    
    guard strs.count > 1 else { return strs.first ?? "" }
    
    var commonPrefix = Array(strs[0])
    
    for (index,str) in strs.enumerated() {
        let cArray = Array(str)
        
        let count = cArray.count > commonPrefix.count ? commonPrefix.count : cArray.count
        var sameCount = -1
        if index == 0 { continue }
        for i in 0..<count {
            if cArray[i] == commonPrefix[i] {
                sameCount = i
            } else {
                break
            }
        }
        if sameCount >= 0 {
            commonPrefix = Array(commonPrefix.prefix(sameCount + 1))
        } else {
            commonPrefix = Array("")
        }
    }
    return String(commonPrefix)
}
