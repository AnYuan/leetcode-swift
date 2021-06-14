/*
 380. Insert Delete GetRandom O(1)

 Design a data structure that supports all following operations in average O(1) time.

 1.insert(val): Inserts an item val to the set if not already present.
 2.remove(val): Removes an item val from the set if present.
 3.getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.

 Example:

 // Init an empty set.
 RandomizedSet randomSet = new RandomizedSet();

 // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomSet.insert(1);

 // Returns false as 2 does not exist in the set.
 randomSet.remove(2);

 // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomSet.insert(2);

 // getRandom should return either 1 or 2 randomly.
 randomSet.getRandom();

 // Removes 1 from the set, returns true. Set now contains [2].
 randomSet.remove(1);

 // 2 was already in the set, so return false.
 randomSet.insert(2);

 // Since 2 is the only number in the set, getRandom always return 2.
 randomSet.getRandom();
 */

class RandomizedSet {

    
    var dict = [Int: Int]() // value : index
    var array = [Int]() // values
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        guard dict[val] == nil else {
            return false
        }
        array.append(val)
        dict[val] = array.endIndex-1
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        guard let index = dict[val] else { return false }
        // remove from dict
        dict[val] = nil
        // remove last
        let endIndex = array.endIndex-1
        let last = array.removeLast()
        if index != endIndex {
            //update 
            dict[last] = index
            array[index] = last
        }
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        
        return array.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */