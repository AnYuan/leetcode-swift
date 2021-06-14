/*
792. Number of Matching Subsequences

Given string S and a dictionary of words words, find the number of words[i] that is a subsequence of S.

Example :
Input: 
S = "abcde"
words = ["a", "bb", "acd", "ace"]
Output: 3
Explanation: There are three words in words that are a subsequence of S: "a", "acd", "ace".

Note:

    All words in words and S will only consists of lowercase letters.
    The length of S will be in the range of [1, 50000].
    The length of words will be in the range of [1, 5000].
    The length of words[i] will be in the range of [1, 50].

https://leetcode.com/problems/number-of-matching-subsequences/
https://leetcode.com/problems/number-of-matching-subsequences/discuss/220447/Java-Binary-Search-(Explanation)
*/
class Solution {
    func numMatchingSubseq(_ S: String, _ words: [String]) -> Int {
        var dict = [Character: [Int]]()
        let cs = [Character](S)
        for i in 0..<cs.count {
            dict[cs[i], default: [Int]()].append(i)
        }
        var result = 0
        for w in words {
            let ws = [Character](w)
            var current = 0
            for i in 0..<ws.count {
                if let indexes = dict[ws[i]] {
                    current = search(indexes, current)
                    if current == -1 {
                        // not found
                        break
                    }
                } else {
                    current = -1
                    break
                }
                current += 1
            }
            
            // found
            if current != -1 {
                result += 1
            }
        }
        return result
    }
    // search for the first index that is greater than target value
    private func search(_ indexes: [Int], _ target: Int) -> Int {
        guard !indexes.isEmpty else { return -1 }
        var lo = 0
        var hi = indexes.count-1
        if indexes[lo] >= target {
            return indexes[lo]
        }
        if indexes[hi] < target {
            return -1
        }
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if indexes[mid] == target {
                return indexes[mid]
            } else if indexes[mid] < target {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return indexes[hi]
    }
}