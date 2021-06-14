/*
1093. Statistics from a Large Sample

We sampled integers between 0 and 255, and stored the results in an array count:  count[k] is the number of integers we sampled equal to k.

Return the minimum, maximum, mean, median, and mode of the sample respectively, as an array of floating point numbers.  The mode is guaranteed to be unique.

(Recall that the median of a sample is:

    The middle element, if the elements of the sample were sorted and the number of elements is odd;
    The average of the middle two elements, if the elements of the sample were sorted and the number of elements is even.)

 

Example 1:

Input: count = [0,1,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
Output: [1.00000,3.00000,2.37500,2.50000,3.00000]

Example 2:

Input: count = [0,4,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
Output: [1.00000,4.00000,2.18182,2.00000,1.00000]

 

Constraints:

    count.length == 256
    1 <= sum(count) <= 10^9
    The mode of the sample that count represents is unique.
    Answers within 10^-5 of the true value will be accepted as correct.

https://leetcode.com/problems/statistics-from-a-large-sample/
*/
class Solution {
    func sampleStats(_ count: [Int]) -> [Double] {
        var left = 0
        var right = 255
        var mean:Double = 0
        var median:Double = 0
        var mode:Double = 0
        var sum:Double = 0
        var c = 0
        var modeCount = 0
        while count[left] == 0 {
            left += 1
        }
        while count[right] == 0 {
            right -= 1
        }
        
        let totalCount = count.reduce(0, +)
                
        let mid1 = (totalCount+1) / 2
        let mid2 = mid1 + (totalCount % 2 == 0 ? 1 : 0)
        
        var i = left
        while i <= right {
            if mid1 > c, mid1 <= c + count[i] {
                median += Double(i) / Double(2)
            }
            if mid2 > c, mid2 <= c + count[i] {
                median += Double(i) / Double(2)
            }
            c += count[i]
            sum += Double(count[i]) * Double(i)
            if modeCount < count[i] {
                modeCount = count[i]
                mode = Double(i)
            }
            i += 1
        }
        
        return [Double(left), Double(right),sum/Double(totalCount), median, mode]
    }
}