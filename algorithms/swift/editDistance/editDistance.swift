/*

 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

 You have the following 3 operations permitted on a word:

 1.Insert a character
 2.Delete a character
 3.Replace a character

 Example 1:

 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation: 
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')

 Example 2:

 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation: 
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')

 */

func minDistance(_ word1: String, _ word2: String) -> Int {

    guard word1 != word2 else { return 0 }

    let w1 = Array(word1)
    let w2 = Array(word2)

    var dp = Array(repeating: Array(repeating: Int.max, count: w2.count+1), count: w1.count+1)

    //i, j DO NOT MEANS Character at i or j
    //i, j MEANS the first i or j characters

    // init dp value
    for i in 0..<w1.count+1 { dp[i][0] = i }
    for j in 0..<w2.count+1 { dp[0][j] = j }

    for i in 1..<w1.count+1 {
        for j in 1..<w2.count+1 {
            if w1[i-1] == w2[j-1]  {
                // we do nothing extra here
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = min(
                  dp[i][j-1] + 1,  //delete
                  dp[i-1][j] + 1,  //insert
                  dp[i-1][j-1] + 1 //replace
                )
            }
        }
    }
    return dp[w1.count][w2.count]
}
