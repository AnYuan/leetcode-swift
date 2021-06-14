/*
763. Partition Labels

A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

 

Example 1:

Input: S = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.

 

Note:

    S will have length in range [1, 500].
    S will consist of lowercase English letters ('a' to 'z') only.

https://leetcode.com/problems/partition-labels/
*/
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        guard !S.isEmpty else { return [] }
        var result = [Int]()
        var chars = [Character](S)
        var dict = [Character: Int]() // Character : LastIndex
        
        for i in chars.indices {
            dict[chars[i]] = i
        }
        
        var start = 0
        var end = 0
        
        for i in chars.indices {
            end = max(end, dict[chars[i], default: 0])
            
            if i == end {
                result.append(end - start + 1)
                start = end + 1
            }
        }
        return result
    }
}