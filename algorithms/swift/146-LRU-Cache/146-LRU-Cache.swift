/*
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

 The cache is initialized with a positive capacity.

 Follow up:
 Could you do both operations in O(1) time complexity?

 Example:

 LRUCache cache = new LRUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4

 https://leetcode.com/problems/lru-cache/
 */

class LRUCache {
    
    class Node {
        var prev: Node?
        var next: Node?
        let key: Int
        var val: Int
        
        init(_ key: Int, _ val: Int, _ pre: Node?, _ next: Node?) {
            self.key = key
            self.val = val
            self.prev = pre
            self.next = next
        }
    }
    
    var dict = [Int: Node]() // key : node
    let capacity: Int
    let head = Node(0, 0, nil, nil)
    let tail = Node(0, 0, nil, nil)

    init(_ capacity: Int) {
        self.capacity = capacity         
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveFirst(node)
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if dict.keys.count == capacity, dict[key] == nil, let last = tail.prev {
            remove(last)
        }
        // update value
        if let node = dict[key] {
            node.val = value
            moveFirst(node)
        } else {
            // insert new value
            let node = Node(key, value, head, head.next)
            head.next = node
            node.next?.prev = node
            
            dict[key] = node
        }
    }
    
    private func moveFirst(_ node: Node) {
        guard head.next !== node else { return }
        
        let p = node.prev
        let n = node.next
        p?.next = n
        n?.prev = p
        
        let temp = head.next
        head.next = node
        node.prev = head
        node.next = temp
        temp?.prev = node
    }
    
    private func remove(_ node: Node) {
        let p = node.prev
        let n = node.next
        
        p?.next = n
        n?.prev = p
        
        dict[node.key] = nil
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
