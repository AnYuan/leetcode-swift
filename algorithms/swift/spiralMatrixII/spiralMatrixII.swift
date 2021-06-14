//
//  spiralMatrixII.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 
 Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
 

 https://leetcode.com/problems/spiral-matrix-ii/description/

 */

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        //create N x N matrix
        var spiral = Array(repeating:
            Array(repeating: 0, count: n),
                           count: n)
        
        let col = n, row = n
        var c = 0, r = 0
        var cnt = 1
        
        while (r < (row + 1) / 2) && (c < (col + 1) / 2) {
            //top
            for i in c ..< col - c {
                spiral[r][i] = cnt
                cnt += 1
            }
            
            //right
            for i in r + 1 ..< row - r {
                spiral[i][col - c - 1] = cnt
                cnt += 1
            }
            //bottom
            var i = col - c - 2
            while row - r - 1 > r && i >= c {
                spiral[row - r - 1][i] = cnt
                cnt += 1
                i -= 1
            }
            //left
            i = row - r - 2
            while (col - c - 1 > c && i > r) {
                spiral[i][c] = cnt
                cnt += 1
                i -= 1
            }
            
            r += 1
            c += 1
        }
        return spiral
    }
}
