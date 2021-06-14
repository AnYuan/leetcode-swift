/*
 630. Course Schedule III

 There are n different online courses numbered from 1 to n. Each course has some duration(course length) t and closed on dth day. A course should be taken continuously for t days and must be finished before or on the dth day. You will start at the 1st day.

 Given n online courses represented by pairs (t,d), your task is to find the maximal number of courses that can be taken.


 Example:

 Input: [[100, 200], [200, 1300], [1000, 1250], [2000, 3200]]
 Output: 3
 Explanation: 
 There're totally 4 courses, but you can take 3 courses at most:
 First, take the 1st course, it costs 100 days so you will finish it on the 100th day, and ready to take the next course on the 101st day.
 Second, take the 3rd course, it costs 1000 days so you will finish it on the 1100th day, and ready to take the next course on the 1101st day. 
 Third, take the 2nd course, it costs 200 days so you will finish it on the 1300th day. 
 The 4th course cannot be taken now, since you will finish it on the 3300th day, which exceeds the closed date.

 Note:

 1.The integer 1 <= d, t, n <= 10,000.
 2.You can't take two courses simultaneously.

 https://leetcode.com/problems/course-schedule-iii/
 */
class Solution {
	func scheduleCourse(_ courses: [[Int]]) -> Int {
		// check edge case
		guard courses.count > 0 else { return 0 }
		// sort course end time in ascending order
		let courses = courses.sorted{$0[1] < $1[1]}

		// max heap, largest on top.
		var pq: Heap<Int> = Heap(sort: { (v1, v2) -> Bool in
			return v1 > v2
		})
		// total time for now
		var sum = 0
		for c in courses {
			let t = c[0]  // course length
			let d = c[1] // dead line

			pq.insert(t)

			sum = sum + t
			// meet deadline, skip course on top of pq.
			if sum > d, !pq.isEmpty {
				sum = sum - pq.remove()!
			}
		}
		return pq.count
	}
}

// Swift implementation of heap
struct Heap<Element: Equatable> {
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        self.sort = sort
        self.elements = elements

        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightCHildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    // remove
    mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }

    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightCHildIndex(ofParentAt: parent)
            var candidate = parent

            // if there is a left child, and it has a higher priority than
            // its parent, make it the candidate.
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            // if there is a right child, and it has an even greater priority,
            // it will become the candidate instead.
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            // if candidate is still parent, you have reached the end
            // no more sifting is required.
            if candidate == parent {
                return
            }

            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    // index
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
}
