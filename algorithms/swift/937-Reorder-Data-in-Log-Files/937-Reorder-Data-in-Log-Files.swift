/*
937. Reorder Data in Log Files

You have an array of logs.  Each log is a space delimited string of words.

For each log, the first word in each log is an alphanumeric identifier.  Then, either:

    Each word after the identifier will consist only of lowercase letters, or;
    Each word after the identifier will consist only of digits.

We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.

Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.

Return the final order of the logs.

 

Example 1:

Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]

 

Constraints:

    0 <= logs.length <= 100
    3 <= logs[i].length <= 100
    logs[i] is guaranteed to have an identifier, and a word after the identifier.

https://leetcode.com/problems/reorder-data-in-log-files/
*/
class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        let sorted = logs.sorted { log1, log2 -> Bool in
            let split1 = log1.split(separator: " ", maxSplits: 1)
            let split2 = log2.split(separator: " ", maxSplits: 1)

            let afterID1 = split1[1]
            let afterID2 = split2[1]

            let isDigit1 = afterID1.first!.isNumber
            let isDigit2 = afterID2.first!.isNumber

            if !isDigit1 && !isDigit2 {
                if afterID1.compare(afterID2) == .orderedSame {
                    return split1[0].compare(split2[0]) == .orderedAscending
                } else {
                    return afterID1.compare(afterID2) == .orderedAscending
                }
            } else if isDigit1 && isDigit2 {
                return afterID1.compare(afterID2) == .orderedSame
            } else {
                return afterID1.compare(afterID2) == .orderedDescending
            }
        }
        return sorted
    }
}