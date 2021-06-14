/*
641. Design Circular Deque

Design your implementation of the circular double-ended queue (deque).

Your implementation should support following operations:

MyCircularDeque(k): Constructor, set the size of the deque to be k.
insertFront(): Adds an item at the front of Deque. Return true if the operation is successful.
insertLast(): Adds an item at the rear of Deque. Return true if the operation is successful.
deleteFront(): Deletes an item from the front of Deque. Return true if the operation is successful.
deleteLast(): Deletes an item from the rear of Deque. Return true if the operation is successful.
getFront(): Gets the front item from the Deque. If the deque is empty, return -1.
getRear(): Gets the last item from Deque. If the deque is empty, return -1.
isEmpty(): Checks whether Deque is empty or not. 
isFull(): Checks whether Deque is full or not.
 

Example:

MyCircularDeque circularDeque = new MycircularDeque(3); // set the size to be 3
circularDeque.insertLast(1);			// return true
circularDeque.insertLast(2);			// return true
circularDeque.insertFront(3);			// return true
circularDeque.insertFront(4);			// return false, the queue is full
circularDeque.getRear();  			// return 2
circularDeque.isFull();				// return true
circularDeque.deleteLast();			// return true
circularDeque.insertFront(4);			// return true
circularDeque.getFront();			// return 4
 

Note:

* All values will be in the range of [0, 1000].
* The number of operations will be in the range of [1, 1000].
* Please do not use the built-in Deque library.

https://leetcode.com/problems/design-circular-deque/
*/
class MyCircularDeque {
    var queue : [Int]
    var front : Int
    var rear : Int
    var size : Int
    var len : Int

    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        queue = Array(repeating : -1, count : k)
        front = 0
        rear = -1
        size = k
        len = 0
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        
        guard !isFull() else { return false }
        front -= 1
        
        front %= size
        front = front < 0 ? (front+size) : front
        queue[front] = value
        len += 1
        
        if len == 1 {
            rear = front
        }
        
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        
        guard !isFull() else { return false }
        rear += 1
        
        rear %= size
        queue[rear] = value
        len += 1
        
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() { 
            return false
        }
        
        front = (front + 1) % size
        
        len -= 1
        
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        guard !isEmpty() else { return false }
        
        rear = (rear - 1) % size
        rear = rear < 0 ? rear + size : rear
        len -= 1
        
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        
        return queue[front]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        
        guard !isEmpty() else { return -1 }
        
        return queue[rear]
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
       return len == 0 
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return len == size
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */