//
//  TreeNode.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 06/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class GenericTreeNode<T> {
    var value: T
    var left: GenericTreeNode<T>?
    var right: GenericTreeNode<T>?

    init(value: T) {
        self.value = value
    }
}

// Tree node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(with value: Int) {
        self.val = value
    }
}
