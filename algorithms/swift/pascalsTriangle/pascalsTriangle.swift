//
//  pascalsTriangle.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 https://leetcode.com/problems/pascals-triangle/description/

 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        guard numRows > 0 else {
            return [[Int]]()
        }
        
        //init matrix
        var pascal = Array(repeating: [Int](), count: numRows)
        for i in 0 ... numRows - 1 {
            if i == 0 {
                pascal[i] = [1]
            } else if i == 1 {
                pascal[i] = [1, 1]
            } else {
                var temp = [Int]()
                temp.append(1)
                for j in 1 ... i - 1 {
                    temp.append(pascal[i - 1][j - 1] + pascal[i - 1][j])
                }
                temp.append(1)
                pascal[i] = temp
            }
        }
        
        return pascal
    }
}
