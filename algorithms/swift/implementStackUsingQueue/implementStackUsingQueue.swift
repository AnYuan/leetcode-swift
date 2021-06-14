/*
 Implement the following operations of a stack using queues.


 * push(x) -- Push element x onto stack.
 * pop() -- Removes the element on top of the stack.
 * top() -- Get the top element.
 * empty() -- Return whether the stack is empty.


Example:

MyStack stack = new MyStack();

stack.push(1);
stack.push(2);
stack.top();   // returns 2
stack.pop();   // returns 2
stack.empty(); // returns false

Notes:

* You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.

* Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.


* You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).



 https://leetcode.com/problems/implement-stack-using-queues
 */
class MyStack {

    private var q1: [Int]
    private var q2: [Int]
    private var t: Int?
    /** Initialize your data structure here. */
    init() {
        q1 = [Int]()
        q2 = [Int]()
    }

    /** Push element x onto stack. */
    func push(_ x: Int) {
        q1.append(x)
        t = x
    }

    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {

        while q1.count > 1 {
            q2.append(q1.removeFirst())
        }

        let result = q1.removeFirst()

        // swap q1 and q1
        (q1, q2) = (q2, q1)
        t = q1.last

        return result
    }

    /** Get the top element. */
    func top() -> Int {
        return t!
    }

    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return q1.isEmpty && q2.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
