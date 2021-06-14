/*
 243. Shortest Word Distance

 Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.

 Example:
 Assume that words = ["practice", "makes", "perfect", "coding", "makes"].

 Input: word1 = “coding”, word2 = “practice”
 Output: 3
 Input: word1 = "makes", word2 = "coding"
 Output: 1

 Note:
 You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.

 https://leetcode.com/problems/shortest-word-distance/
 */

class Solution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var index1 = -1
        var index2 = -1
        var result = Int.max
        for i in words.indices {
            if words[i] == word1 {
                index1 = i
            }

            if words[i] == word2 {
                index2 = i
            }

            if index1 != -1 && index2 != -1 {
                result = min(result, abs(index1 - index2))
            }
        }
        return result
    }
}
