/*
1410. HTML Entity Parser

HTML entity parser is the parser that takes HTML code as input and replace all the entities of the special characters by the characters itself.

The special characters and their entities for HTML are:

    Quotation Mark: the entity is &quot; and symbol character is ".
    Single Quote Mark: the entity is &apos; and symbol character is '.
    Ampersand: the entity is &amp; and symbol character is &.
    Greater Than Sign: the entity is &gt; and symbol character is >.
    Less Than Sign: the entity is &lt; and symbol character is <.
    Slash: the entity is &frasl; and symbol character is /.

Given the input text string to the HTML parser, you have to implement the entity parser.

Return the text after replacing the entities by the special characters.

 

Example 1:

Input: text = "&amp; is an HTML entity but &ambassador; is not."
Output: "& is an HTML entity but &ambassador; is not."
Explanation: The parser will replace the &amp; entity by &

Example 2:

Input: text = "and I quote: &quot;...&quot;"
Output: "and I quote: \"...\""

Example 3:

Input: text = "Stay home! Practice on Leetcode :)"
Output: "Stay home! Practice on Leetcode :)"

Example 4:

Input: text = "x &gt; y &amp;&amp; x &lt; y is always false"
Output: "x > y && x < y is always false"

Example 5:

Input: text = "leetcode.com&frasl;problemset&frasl;all"
Output: "leetcode.com/problemset/all"

 

Constraints:

    1 <= text.length <= 10^5
    The string may contain any possible characters out of all the 256 ASCII characters.

https://leetcode.com/problems/html-entity-parser/
*/
class Solution {
    var dict = ["&quot;": "\"", "&apos;": "'", "&amp;":"&", "&gt;": ">", "&lt;": "<", "&frasl;":"/"]    
    var result = [Character]()
    func entityParser(_ text: String) -> String {
        var tmp = [Character](text)   
        var start = -1
        for i in 0..<tmp.count {
            result.append(tmp[i])
            if tmp[i] == "&" {
                start = i
            } else if tmp[i] == ";" {
                // we are matching & and .
                if start != -1, let match = dict[String(tmp[start...i])] {
                    while let top = result.last, top != "&" {
                        result.removeLast()
                    }
                    // remove &
                    result.removeLast()
                    // append replace char
                    result.append(Character(match))
                }
                //reset index
                start = -1
            }
        }
        return String(result)
    }
}