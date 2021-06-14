/*
1086. High Five

Given a list of scores of different students, return the average score of each student's top five scores in the order of each student's id.

Each entry items[i] has items[i][0] the student's id, and items[i][1] the student's score.  The average score is calculated using integer division.

 

Example 1:

Input: [[1,91],[1,92],[2,93],[2,97],[1,60],[2,77],[1,65],[1,87],[1,100],[2,100],[2,76]]
Output: [[1,87],[2,88]]
Explanation: 
The average of the student with id = 1 is 87.
The average of the student with id = 2 is 88.6. But with integer division their average converts to 88.

 

Note:

    1 <= items.length <= 1000
    items[i].length == 2
    The IDs of the students is between 1 to 1000
    The score of the students is between 1 to 100
    For each student, there are at least 5 scores

https://leetcode.com/problems/high-five/
*/
class Solution {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        var dict = [Int: [Int]]()
        for i in items {
            dict[i[0], default: [Int]()].append(i[1])
        }
        var tmp = [Int: Int]()
        for (k,v) in dict {
            var top5 = [Int](v.sorted(by:>)[0..<5])
            let avg = top5.reduce(0, +) / 5
            tmp[k] = avg
        }
    
        var result = [[Int]]()
        for (k,v) in tmp {
            result.append([k,v])
        }
        return result.sorted { arr1, arr2 in
            arr1[0] < arr2[0]
        }
    }
}