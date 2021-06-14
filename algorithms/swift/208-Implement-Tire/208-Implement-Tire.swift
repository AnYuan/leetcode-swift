/*
 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");   
 trie.search("app");     // returns true


 Note:

* You may assume that all inputs are consist of lowercase letters a-z.
* All inputs are guaranteed to be non-empty strings.

https://leetcode.com/problems/implement-trie-prefix-tree/
*/
class Trie {

    private class Node {
        let value: Character?
        var children: [Character: Node]
        var isWord: Bool
        
        init(_ value: Character?) {
            self.value = value
            children = [Character: Node]()
            isWord = false
        }
    }
    
    private let root: Node
    
    /** Initialize your data structure here. */
    init() {
        self.root = Node(nil)
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var current = root
        for c in word {
            // insert
            if current.children[c] == nil {
                current.children[c] = Node(c)
            }
            // move next
            current = current.children[c]!
        }
        // finish insertion
        current.isWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard let node = p_search(word) else { return false }
        return node.isWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard let node = p_search(prefix) else { return false }
        return true
    }
    
    private func p_search(_ word: String) -> Node? {
        var current: Node = root
        for c in word {
            if let node = current.children[c] {
                current = node
            } else {
                return nil
            }
        }
        return current
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
