//
//  pascalsTriangleII.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

//https://leetcode.com/problems/pascals-triangle-ii/description/

import Foundation
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        
        //init matrix
        var pascalRow = Array(repeating: 0, count: rowIndex + 1)
        pascalRow[0] = 1
        for i in 0 ..< rowIndex {
            for j in stride(from: i + 1, to: 0, by: -1) {
                pascalRow[j] += pascalRow[j - 1]
            }
        }
        return pascalRow
    }
}
