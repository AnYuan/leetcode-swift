/*
 https://leetcode.com/problems/number-of-1-bits/
 */
func hammingWeight(_ n: UInt) -> UInt {
    var count: UInt = 0
    var n = n // 0b0000111101
    while n != 0 {
        count = count + (a & 1)
        n = n >> 1
    }
    return count
}
