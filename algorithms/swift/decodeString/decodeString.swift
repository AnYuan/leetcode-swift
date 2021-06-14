/*
 394. Decode String

 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Examples:

 s = "3[a]2[bc]", return "aaabcbc".
 s = "3[a2[c]]", return "accaccacc".
 s = "2[abc]3[cd]ef", return "abcabccdcdcdef".

 https://leetcode.com/problems/decode-string/

 https://leetcode.com/problems/decode-string/discuss/248453/Swift-solution-explained-in-detailed.
 */
class Solution {

    func decodeString(_ s: String) -> String {
        var result = ""
        var countStack = [Int]()
        var stringStack = [String]()

        let array = Array(s)
        var i = 0
        while i < array.count {
            if array[i] >= "0", array[i] <= "9" {
                var count = 0
                while array[i] >= "0", array[i] <= "9" {
                    count = 10 * count + Int(String(array[i]))!
                    i += 1
                }
                countStack.append(count)
            } else if array[i] == "[" {
                stringStack.append(result)
                result = ""
                i += 1
            } else if array[i] == "]" {
                if var temp = stringStack.popLast(), let repeatTime = countStack.popLast() {
                    for _ in 0..<repeatTime {
                        temp.append(result)
                    }
                    result = temp
                }
                i += 1
            } else {
                result.append(array[i])
                i += 1
            }
        }
        return result
    }
}
