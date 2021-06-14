/*
1395. Count Number of Teams

There are n soldiers standing in a line. Each soldier is assigned a unique rating value.

You have to form a team of 3 soldiers amongst them under the following rules:

    Choose 3 soldiers with index (i, j, k) with rating (rating[i], rating[j], rating[k]).
    A team is valid if:  (rating[i] < rating[j] < rating[k]) or (rating[i] > rating[j] > rating[k]) where (0 <= i < j < k < n).

Return the number of teams you can form given the conditions. (soldiers can be part of multiple teams).

 

Example 1:

Input: rating = [2,5,3,4,1]
Output: 3
Explanation: We can form three teams given the conditions. (2,3,4), (5,4,1), (5,3,1). 

Example 2:

Input: rating = [2,1,3]
Output: 0
Explanation: We can't form any team given the conditions.

Example 3:

Input: rating = [1,2,3,4]
Output: 4

 

Constraints:

    n == rating.length
    1 <= n <= 200
    1 <= rating[i] <= 10^5

https://leetcode.com/problems/count-number-of-teams/
*/
class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        var result = 0
        // i is our selected soldier
        for i in 1..<rating.count-1 {
            var lLess = 0
            var lGreater = 0
            var rLess = 0
            var rGreater = 0
            // j is our compare soldier
            for j in 0..<rating.count {
                // compare soldier is greater than selected soldier
                if rating[i] < rating[j] {
                    // compare is at right 
                    if j > i {
                        rGreater += 1
                    } else { // left
                        lGreater += 1
                    }
                }
                // compare soldier is less than selected soldier
                if rating[i] > rating[j] {
                    // compare is at left
                    if j > i {
                        rLess += 1
                    } else {
                        lLess += 1
                    }
                }
            }
            // sum the combinations
            result += lLess * rGreater + rLess * lGreater
        }
        return result
    }
}