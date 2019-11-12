//
//  InterleaveElements.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 11/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


// Extension on LBQueue to implement Interleave Elements in Queue
extension LBQueue {

    /*  Interleave Elements will interleave hlaf elements in queue using a Stack.
     *  Operations supported are only Enqueue/Dequeue and Push/Pop
     *  @param
     *  input: A queue array of type T (Int, Float)
     */

    static func interleaveElements(input: [T]) -> Result<[T], QueueError> {

        guard input.count % 2 == 0 else { return  .failure(.InvalidInput)}

        let stack = Stack<T>()
        let queue = LBQueue()


        //add elements to queue
        for elem in input {
            _ = queue.enqueue(elem: elem)
        }

        let HALF = queue.size / 2
        var count = HALF

        //Enqueue front half of queue
        while count > 0  {
            if let frontVal = try? queue.dequeue().get() {
                _ = queue.enqueue(elem: frontVal)
            }
            count -= 1
        } // 4,5,6,1,2,3

        count = HALF
        // push first half to Stack
        while count > 0  {
            if let frontVal = try? queue.dequeue().get() {
                stack.push(frontVal)
            }
            count -= 1
        } // 1,2,3     4,5,6(top) in stack

        //pop stack and enqueue top
        while true {
            guard let popedElem = try? stack.pop() else {
                break
            }
            _ = queue.enqueue(elem: popedElem)
        } // 1,2,3,6,5,4


        count = HALF
        //  //Enqueue front half of queue
        while count > 0  {
            if let frontVal = try? queue.dequeue().get() {
                _ = queue.enqueue(elem: frontVal)
            }
            count -= 1
        } // 6,5,4,1,2,3

         count = HALF

        //Enqueue first half to stack
        while count > 0  {
            if let frontVal = try? queue.dequeue().get() {
                stack.push(frontVal)
            }
            count -= 1
        } // 1,2,3    6,5,4(top)

        count = HALF
        //Enqueue and Pop again
        while count > 0  {
            if let frontVal = try? queue.dequeue().get() {
                // 1. Enqueue element from front
                _ = queue.enqueue(elem: frontVal)

                // 2. Enqueue element from Stack
                guard let popedElem = try? stack.pop() else {
                    continue
                }
                 _ = queue.enqueue(elem: popedElem)
            }
            count -= 1
        } // 1,2,5,4

        return .success(queue.queue)
    }
}

