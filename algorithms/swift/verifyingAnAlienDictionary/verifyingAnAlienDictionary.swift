/*
953. Verifying an Alien Dictionary
In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

 

Example 1:

Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
Output: true
Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.

Example 2:

Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
Output: false
Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.

Example 3:

Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
Output: false
Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).

 

Constraints:

    1 <= words.length <= 100
    1 <= words[i].length <= 20
    order.length == 26
    All characters in words[i] and order are English lowercase letters.

https://leetcode.com/problems/verifying-an-alien-dictionary/
*/
class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character: Int]() // val : index
        let o = Array(order)
        o.enumerated().forEach { t in 
            dict[t.1] = t.0                           
        }
        search: for i in 0..<words.count-1 {
            let w0 = [Character](words[i])
            let w1 = [Character](words[i+1])
            for j in 0..<min(w0.count, w1.count) {
                let c0 = w0[j]
                let c1 = w1[j]
                if c0 != c1 {
                    if dict[c0]! > dict[c1]! {
                        return false
                    }
                    continue search
                }
            }
            // all min length characters are the same,
            // we should check the length of the whole word
            if w0.count > w1.count {
                return false
            }
        }
        return true
    }
}