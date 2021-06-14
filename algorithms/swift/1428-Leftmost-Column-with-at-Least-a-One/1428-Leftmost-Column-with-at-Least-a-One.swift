/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ x: Int, _ y: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        var result = Int.max
        let r = binaryMatrix.dimensions()[0]
        let c = binaryMatrix.dimensions()[1]
        for i in 0..<r {
            result = min(result, binarySearch(binaryMatrix, 1, i, c))
        }
        return result == Int.max ? -1 : result
    }

    func binarySearch(_ binaryMatrix: BinaryMatrix, _ target: Int, _ row: Int, _ col: Int) -> Int {
        var lo = 0
        var hi = col - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if binaryMatrix.get(row, mid) == target {
                if mid == 0 || binaryMatrix.get(row, mid-1) != target {
                    return mid
                } else {
                    hi = mid - 1
                }
            } else {
                lo = mid + 1
            }
        }
        return binaryMatrix.get(row, hi) == 1 ? hi : Int.max
    }
}