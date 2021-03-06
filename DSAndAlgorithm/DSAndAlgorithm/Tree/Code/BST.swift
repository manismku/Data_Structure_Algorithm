//
//  TreeOperations.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 19/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class Output {
    var sum = 0
    var count = 0
}

// BinarySearchTree class
class BinarySearchTree: BSTProtocol {

    var root: TreeNode?
    private var output =  [Int]()
    var rootToLeaf =  [String]()
    var sum = 0

    func addChild(elem: Int) {
        // if there is no root
        guard let _ = self.root else {
            self.root = TreeNode(with: elem)
            return
        }

        // if there is root
        _ = insertElementRecursive(elem, root)
    }

    private func insertElementRecursive(_ elem: Int, _ node: TreeNode?) -> TreeNode {
        guard let validNode = node else {
            return TreeNode(with: elem)
        }

        if elem > validNode.val {
            validNode.right = insertElementRecursive(elem, validNode.right)
        } else {
            validNode.left = insertElementRecursive(elem, validNode.left)
        }

        return validNode
    }


    func addChildIterative(elem: Int) {

    }

    func searchNode(elem: Int) -> Bool {
        return false
    }

    func searchNodeIterative(elem: Int) -> Bool {
        return false
    }

    func deleteNode(elem: Int) -> Bool {
        return false
    }

}

//MARK:- Tree Property
extension BinarySearchTree: TreeProperty {

    // height of tree
    func height() -> Int {
        return calculateHeight(self.root)
    }

    // size of tree. each node will give its left and right childrens which current node will
    // add inorder to get the total children of a subtree for given node
    // same as calculating height
    func size() -> Int {
        return calculateSize(self.root)
    }

    //MARK:- Private
    // method to calculate height recursively
    // height of empty tree is Zero
    private func calculateHeight(_ aNode: TreeNode?) -> Int {
        guard let validNode = aNode else {
            return 0
        }

        // go left subtree
        let leftHeight = calculateHeight(validNode.left)
        // go right subtree
        let rightHeight = calculateHeight(validNode.right)

        // return max of either
        return maxOf(leftHeight, rightHeight) + 1
    }

    //calculate size recrusively
    private func calculateSize(_ aNode: TreeNode?) -> Int {
        guard let validNode = aNode else {
            return 0
        }

        let leftChildrens = calculateSize(validNode.left)
        let rightChildrens = calculateSize(validNode.right)

        return leftChildrens + rightChildrens + 1
    }

    // hepler
    private func maxOf(_ a: Int, _ b: Int) -> Int {
        return a > b ? a : b
    }

}


//MARK:- Traversal
extension BinarySearchTree: TreeTraversal {
    //MARK:- In Order
    func inorder() -> [Int] {
        // store putput
        self.output.removeAll()

        inorderRecursive(self.root)
        return self.output
    }

    func inorderIterative() -> [Int] {
        return [0]
    }

    //MARK:- Post Order
    func postOrder() -> [Int] {
        self.output.removeAll()

        postorderRecursive(self.root)
        return self.output
    }

    func postOrderIterative() -> [Int] {
        return [0]
    }


    //MARK:- Pre Order
    func preorder() -> [Int] {
        // store putput
        self.output.removeAll()

        preorderRecursive(self.root)
        return self.output
    }

    func preorderIterative() -> [Int] {
        return [0]
    }

    //MARK:- Level Order
    func levelOrder() -> [Int] {
        return [0]
    }

    //MARK:- Private
    private func inorderRecursive(_ node: TreeNode?) {
        guard let validNode = node else {
            return
        }
        // Go left
        inorderRecursive(validNode.left)
        // process node
        let elm = processNode(validNode)
        //store processed result
        self.output.append(elm)
        // Go right
        inorderRecursive(validNode.right)
    }


    private func postorderRecursive(_ node: TreeNode?) {
        guard let validNode = node else {
            return
        }
        // Go left
        postorderRecursive(validNode.left)
        // Go right
        postorderRecursive(validNode.right)

        // process node
        let elm = processNode(validNode)
        //store processed result
        self.output.append(elm)
    }

    private func preorderRecursive(_ node: TreeNode?) {
        guard let validNode = node else {
            return
        }

        // process node
        let elm = processNode(validNode)
        //store processed result
        self.output.append(elm)

        // Go left
        preorderRecursive(validNode.left)
        // Go right
        preorderRecursive(validNode.right)
    }

    private func processNode(_ node: TreeNode) -> Int {
        print("\(node.val) --->")
        return node.val
    }

}


