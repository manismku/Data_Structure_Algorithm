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
class CompleteBinaryTree<T: Comparable> {

    private var queue: LBQueue<GenericNode<T>>
    private(set) var root: GenericNode<T>?
    private var output = [T]()
    private var rootCloned: GenericNode<T>? // This is for root node of cloned tree
    private var lcaNode: GenericNode<T>? // This is for LCA node

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

        return searchPrivate(self.root, elem: elem)
    }

    func searchPrivate(_ node: GenericNode<T>?, elem: T) -> Bool {

        guard let validNode = node else {
            return false // we dont have root
        }

        if validNode.value == elem {
            return true
        }

        return searchPrivate(validNode.left, elem: elem) || searchPrivate(validNode.right, elem: elem)

    }

    func deleteNode(elem: T) -> Bool {
        return false
    }
}

//MARK:- Recursive Traversal log(n) complexity with O(n) space(comes from stack)
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

//MARK:- Iterative Traversal Usin Stack. Time Complexity O(n)
extension CompleteBinaryTree {
    func inorderIterative() -> [T] {
        self.output.removeAll()
        let aStack = Stack<GenericNode<T>>()
        var currentNode = self.root

        while currentNode != nil || aStack.isEmpty == false {
            // a push
            while let validCurNode = currentNode {
                aStack.push(validCurNode)
                currentNode = currentNode?.left
            }
            
            do {
                 currentNode = try aStack.pop()
                 self.output.append(currentNode!.value)
                 currentNode = currentNode?.right
            } catch( _) {
                print("No error")
            }
        }

        return self.output
    }

}


//MARK:- Threaded Traversal(Morris Traversal) Using Thread. Time Complexity - O(n), Space O(1)
extension CompleteBinaryTree {

    func morrisTraversalInorder() -> [T] {
        self.output.removeAll()
        return self.output
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
        let queue = LBQueue<GenericNode<Int>>()
        var maxSum = 0

        guard let validNode = aRoot  else {
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


//MARK:- Problem 4. Find LCA of nodes.
// we using optional here to check error / no values
extension CompleteBinaryTree  {

    func findLCA(firstVal: T, secondVal: T) -> T? {

        // guard for the roo
        guard let _ = self.root else {
            return nil
        }

        if findLCA(firstVal, secondVal, self.root) {
            return self.lcaNode?.value
        }

        return nil
    }

    private func findLCA(_ firstVal: T?, _ secondVal: T?, _ node: GenericNode<T>?) -> Bool {

        // check both should not be equal
        guard firstVal != secondVal else {
            return false
        }

        guard let currNode =  node else {
            return false
        }

        var left = false // true
        var right = false // true
        var current = false

        if currNode.value == firstVal || currNode.value == secondVal {
            current = true
        }

        left = findLCA(firstVal, secondVal, currNode.left)
        right = findLCA(firstVal, secondVal, currNode.right)

        // previous stack 
        if (left && right) ||  (right && current) || (left && current) {
            self.lcaNode = currNode
        }

        // current stack
        if left || right || current {
            return true
        } else {
            return false
        }
    }
}


//MARK:- find last node for each type of traversal
extension CompleteBinaryTree {

    // LDR
    func findInorderOLastNode() -> T? {
        guard let validTree = self.root else {
            return nil
        }
        let lastNode = findInorderOLastNode(validTree)
        return lastNode.value
    }

    private func findInorderOLastNode(_ node: GenericNode<T>) -> GenericNode<T> {

        guard let validNode = node.right else {
            return node
        }

        let last = findInorderOLastNode(validNode)

        return last
    }


    func findLastNodeInCBT() -> GenericNode<T>?  {
        guard let validNode = self.root else {
            return nil
        }

        let aQueue = LBQueue<GenericNode<T>>()
        _ = aQueue.enqueue(elem: validNode)

        var curNode = validNode
        while aQueue.isEmpty == false {

            guard let  front = try? aQueue.dequeue().get() else {
                break
            }

            if let frontLeft = front.left {
               _ =  aQueue.enqueue(elem: frontLeft)
            }

            if let frontRight = front.right  {
                _ = aQueue.enqueue(elem: frontRight)
            }

            curNode = front
        }

        return curNode
    }

}


extension CompleteBinaryTree {

    func findInorderSuccessor(for value: T) -> T? {

        guard let validNode = self.root else {
            return nil
        }

        return value
    }



    private func findInorderSuccessor(_ node: GenericNode<T>?, for elem: T) -> GenericNode<T>? {

        return nil
//        guard let validNode = node else {
//            return nil // aim is that we wil not hit till this point and if we hit node is not foundi if we are doing preprocessing of the node
//        }
//
//        var isLeftFound = false
//        var isRightFound = false
//        var foundNode: GenericNode<T>?
//
//        if validNode.value == elem {
//            foundNode = validNode
//        }
//
//        // 4.left = nil
//        if let validfoundNode = findInorderSuccessor(validNode.left, for: elem) {
//            // but if we found left side
//            //foundNode = validfoundNode
//            isLeftFound = true
//        } else let validfoundNode = findInorderSuccessor(validNode.right, for: elem) {
//            // we didnt found left thats why we are now coming right side
//            // execute cases for in order processing
//            //foundNode = validfoundNode
//            isRightFound = true
//            if validfoundNode.value == elem { // we have no right subtree
//
//            } else { // this could be successor node which found node has returned
//
//            }
//        }
//
//        // we didn't found left or right.
//        guard let nodeWeFound = foundNode else {
//            return nil
//        }
//
//        if nodeWeFound.right != nil {
//            // we have right node.
//            // lets find leftmost node in this subtree rooted at 'nodeWeFound'
//
//            guard var sucessorNode = nodeWeFound.right?.left else {
//                return nodeWeFound.right
//            }
//
//            // keep going to left
//            while let aNode = sucessorNode.left {
//                sucessorNode = sucessorNode.left
//            }
//
//            // at this point we have left most node in right subtree
//            return sucessorNode
//
//        } else {
//            // we dont have right node. so need to got ancesstor or parent ( and if ancesstor is NULL then this is the last node)
//            // because we already at node and for inorder succesor if already on node then you go right
//
//            // time to check just return to parent and ancesstor
//            // this also means I can't complete my job to find successor and leving for parent and ancesstor
//
//            return nodeWeFound
//
//            // we are returning two type of values so check must be there
//        }
//


    }



     func successor(_ node: GenericNode<T>?, target: T)  {

    }

    func findInorderPredecessor() -> Int {
        return 0
    }
}


