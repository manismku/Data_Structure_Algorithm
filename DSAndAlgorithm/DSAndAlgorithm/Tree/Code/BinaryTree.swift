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
    private var root: GenericNode<T>?
    private var output = [T]()

    init() {
        self.queue = LBQueue<GenericNode<T>>()
    }


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


