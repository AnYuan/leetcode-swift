/*
 Given a string, sort it in decreasing order based on the frequency of characters.

 Example 1:

 Input:
 "tree"

 Output:
 "eert"

 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

 Example 2:

 Input:
 "cccaaa"

 Output:
 "cccaaa"

 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.

 Example 3:

 Input:
 "Aabb"

 Output:
 "bbAa"

 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.

 */

class Solution {
    func frequencySort(_ s: String) -> String {
        guard !s.isEmpty else { return s }
        let chars = Array(s)
        var dict = [Character:Int]()
        for c in chars {
            dict[c, default: 0] += 1
        }

        let sorted = dict.sorted{ $0.value > $1.value }
        var result = ""
        for c in sorted {
            result += String(repeating: String(c.key), count: dict[c.key]!)
        }
        return result
    }
}

//https://leetcode.com/problems/sort-characters-by-frequency/discuss/645099/Swift-96ms-90.91
func frequencySort0(_ s: String) -> String {
    return s.reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }.sorted {
        $0.value > $1.value
    }.reduce("") {
        $0 + String(repeating: $1.key, count: $1.value)
    }
}