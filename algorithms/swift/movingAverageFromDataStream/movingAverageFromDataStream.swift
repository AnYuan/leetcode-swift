/*
 346. Moving Average from Data Stream

 Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

 Example:

 MovingAverage m = new MovingAverage(3);
 m.next(1) = 1
 m.next(10) = (1 + 10) / 2
 m.next(3) = (1 + 10 + 3) / 3
 m.next(5) = (10 + 3 + 5) / 3

 https://leetcode.com/problems/moving-average-from-data-stream/
 */

class MovingAverage {

    /** Initialize your data structure here. */
    var queue = [Int]()
    var size: Int
    var sum: Double
    init(_ size: Int) {
        self.size = size
        sum = 0.0
    }

    func next(_ val: Int) -> Double {
        // full, remove first
        if queue.count == size {
            sum -= Double(queue.removeFirst())
        }
        queue.append(val)
        sum += Double(val)
        return sum / Double(queue.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
