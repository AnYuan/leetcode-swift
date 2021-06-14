class Solution {
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        let maxHeap = Heap(topToBottom: >) // max heap
        var i = 0 // the index of next stops to refuel.
        var result = 0
        var current = startFuel
        while current < target {
            // add all reachable stops to priority queue.
            while i < stations.count && stations[i][0] <= current {
                maxHeap.add(stations[i][1])
                i += 1
            }
            // can not reach target
            if maxHeap.count == 0 {
                return -1
            }
            // refuel the max we can so far
            current += maxHeap.extract()!
            // update refuel times
            result += 1
        }
        return result
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