/*
1657. Determine if Two Strings Are Close

Two strings are considered close if you can attain one from the other using the following operations:

    Operation 1: Swap any two existing characters.
        For example, abcde -> aecdb
    Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
        For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)

You can use the operations on either string as many times as necessary.

Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.

 

Example 1:

Input: word1 = "abc", word2 = "bca"
Output: true
Explanation: You can attain word2 from word1 in 2 operations.
Apply Operation 1: "abc" -> "acb"
Apply Operation 1: "acb" -> "bca"

Example 2:

Input: word1 = "a", word2 = "aa"
Output: false
Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.

Example 3:

Input: word1 = "cabbba", word2 = "abbccc"
Output: true
Explanation: You can attain word2 from word1 in 3 operations.
Apply Operation 1: "cabbba" -> "caabbb"
Apply Operation 2: "caabbb" -> "baaccc"
Apply Operation 2: "baaccc" -> "abbccc"

Example 4:

Input: word1 = "cabbba", word2 = "aabbss"
Output: false
Explanation: It is impossible to attain word2 from word1, or vice versa, in any amount of operations.

 

Constraints:

    1 <= word1.length, word2.length <= 105
    word1 and word2 contain only lowercase English letters.

https://leetcode.com/problems/determine-if-two-strings-are-close/
https://leetcode.com/problems/determine-if-two-strings-are-close/discuss/935968/C%2B%2B-Compare-Frequencies
We can freely re-arrange charracters and their frequencies.

So, we need to check that;

    Both string have the same set of charracters.
    Both string have the same frequency of charracters.

    E.g string "abbccddd" has [1, 2, 2, 3] char frequency, and so does "bddccaaa".
*/
class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        let cs1 = [Character](word1)
        let cs2 = [Character](word2)
        guard cs1.count == cs2.count else { return false }
        var f1 = [Int](repeating: 0, count: 26)
        var f2 = [Int](repeating: 0, count: 26)
        for i in 0..<cs1.count {
            f1[Int(cs1[i].asciiValue! - UInt8(97))] += 1
            f2[Int(cs2[i].asciiValue! - UInt8(97))] += 1
        }
        for i in 0..<26 {
            if min(f1[i], f2[i]) == 0 && max(f1[i], f2[i]) != 0 {
                return false
            }
        }
        return f1.sorted() == f2.sorted()
    }
}