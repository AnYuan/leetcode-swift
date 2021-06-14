/*
616. Add Bold Tag in String

Given a string s and a list of strings dict, you need to add a closed pair of bold tag <b> and </b> to wrap the substrings in s that exist in dict. If two such substrings overlap, you need to wrap them together by only one pair of closed bold tag. Also, if two substrings wrapped by bold tags are consecutive, you need to combine them.

Example 1:

Input: 
s = "abcxyz123"
dict = ["abc","123"]
Output:
"<b>abc</b>xyz<b>123</b>"

Example 2:

Input: 
s = "aaabbcc"
dict = ["aaa","aab","bc"]
Output:
"<b>aaabbc</b>c"

Note:

    The given dict won't contain duplicates, and its length won't exceed 100.
    All the strings in input have length in range [1, 1000].

https://leetcode.com/problems/add-bold-tag-in-string/
*/
class Solution {
    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        let head = "<b>"
        let tail = "</b>"
        
        guard !s.isEmpty else { return "" }
        
        let sChar = Array(s)
        
        var shouldBold: [Bool] = [Bool](repeating: false, count: s.count)
        
        for substring in dict {
            let ranges = getAllRanges(s: s, substring: substring)
            for range in ranges {
                //range.lowerBound.encodedOffset
                let lower = range.lowerBound.utf16Offset(in: s)
                let upper = range.upperBound.utf16Offset(in: s)
                for i in lower..<upper {
                    shouldBold[i] = true
                }
            }
        }
        
        var result = ""
        if shouldBold[0] {
            result = result + head
        }
        for i in 0..<shouldBold.count-1 {
            result = result + String(sChar[i])
            if shouldBold[i] == true && shouldBold[i+1] == false {
                result = result + tail
            }
            if shouldBold[i] == false && shouldBold[i+1] == true {
                result = result + head
            }
        }
        
        result = result + String(sChar.last!)
        
        if shouldBold[shouldBold.count-1] == true {
            result = result + tail
        }
        
        return result
    }
    
    func getAllRanges(s: String, substring: String) -> [Range<String.Index>] {
        var result: [Range<String.Index>] = [Range<String.Index>]()
        var temps = s
        while let range = temps.range(of: substring) {
            result.append(range)
            let lowerBoundPlusOne = temps.index(range.lowerBound, offsetBy: 1)
            temps = String(temps[temps.startIndex..<range.lowerBound]) + " " + String(temps[lowerBoundPlusOne..<temps.endIndex])
        }
        return result
    }
}