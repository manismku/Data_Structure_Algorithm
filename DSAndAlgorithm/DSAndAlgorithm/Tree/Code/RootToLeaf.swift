//
//  RootToLeaf.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 22/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


//MARK:- Problems
extension BinarySearchTree: TreeProblems {

    func printRootToLeaf() -> [String] {
        printRootToLeafRecursive(self.root,path: "")
        return self.rootToLeaf
    }

    private func printRootToLeafRecursive(_ node: TreeNode?, path: String) {

        var newPath = path

        guard let validNode = node else {
            return
        }


        // process node
        newPath += String(validNode.val)

        // go left
        printRootToLeafRecursive(validNode.left, path: newPath + " ")
        // go right
        printRootToLeafRecursive(validNode.right, path: newPath  + " ")

        // check last node condition
        if validNode.left == nil && validNode.right == nil {
            self.rootToLeaf.append(newPath)
        }
    }
}
