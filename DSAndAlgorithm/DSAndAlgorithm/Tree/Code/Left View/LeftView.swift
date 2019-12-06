//
//  BinaryTree.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 06/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class LeftView<T> {
    private var output = [T]()
    private var maxLevel: UInt8 = 0
    var root: GenericTreeNode<T>?

    init(_ root: GenericTreeNode<T>) {
        self.root = root
    }

    func findLeftViewOfTree( ) -> [T] {
        self.output.removeAll()
        findLeftViewOfTree(self.root, level: 1)
        return self.output
    }
    private func findLeftViewOfTree(_ node: GenericTreeNode<T>?, level: UInt8 )  {

        // array for storing output


        guard let aValidNode = node else {
            return
        }

        /*
         * Both are at same level
         *            1
         *         /      \
         *        2      3
         /
         4
         */
        if self.maxLevel < level {
            self.output.append(aValidNode.value)
            self.maxLevel = level
        }

        // first we are going left and we will increase the level on left side first
        // this will insure getting left value first and then if right side is les than level
        // we are not including into output
        findLeftViewOfTree(aValidNode.left, level: (level + 1))
        findLeftViewOfTree(aValidNode.right, level: (level + 1))

    }
}
