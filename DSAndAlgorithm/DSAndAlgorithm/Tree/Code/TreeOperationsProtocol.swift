//
//  TreeProtocol.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 23/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


// BST Protocol
protocol BSTProtocol: class {
    //insert
    func addChild(elem: Int)
    func addChildIterative(elem: Int)
    //search
    func searchNode(elem: Int) -> Bool
    func searchNodeIterative(elem: Int) -> Bool
    //delete
    func deleteNode(elem: Int) -> Bool
}


protocol TreeTraversal: class {
    //inorder
    func inorder() -> [Int]
    func inorderIterative() -> [Int]
    //preorder
    func preorder() -> [Int]
    func preorderIterative() -> [Int]
    //postorder
    func postOrder() -> [Int]
    func postOrderIterative() -> [Int]
    //levelorder
    func levelOrder() -> [Int]
}


protocol TreeProperty {
    func height() -> Int
    func size() -> Int // Total number of elements in the tree
}


protocol TreeProblems {
    func printRootToLeaf() -> [String]
}
