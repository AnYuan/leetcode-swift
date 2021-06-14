/*
 Implement the following operations of a queue using stacks.

 push(x) -- Push element x to the back of queue.
 pop() -- Removes the element from in front of queue.
 peek() -- Get the front element.
 empty() -- Return whether the queue is empty.

 https://leetcode.com/problems/implement-queue-using-stacks/
 */
class MyQueue {
    private var queue: [Int]
    /** Initialize your data structure here. */
    init() {
        queue = [Int]()
    }

    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        queue.append(x)
    }

    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        guard !queue.isEmpty else { fatalError() }
        return queue.removeFirst()
    }

    /** Get the front element. */
    func peek() -> Int {
        guard !queue.isEmpty else { fatalError() }
        return queue.first!
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return queue.isEmpty
    }
}
