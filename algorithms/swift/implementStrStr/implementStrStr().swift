//
//  implementStrStr().swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation

/*
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 https://leetcode.com/problems/implement-strstr/description/

 */

/*
 class Solution {
 func strStr(_ haystack: String, _ needle: String) -> Int {
 guard !needle.isEmpty else { return 0 }
 
 if haystack == needle {return 0}
 if haystack.count < needle.count {return -1}
 
 
 for i in 0 ... (haystack.count - needle.count) {
 let len = i + needle.count
 for j in i ..< len {
 let hc = haystack[haystack.index(haystack.startIndex, offsetBy: j)]
 let nc = needle[needle.index(needle.startIndex, offsetBy: j - i)]
 if hc != nc { break }
 print(j)
 if j == (len - 1) { return i }
 }
 }
 return -1
 }
 }
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {
            return 0
        }
        
        if haystack == needle {return 0}
        if haystack.count < needle.count {return -1}
        
        let arrayHayStack = Array(haystack).map { c in
            return String(c)
        }
        
        let arrayNeedle = Array(needle).map { c in
            return String(c)
        }
        
        for i in 0 ..< arrayHayStack.count {
            
            if arrayHayStack.count - i < arrayNeedle.count {
                break
            }
            let c = arrayHayStack[i]
            let n = arrayNeedle[0]
            var success = false
            if c == n {
                success = true
                for j in 1 ..< arrayNeedle.count {
                    let n = arrayNeedle[j]
                    let c = arrayHayStack[i + j]
                    if n != c {
                        success = false
                        break
                    }
                }
            }
            if success {
                return i
            }
        }
        return -1
    }
}
