/*
 379. Design Phone Directory

 Design a Phone Directory which supports the following operations:

 1.get: Provide a number which is not assigned to anyone.
 2.check: Check if a number is available or not.
 3.release: Recycle or release a number.

 Example:

 // Init a phone directory containing a total of 3 numbers: 0, 1, and 2.
 PhoneDirectory directory = new PhoneDirectory(3);

 // It can return any available phone number. Here we assume it returns 0.
 directory.get();

 // Assume it returns 1.
 directory.get();

 // The number 2 is available, so return true.
 directory.check(2);

 // It returns 2, the only number that is left.
 directory.get();

 // The number 2 is no longer available, so return false.
 directory.check(2);

 // Release number 2 back to the pool.
 directory.release(2);

 // Number 2 is available again, return true.
 directory.check(2);

 https://leetcode.com/problems/design-phone-directory/
 */

class PhoneDirectory {

    private var directory = Set<Int>()
    /** Initialize your data structure here
        @param maxNumbers - The maximum numbers that can be stored in the phone directory. */
    init(_ maxNumbers: Int) {
        for i in 0..<maxNumbers {
            directory.insert(i)
        }
    }

    /** Provide a number which is not assigned to anyone.
        @return - Return an available number. Return -1 if none is available. */
    func get() -> Int {
        guard !directory.isEmpty else { return -1 }
        return directory.removeFirst()
    }

    /** Check if a number is available or not. */
    func check(_ number: Int) -> Bool {
        return directory.contains(number)
    }

    /** Recycle or release a number. */
    func release(_ number: Int) {
        directory.insert(number)
    }
}

/**
 * Your PhoneDirectory object will be instantiated and called as such:
 * let obj = PhoneDirectory(maxNumbers)
 * let ret_1: Int = obj.get()
 * let ret_2: Bool = obj.check(number)
 * obj.release(number)
 */
