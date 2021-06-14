/*
1011. Capacity To Ship Packages Within D Days

A conveyor belt has packages that must be shipped from one port to another within D days.

The i-th package on the conveyor belt has a weight of weights[i].  Each day, we load the ship with packages on the conveyor belt (in the order given by weights). We may not load more weight than the maximum weight capacity of the ship.

Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within D days.

 

Example 1:

Input: weights = [1,2,3,4,5,6,7,8,9,10], D = 5
Output: 15
Explanation: 
A ship capacity of 15 is the minimum to ship all the packages in 5 days like this:
1st day: 1, 2, 3, 4, 5
2nd day: 6, 7
3rd day: 8
4th day: 9
5th day: 10

Note that the cargo must be shipped in the order given, so using a ship of capacity 14 and splitting the packages into parts like (2, 3, 4, 5), (1, 6, 7), (8), (9), (10) is not allowed. 

Example 2:

Input: weights = [3,2,2,4,1,4], D = 3
Output: 6
Explanation: 
A ship capacity of 6 is the minimum to ship all the packages in 3 days like this:
1st day: 3, 2
2nd day: 2, 4
3rd day: 1, 4

Example 3:

Input: weights = [1,2,3,1,1], D = 4
Output: 3
Explanation: 
1st day: 1
2nd day: 2
3rd day: 3
4th day: 1, 1

 

Constraints:

    1 <= D <= weights.length <= 50000
    1 <= weights[i] <= 500

https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/discuss/256729/JavaC%2B%2BPython-Binary-Search
*/

/*
Explanation of this solution:

The key is left = max(weights), right = sum(weights),
which are the minimum and maximum possible weight capacity of the ship.

Therefore the question becomes Binary Search to find the minimum weight capacity of the ship between left and right.
We start from
mid = (left + right) / 2 as our current weight capacity of the ship.
need = days needed == 1
cur = current cargo in the ship == 0

Start put cargo into ship in order.
when need > D, it means the current ship is too small, we modify left = mid + 1 and continue
If all the cargo is successfully put into ships, we might have a chance to find a smaller ship, so let right = mid and continue.
Finally, when our left == right, we reach our answer
*/
class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var left = 0, right = 0
        for w in weights {
            left = max(left, w)
            right += w
        }
        
        while left < right {
            let mid = (right - left) / 2 + left
            var need = 1
            var current = 0
            for w in weights {
                if current + w > mid {
                    need += 1
                    current = 0
                }
                current += w
            }
            if need > D {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}