/*
476. Number Complement
Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

Note:
The given integer is guaranteed to fit within the range of a 32-bit signed integer.
You could assume no leading zero bit in the integer’s binary representation.
Example 1:
Input: 5
Output: 2
Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
Example 2:
Input: 1
Output: 0
Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.

https://leetcode.com/problems/number-complement/

*/
class Solution {
    func findComplement(_ num: Int) -> Int {
        var i = 1
        while i <= num {
            i <<= 1
        } 
            
        // for a number which is a complete power of '2' i.e., it can be written as pow(2, n), if we
        // subtract '1' from such a number, we get a number which has 'n' least significant bits set to '1'.
        // For example, '4' which is a complete power of '2', and '3' (which is one less than 4) has a binary 
        // representation of '11' i.e., it has '2' least significant bits set to '1'   
        return (i - 1) ^ num
    }
}