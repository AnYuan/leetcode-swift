//
//  addBinary.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 
 https://leetcode.com/problems/add-binary/
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        let la = a.count, lb = b.count
        var va = a, vb = b
        var carry = false
        //补齐位数
        if la > lb {
            for _ in 0..<(la - lb) {
                vb.insert("0", at: va.startIndex)
            }
        } else if la < lb {
            for _ in 0..<(lb - la) {
                va.insert("0", at: vb.startIndex)
            }
        }
        //swift String相关操作太他妈恶心了，转成Array，在转成String
        //这地方真的恶心🤢到我了
        var aa = Array(va).compactMap { c -> Int? in
            return Int(String(c))
        }
        var ab = Array(vb).compactMap { c -> Int? in
            return Int(String(c))
        }
        
        for i in (0 ..< va.count).reversed() {
            let ia = ab[i], ib = aa[i]
            var ic = ia + ib
            
            if carry {
                ic += 1
                carry = false
            }
            
            if ic >= 2 {
                ic -= 2
                carry = true
            }
            aa[i] = ic
        }
        
        if carry {
            aa.insert(1, at: 0)
        }
        
        var result = ""
        for i in 0 ..< aa.count {
            result += String(aa[i])
        }
        return result
    }
}
