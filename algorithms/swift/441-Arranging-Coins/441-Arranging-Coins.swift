/*
441. Arranging Coins

You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

Given n, find the total number of full staircase rows that can be formed.

n is a non-negative integer and fits within the range of a 32-bit signed integer.

Example 1:

n = 5

The coins can form the following rows:
¤
¤ ¤
¤ ¤

Because the 3rd row is incomplete, we return 2.

Example 2:

n = 8

The coins can form the following rows:
¤
¤ ¤
¤ ¤ ¤
¤ ¤

Because the 4th row is incomplete, we return 3.

https://leetcode.com/problems/arranging-coins/
*/
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        // (1 + x) * x / 2 <= n
        // x + square of x <= 2n
        // x = square root of (2 * n) + 0.25 minus 0.5
        return Int((Double(2*n) + 0.25).squareRoot() - 0.5)
    }
}