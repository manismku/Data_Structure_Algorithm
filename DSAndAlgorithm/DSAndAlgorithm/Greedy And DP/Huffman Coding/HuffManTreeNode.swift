//
//  HuffManTreeNode.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 23/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class HMTreeNode {
    var character: String = "#"
    var freq: UInt
    var left: HMTreeNode?
    var right: HMTreeNode?
    
    init(_ key: String = "#", _ value: UInt) {
        self.character = key
        self.freq = value
    }
}

extension HMTreeNode: Comparable {
    static func < (lhs: HMTreeNode, rhs: HMTreeNode) -> Bool {
        return lhs.freq < rhs.freq
    }

    static func == (lhs: HMTreeNode, rhs: HMTreeNode) -> Bool {
        return lhs.freq == rhs.freq
    }
}
