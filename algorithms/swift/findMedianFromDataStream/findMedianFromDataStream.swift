/*
Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

For example,
[2,3,4], the median is 3

[2,3], the median is (2 + 3) / 2 = 2.5

Design a data structure that supports the following two operations:

* void addNum(int num) - Add a integer number from the data stream to the data structure.
* double findMedian() - Return the median of all elements so far.
 

Example:

addNum(1)
addNum(2)
findMedian() -> 1.5
addNum(3) 
findMedian() -> 2
 

Follow up:

1.If all integer numbers from the stream are between 0 and 100, how would you optimize it?
2.If 99% of all integer numbers from the stream are between 0 and 100, how would you optimize it?
*/

class MedianFinder {

    let maxHeap = Heap(topToBottom: >) // left half
    let minHeap = Heap(topToBottom: <) // right half

    // make sure `maxHeap.count == minHeap.count || maxHeap.count == minHeap.count + 1`
    func addNum(_ num: Int) {
        if maxHeap.count == minHeap.count {
            maxHeap.add(num)
            minHeap.add(maxHeap.extract()!)
        } else {
            minHeap.add(num)
            maxHeap.add(minHeap.extract()!)
        }
    }
    
    func findMedian() -> Double {
        var result = 0.0
        var max: Double = 0.0
        var min: Double = 0.0
        if let m = maxHeap.peek() { max = Double(m) }
        if let m = minHeap.peek() { min = Double(m) }

        return maxHeap.count == minHeap.count ? Double((max + min) / 2.0) : min
    }
}

// heap definition
class Heap {    
    private var heap = [Int]()
    
    private let comparator: (_ top: Int, _ bottom: Int) -> Bool
    init(topToBottom comparator: @escaping (Int, Int) -> Bool) {
        self.comparator = comparator
    }
    
    var count: Int {
        return heap.count
    }
    
    func add(_ num: Int) {
        heap.append(num)
        var curr = heap.count - 1
        while curr > 0 {
            let parent = (curr - 1) / 2
            if !comparator(heap[parent], heap[curr]) {
                heap.swapAt(curr, parent)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func extract() -> Int? {
        guard heap.count > 0 else { return nil }
        let result = heap[0]
        let last = heap.removeLast()
        if heap.count > 0 {
            heap[0] = last
            var curr = 0
            while curr < heap.count {
                let next: Int
                let left = curr * 2 + 1, right = curr * 2 + 2
                if right < heap.count {
                    next = comparator(heap[left], heap[right]) ? left : right
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if !comparator(heap[curr], heap[next]) {
                    heap.swapAt(curr, next)
                    curr = next
                } else {
                    break
                }
            }
        }
        return result
    }
    
    func peek() -> Int? {
        return heap.first
    }
}