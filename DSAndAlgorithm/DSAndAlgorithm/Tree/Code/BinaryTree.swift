//
//  BinaryTree.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 23/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


class GenericNode<T> {
    var value: T
    var left: GenericNode<T>?
    var right: GenericNode<T>?

    init(value: T) {
        self.value = value
    }
}


// we are covering binary tree as complete tree as this will cover both Binary Tree problem
// and Complete Binary problem
class CompleteBinaryTree<T> {

    private var queue: LBQueue<GenericNode<T>>
    private(set) var root: GenericNode<T>?
    private var output = [T]()
    private var rootCloned: GenericNode<T>?

    private var diameter: Int = 0

    init() {
        self.queue = LBQueue<GenericNode<T>>()
    }

    //MARK:- Attribute
    func createCBT(of input: [T]) {
        guard root == nil else {
            return // CBT is already created
        }
        for elem in input {
            // create node of this element
            let newNode = GenericNode<T>(value: elem)
            if queue.isEmpty {
                _ = queue.enqueue(elem: newNode) // we can directly enque it
                root = newNode
            } else {
                var frnt = queue.front!
                if frnt.right != nil && frnt.left != nil {
                     _ = try! queue.dequeue().get()
                    frnt = queue.front!
                }

                if frnt.left == nil {
                    frnt.left = newNode
                } else if  frnt.right == nil {
                    frnt.right = newNode
                }

                // new node have to enqeued in all cases
                 _ = queue.enqueue(elem: newNode)
            }
        }

        //empty from queue
        while !queue.isEmpty {
            _ = try! queue.dequeue().get() // deque all the elements
        }

    }

    func searchNode(elem: T) -> Bool {
        return false
    }

    func deleteNode(elem: T) -> Bool {
        return false
    }
}

extension CompleteBinaryTree {
    func inorder() -> [T] {
        inorderRecursive(self.root)
        return self.output
    }

    //MARK:- Private
    private func inorderRecursive(_ node: GenericNode<T>?) {
        guard let validNode = node else {
            return
        }
        // Go left
        inorderRecursive(validNode.left)
        // process node
        //store processed result
        self.output.append(validNode.value)
        // Go right
        inorderRecursive(validNode.right)
    }
}

/*
 *
 *                        PROBLEMS
 *                        PROBLEMS
 *                        PROBLEMS
 *
 */


//MARK: Problems
//MARK:- Problem 1. Diameter of tree
extension CompleteBinaryTree {
    func calculateDiameter() -> Int {
        _ = calculateDiameter(self.root)
        return self.diameter
    }

    private func calculateDiameter(_ node: GenericNode<T>?) -> Int {

        guard let validNode = node else {
            return 0
        }

        let leftHeight = calculateDiameter(validNode.left)
        let rightHeight = calculateDiameter(validNode.right)

        // this is calculation based on height after height is calculated for both left and right subtree
        // of the node
        self.diameter = maxOf(self.diameter, leftHeight + rightHeight + 1)

        return 1 + maxOf(leftHeight, rightHeight) // this is the calculation of left and right subtree

    }

    // hepler
    private func maxOf(_ a: Int, _ b: Int) -> Int {
        return a > b ? a : b
    }

}

//MARK:-  Problem 2. Create cloned binary tree
extension CompleteBinaryTree {
    func createClonedBinaryTree() {

        // first cloned root node
        guard let validRoot = self.root else {
            return
        }

        // since we have valid root so make root of cloned tree
        self.rootCloned =  GenericNode<T>(value: validRoot.value)

        cloneBinaryTree(validRoot, clonNode: self.rootCloned)

    }

    private func cloneBinaryTree(_ node: GenericNode<T>?, clonNode: GenericNode<T>?) {

        guard let validNode = node else { return } // stop if found NULL

        // if left side is value
        if let value = validNode.left?.value {
            let rightNode = GenericNode<T>(value: value)
            clonNode?.right = rightNode
        }

        // if right side is value
        if let value = validNode.right?.value {
            // create a node
            let leftNode = GenericNode<T>(value: value)
            clonNode?.left = leftNode
        }

        cloneBinaryTree(validNode.left, clonNode: clonNode?.right)
        cloneBinaryTree(validNode.right, clonNode: clonNode?.left)

    }

    func inorderClonedTree() -> [T] {
        // first clone
        createClonedBinaryTree()
        // do inorder
        inorderRecursive(self.rootCloned)
        //send output to test
        return self.output
    }
}


//MARK:- Problem 3. Print level with maximum sum in a binary tree
extension CompleteBinaryTree  {

    func levelWithMaxSum(_ aRoot: GenericNode<Int>?) -> Int {
        var currLvlElemCounter = 0
        var nextLvlElemCounter = 0
        var queue = LBQueue<GenericNode<Int>>()
        var maxSum = 0

        guard var validNode = aRoot  else {
            return 0
        }

        _ = queue.enqueue(elem: validNode)
        currLvlElemCounter += 1

        while !queue.isEmpty {
            // push in queue
            var currMax = 0
            for _ in 0..<currLvlElemCounter {
                if let newNode = try? queue.dequeue().get() {                    
                    if let leftNode = newNode.left {
                        _ = queue.enqueue(elem: leftNode)
                        nextLvlElemCounter += 1
                    }
                    if let rightNode = newNode.right {
                        _ = queue.enqueue(elem: rightNode)
                        nextLvlElemCounter += 1
                    }
                    currMax += newNode.value
                }
            }

            // Now iterate to the next level counter
            currLvlElemCounter = nextLvlElemCounter
            nextLvlElemCounter = 0

            if currMax > maxSum {
                maxSum = currMax
            }
        }

        return maxSum
    }


}
