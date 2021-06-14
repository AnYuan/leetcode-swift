/*
788. Rotated Digits

X is a good number if after rotating each digit individually by 180 degrees, we get a valid number that is different from X.  Each digit must be rotated - we cannot choose to leave it alone.

A number is valid if each digit remains a digit after rotation. 0, 1, and 8 rotate to themselves; 2 and 5 rotate to each other (on this case they are rotated in a different direction, in other words 2 or 5 gets mirrored); 6 and 9 rotate to each other, and the rest of the numbers do not rotate to any other number and become invalid.

Now given a positive number N, how many numbers X from 1 to N are good?

Example:
Input: 10
Output: 4
Explanation: 
There are four good numbers in the range [1, 10] : 2, 5, 6, 9.
Note that 1 and 10 are not good numbers, since they remain unchanged after rotating.

Note:

    N  will be in range [1, 10000].

https://leetcode.com/problems/rotated-digits/
*/
class Solution {
    
    let mapping:[Character: Character] = ["0": "0", "1": "1", "8": "8", "2": "5", "6": "9", "5": "2", "9": "6"]
    
    func rotatedDigits(_ N: Int) -> Int {
        var result = 0
        for i in 1...N {
            let s = String(i)
            if isGood([Character](s)) {
                result += 1
            }
        }   
        return result
    }
    
    func isGood(_ chars: [Character]) -> Bool {
        var rotate = [Character]()
        for c in chars {
            if let rotated = mapping[c] {
                rotate.append(rotated)
            } else {
                return false
            }
        }
        let n1 = Int(rotate.map{String($0)}.joined())!
        let n2 = Int(chars.map{String($0)}.joined())!
        return n1 != n2
    }
}