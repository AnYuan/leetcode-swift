/*
1626. Best Team With No Conflicts

You are the manager of a basketball team. For the upcoming tournament, you want to choose the team with the highest overall score. The score of the team is the sum of scores of all the players in the team.

However, the basketball team is not allowed to have conflicts. A conflict exists if a younger player has a strictly higher score than an older player. A conflict does not occur between players of the same age.

Given two lists, scores and ages, where each scores[i] and ages[i] represents the score and age of the ith player, respectively, return the highest overall score of all possible basketball teams.

 

Example 1:

Input: scores = [1,3,5,10,15], ages = [1,2,3,4,5]
Output: 34
Explanation: You can choose all the players.

Example 2:

Input: scores = [4,5,6,5], ages = [2,1,2,1]
Output: 16
Explanation: It is best to choose the last 3 players. Notice that you are allowed to choose multiple people of the same age.

Example 3:

Input: scores = [1,2,3,5], ages = [8,9,10,1]
Output: 6
Explanation: It is best to choose the first 3 players. 

https://leetcode.com/problems/best-team-with-no-conflicts/
*/
class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        var players = [(Int, Int)]() // (age, score)
        let n = scores.count

        for i in 0..<n {
            players.append((ages[i], scores[i]))
        }
        players = players.sorted { p1, p2 in
            if p1.0 != p2.0 {
                return p1.0 > p2.0
            } else {
                return p1.1 > p2.1
            }
        }
        var dp = [Int](repeating: 0, count: n)
        var result = 0
        for i in 0..<n {
            let score = players[i].1
            dp[i] = score
            for j in 0..<i {
                if players[j].1 >= players[i].1 {
                    dp[i] = max(dp[i], dp[j] + score)
                }
            }
            result = max(result, dp[i])
        }
        return result
        
    }
}