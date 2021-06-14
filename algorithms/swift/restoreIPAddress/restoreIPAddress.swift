/*
 93. Restore IP Addresses

 Given a string containing only digits, restore it by returning all possible valid IP address combinations.

 Example:

 Input: "25525511135"
 Output: ["255.255.11.135", "255.255.111.35"]

 https://leetcode.com/problems/restore-ip-addresses/
 */
class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let s = Array(s)
        var result = [String]()
        for i in 1...3 where i <= s.count && isValid(s[0..<i]) {
            for j in i...i+3 where j <= s.count && isValid(s[i..<j]) {
                for k in j...j+3 where k <= s.count && isValid(s[j..<k]) && isValid(s[k..<s.count]) {
                    let ip = [0..<i, i..<j, j..<k, k..<s.count].map { String(s[$0]) }
                    result.append(ip.joined(separator: "."))
                }
            }
        }
        return result
    }

    func isValid(_ str: ArraySlice<Character>) -> Bool {
        let str = String(str)
        if str.first == "0" { // be careful
            return str == "0"
        } else {
            guard let num = Int(str) else { return false }
            return num > 0 && num <= 255
        }
    }
}
