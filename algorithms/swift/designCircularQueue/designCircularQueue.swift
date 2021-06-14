/*
 Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

 One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

 Your implementation should support following operations:

 * MyCircularQueue(k): Constructor, set the size of the queue to be k.
 * Front: Get the front item from the queue. If the queue is empty, return -1.
 * Rear: Get the last item from the queue. If the queue is empty, return -1.
 * enQueue(value): Insert an element into the circular queue. Return true if the operation is successful.
 * deQueue(): Delete an element from the circular queue. Return true if the operation is successful.
 * isEmpty(): Checks whether the circular queue is empty or not.
 * isFull(): Checks whether the circular queue is full or not.

 Example:

 MyCircularQueue circularQueue = new MyCircularQueue(3); // set the size to be 3
 circularQueue.enQueue(1);  // return true
 circularQueue.enQueue(2);  // return true
 circularQueue.enQueue(3);  // return true
 circularQueue.enQueue(4);  // return false, the queue is full
 circularQueue.Rear();  // return 3
 circularQueue.isFull();  // return true
 circularQueue.deQueue();  // return true
 circularQueue.enQueue(4);  // return true
 circularQueue.Rear();  // return 4

 Note:

 * All values will be in the range of [0, 1000].
 * The number of operations will be in the range of [1, 1000].
 * Please do not use the built-in Queue library.

 */
class MyCircularQueue {

    private var values: [Int]
    private var capacity: Int
    private var head: Int
    private var tail: Int

    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        values = [Int](repeating: -1, count: k)
        capacity = 0
        head = -1
        tail = -1
    }

    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        tail = nextIndex(value: tail)
        values[tail] = value

        if isEmpty() {
           head = tail
        }

        capacity += 1
        return true
    }

    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        head = nextIndex(value: head)
        capacity -= 1
        return true
    }

    /** Get the front item from the queue. */
    func Front() -> Int {
        guard !isEmpty() else { return -1 }
        return values[head]
    }

    /** Get the last item from the queue. */
    func Rear() -> Int {
        guard !isEmpty() else { return -1 }
        return values[tail]
    }

    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return capacity == 0
    }

    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return capacity >= values.count
    }

    private func nextIndex(value: Int) -> Int {
        if value >= (values.count - 1) {
            return 0
        }
        return (value + 1)
    }
}
