//
//  Tries.swift
//  DSAndAlgorithm
// https://medium.com/basecs/trying-to-understand-tries-3ec6bede0014
//  Created by Manish Kumar on 30/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


// R-Way trie
// 26-Way Trie Data Structure
// A Trie node will have root node always empty
// A node will have value and its R-Children
// Node and Children can be nil
class TrieNode {
    var data: Character
    var value: Int
    var childrens: [TrieNode?] // An array of 26-children
    init(_ char: Character, value: Int = 0) {
        self.data = char
        self.value = value
        self.childrens = [TrieNode?].init(repeating: nil, count: 26)
    }
}

class Tries {

    // there will be always root node in case of Trie (Retrieval)
    var root: TrieNode

    init() {
        self.root = TrieNode(" ")
    }

    func insertInTrie(input: String) {
        var curr = self.root
        for (index,char) in input.lowercased().enumerated() {


            let result = curr.childrens.firstIndex { (node) -> Bool in
                return node?.data == char
            }

            if let validChildIndx = result {
                // get node at that index
                curr = curr.childrens[validChildIndx]!
            } else {
                // create new node
                let newNode = TrieNode(char)
                // insert at position so get the index // assumer all ascii value
                let index = char.asciiValue! - 97
                curr.childrens.insert(newNode, at: Int(index))
                curr = newNode
            }

            // last character is inserted
            if index == input.count - 1 {
                curr.value = 1
            }
        }

    }

    func search(pattern: String) -> Bool {
        var curr = self.root

        for char in pattern.lowercased() {
            let result = curr.childrens.firstIndex { (node) -> Bool in
                return node?.data == char
            }

            guard let validIndx = result else {
                return false
            }

            curr = curr.childrens[validIndx]!

        }

        return true
    }

}
