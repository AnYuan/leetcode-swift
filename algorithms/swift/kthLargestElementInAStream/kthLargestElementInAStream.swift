
/*
Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Your KthLargest class will have a constructor which accepts an integer k and an integer array nums, which contains initial elements from the stream. For each call to the method KthLargest.add, return the element representing the kth largest element in the stream.

https://leetcode.com/problems/kth-largest-element-in-a-stream/
*/


class KthLargest {

    private let minHeap: MinHeap
    init(_ k: Int, _ nums: [Int]) {
        minHeap = MinHeap(capacity: k)
        for i in nums {
            minHeap.insert(i)
        }
    }

    func add(_ val: Int) -> Int {
        minHeap.insert(val)
        return minHeap.min()
    }
}

final class MinHeap {
    private var pq: [Int]
    private let MAX: Int

    public init(capacity: Int) {
        pq = [Int]()
        MAX = capacity + 1
        //insert fake head,
        //heap index from 1
        //so that we can calculate index easily
        pq.append(0)
    }

    public func insert(_ k: Int) {

        // when heap is full,
        // only insert when k is greater than min()
        if pq.count == MAX {
            if k > min() {
                deleteMin()
                pq.append(k)
                swim(pq.count-1)
            }
        } else {
            // when heap is not full
            // insert k, and swim
            pq.append(k)
            swim(pq.count-1)
        }
    }

    public func min() -> Int {
        return pq[1]
    }
    public func deleteMin() -> Int {
        let min = pq[1]
        exchange(1, pq.count-1)
        pq.removeLast()
        sink(1)
        return min
    }

    //
    private func sink(_ index: Int) {
        var index = index
        while 2 * index <= pq.count-1 {
            var j = 2 * index
            if j < pq.count-1 && pq[j] > pq[j+1] {
                j = j + 1
            }
            if !(pq[index] > pq[j]) { break }
            exchange(index, j)
            index = j
        }
    }

    private func swim(_ index: Int) {
        var index = index
        while index > 1 && pq[index/2] > pq[index] {
            exchange(index/2, index)
            index = index / 2
        }
    }

    private func exchange(_ i: Int, _ j: Int) {
        let temp = pq[i]
        pq[i] = pq[j]
        pq[j] = temp
    }
}
