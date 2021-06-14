/*
1690. Stone Game VII

Alice and Bob take turns playing a game, with Alice starting first.

There are n stones arranged in a row. On each player's turn, they can remove either the leftmost stone or the rightmost stone from the row and receive points equal to the sum of the remaining stones' values in the row. The winner is the one with the higher score when there are no stones left to remove.

Bob found that he will always lose this game (poor Bob, he always loses), so he decided to minimize the score's difference. Alice's goal is to maximize the difference in the score.

Given an array of integers stones where stones[i] represents the value of the ith stone from the left, return the difference in Alice and Bob's score if they both play optimally.

 

Example 1:

Input: stones = [5,3,1,4,2]
Output: 6
Explanation: 
- Alice removes 2 and gets 5 + 3 + 1 + 4 = 13 points. Alice = 13, Bob = 0, stones = [5,3,1,4].
- Bob removes 5 and gets 3 + 1 + 4 = 8 points. Alice = 13, Bob = 8, stones = [3,1,4].
- Alice removes 3 and gets 1 + 4 = 5 points. Alice = 18, Bob = 8, stones = [1,4].
- Bob removes 1 and gets 4 points. Alice = 18, Bob = 12, stones = [4].
- Alice removes 4 and gets 0 points. Alice = 18, Bob = 12, stones = [].
The score difference is 18 - 12 = 6.

Example 2:

Input: stones = [7,90,5,1,100,10,10,2]
Output: 122

 

Constraints:

    n == stones.length
    2 <= n <= 1000
    1 <= stones[i] <= 1000

https://leetcode.com/problems/stone-game-vii/
*/
class Solution {
    var memo = [[Int]]()
    func stoneGameVII(_ stones: [Int]) -> Int {
        let n = stones.count
        memo = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
        var prefixSum = [Int](repeating: 0, count: n+1)
        for i in 0..<n {
            prefixSum[i+1] = prefixSum[i] + stones[i]
        }
        return abs(findDiff(prefixSum, 0, n-1))
    }
    
    func findDiff(_ prefixSum: [Int], _ start: Int, _ end: Int) -> Int {
        guard start != end else { return 0 }    
        if memo[start][end] != Int.max { return memo[start][end] }
        var result = 0
        let scoreRemoveFirst = prefixSum[end+1] - prefixSum[start+1]
        let scoreRemoveLast = prefixSum[end] - prefixSum[start]
        /*
        Now, that both players have a common goal, that is, to return maximum difference value to the opponent. We don't care who is the current player. Each of the players will perform the following steps.

    Calculate the current score after removing the first or last stone given by scoreRemoveFirst and scoreRemoveLast respectively. The calculations of these scores are the same as in Approach 1.

    Find the maximum difference for the opponent player to minimize their total score. The difference can be calculated recursively as follows,

   findDifference(start, end) = max(
   // if player removes first stone
   scoreRemoveFirst - findDifference(start + 1, end)
   // if player removes last stone
   scoreRemoveLast - findDifference(start , end - 1)
  )

    At the end, the total difference for removing a stone from array stones starting at index 0 and ending at index n - 1 would be returned.

        */
        memo[start][end] = max(scoreRemoveFirst - findDiff(prefixSum, start+1, end),
                               scoreRemoveLast - findDiff(prefixSum, start, end-1))
        return memo[start][end]
    }
}