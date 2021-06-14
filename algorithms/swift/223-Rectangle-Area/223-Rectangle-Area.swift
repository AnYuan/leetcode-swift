/*
223. Rectangle Area

Find the total area covered by two rectilinear rectangles in a 2D plane.

Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.

Rectangle Area

Example:

Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
Output: 45

Note:

Assume that the total area is never beyond the maximum possible value of int.

https://leetcode.com/problems/rectangle-area/
*/
class Solution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
     
        var I = max(A, E)
        var J = max(B, F)
        var K = min(C, G)
        var L = min(D, H)
        var overlapping = 0
        if I <= K, J <= L { // overlapping
            overlapping = (L-J) * (K-I)
        }
        let a = abs(C-A) * abs(D-B)
        let b = abs(G-E) * abs(H-F)
        return a + b - overlapping
    }
}