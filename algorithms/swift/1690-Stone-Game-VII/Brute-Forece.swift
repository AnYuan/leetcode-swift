/*

*/
class Solution {
    func stoneGameVII(_ stones: [Int]) -> Int {
        let n = stones.count
        var prefixSum = [Int](repeating: 0, count: n+1)
        for i in 0..<n {
            prefixSum[i+1] = prefixSum[i] + stones[i]
        }
        return abs(findDiff(prefixSum, 0, n-1, true))
    }
    
    func findDiff(_ prefixSum: [Int], _ start: Int, _ end: Int, _ alice: Bool) -> Int {
        guard start != end else { return 0 }    
        var result = 0
        let scoreRemoveFirst = prefixSum[end+1] - prefixSum[start+1]
        let scoreRemoveLast = prefixSum[end] - prefixSum[start]
        if alice {
            // Alice's goal is to return the maximum positive value.
            // Alice's difference = Bob's Difference + Current Score
            result = max(findDiff(prefixSum, start+1, end, !alice) + scoreRemoveFirst,
                         findDiff(prefixSum, start, end-1, !alice) + scoreRemoveLast)
        } else {
            // Bob's goal is to return the maximum negative value.
            // Bob's difference = Alice's difference - Current Score
            result = min(findDiff(prefixSum, start+1, end, !alice) - scoreRemoveFirst,
                         findDiff(prefixSum, start, end-1, !alice) - scoreRemoveLast)
        }
        return result
    }
}