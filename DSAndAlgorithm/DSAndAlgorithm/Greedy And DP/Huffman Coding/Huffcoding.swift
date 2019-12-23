//
//  Huffcoding.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 23/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class HuffmanCoding {

    private(set) var freqTable: [String: UInt]
    private var binaryHeap: BinaryHeap<HMTreeNode>
    private var root: HMTreeNode?
    var bitTable: [String: String]
    var pattern: [String]

    init(input: [String: UInt]) {
        self.freqTable = input
        bitTable = [:]
        pattern = []
        self.binaryHeap = BinaryHeap<HMTreeNode>()
        setupHeapFromFrequencyTable()
    }

    func getBitTable() -> [String: String] {
        preorder(root)
        return bitTable
    }

    private func preorder(_ node: HMTreeNode?) {
        guard let validNode = node else {
            return
        }

        // leaf node
        if validNode.left == nil && validNode.right == nil {
            bitTable[validNode.character] = pattern.reduce("", { (result, next) -> String in
                return result + next
            })
            return
        }

        pattern.append("0")
        preorder(validNode.left)
        pattern.removeLast()
        pattern.append("1")
        preorder(validNode.right)
        pattern.removeLast()

    }
}

extension HuffmanCoding {
    private func setupHeapFromFrequencyTable() {
        for (key, value) in freqTable {
            let leafNode = HMTreeNode(key, value)
            self.binaryHeap.insert(key: leafNode)
        }
    }

    func createHuffmanTree() -> HMTreeNode? {
        var newNode: HMTreeNode?

        while binaryHeap.size > 1 {
            let (first, second) = extractTwoMinimumFromHeap()

            if let rightNode = second {
                newNode = HMTreeNode("#", first!.freq + rightNode.freq)
            } else {
                newNode = HMTreeNode("#", first!.freq)
            }

            newNode?.left = first
            newNode?.right = second
            root = newNode

            binaryHeap.insert(key: root!)
        }

        return root
    }

    private func extractTwoMinimumFromHeap() -> (HMTreeNode?, HMTreeNode?) {
        return (binaryHeap.deleteMin(), binaryHeap.deleteMin())
    }
}
