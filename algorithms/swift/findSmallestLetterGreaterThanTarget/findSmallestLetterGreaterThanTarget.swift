/*
744. Find Smallest Letter Greater Than Target

Given a list of sorted characters letters containing only lowercase letters, and given a target letter target, find the smallest element in the list that is larger than the given target.

Letters also wrap around. For example, if the target is target = 'z' and letters = ['a', 'b'], the answer is 'a'.

Examples:
Input:
letters = ["c", "f", "j"]
target = "a"
Output: "c"

Input:
letters = ["c", "f", "j"]
target = "c"
Output: "f"

Input:
letters = ["c", "f", "j"]
target = "d"
Output: "f"

Input:
letters = ["c", "f", "j"]
target = "g"
Output: "j"

Input:
letters = ["c", "f", "j"]
target = "j"
Output: "c"

Input:
letters = ["c", "f", "j"]
target = "k"
Output: "c"

Note:
1.letters has a length in range [2, 10000].
2.letters consists of lowercase letters, and contains at least 2 unique letters.
3.target is a lowercase letter.

https://leetcode.com/problems/find-smallest-letter-greater-than-target/
*/
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var lo = 0
        var hi = letters.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if letters[mid] > target {
                if mid == 0 || letters[mid-1] <= target {
                    return letters[mid]
                }  else {
                    hi = mid - 1
                }
            } else {
                lo = mid + 1
            }
        }
        // if not found
        return letters[0]
    }
}