/*
 Given a 2D board and a list of words from the dictionary, find all words in the board.

 Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

 Example:

 Input: 
 board = [
 ['o','a','a','n'],
 ['e','t','a','e'],
 ['i','h','k','r'],
 ['i','f','l','v']
 ]
 words = ["oath","pea","eat","rain"]

 Output: ["eat","oath"]

 Note:
 1. All inputs are consist of lowercase letters a-z.
 2. The values of words are distinct.

 https://leetcode.com/problems/word-search-ii/
 */

class Solution {

    var mark = [[Bool]]()
    var result = [String]()

    public class Trie {

        public class TrieNode<Key: Hashable> {
            var key: Key?
            weak var parent: TrieNode?
            var children: [Key: TrieNode] = [:]
            var isTerminating = false

            init(key: Key?, parent: TrieNode?) {
                self.key = key
                self.parent = parent
            }
        }

        typealias Node = TrieNode<Character>
        let root = Node(key: nil, parent: nil)

        /** Initialize your data structure here. */
        init() {}

        /** Inserts a word into the trie. */
        func insert(_ word: String) {
            var current = root

            for c in word {
                if current.children[c] == nil {
                    current.children[c] = Node(key: c, parent: current)
                }
                current = current.children[c]!
            }
            current.isTerminating = true
        }
    }

    var trie = Trie()

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {

        let row = board.count
        let col = board[0].count


        for word in words {
            trie.insert(word)
        }

        for i in 0..<row {
            for j in 0..<col {
                if let node = trie.root.children[board[i][j]] {
                    match(board, i, j, node, [Character]())
            }
        }

        return result
    }

    func match(_ board: [[Character]], _ row: Int, _ col: Int, _ node: Trie.TrieNode<Character>, _ word: [Character]) -> String? {

        mark = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        return _match(board, row, col, node, word, mark)
    }

    func _match(_ board: [[Character]], _ row: Int, _ col: Int,_ node: Trie.TrieNode<Character>, _ word: [Character], _ mark:[[Bool]]) -> String? {


        var mark = mark
        guard mark[row][col] == false else { return nil }
        mark[row][col] = true
        var word = word
        word.append(board[row][col])

        if node.isTerminating {
            if !result.contains(String(word)) {result.append(String(word))}
        }

        var result: String? = nil

        // lower
        if row + 1 < board.count && !mark[row+1][col], let node = node.children[board[row+1][col]] {
            result = _match(board, row+1, col, node, word, mark)
        }

        guard result == nil else { return result }

        //upper
        if row - 1 >= 0 && !mark[row-1][col], let node = node.children[board[row-1][col]] {
            result = _match(board, row-1, col, node, word, mark)
        }

        guard result == nil else { return result }

        // left
        if col - 1 >= 0 && !mark[row][col-1], let node = node.children[board[row][col-1]] {
            result = _match(board, row, col-1, node, word, mark)
        }
        guard result == nil else { return result }

        // right
        if col + 1 < board[0].count && !mark[row][col+1], let node = node.children[board[row][col+1]] {
            result = _match(board, row, col+1, node, word, mark)
        }

        return result
    }
}
