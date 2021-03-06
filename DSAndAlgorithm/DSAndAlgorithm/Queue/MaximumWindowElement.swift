//
//  MaximumWindowElement.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 13/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

extension LBDequeue {

    /*
     *  Create maximum window of size k
     *  1,20,11,2,3,9,5,8,10 -> 20, 20, 11 ,9, 9,10
     */
    static func maximumWindow(input: [T], windowSize: Int) -> [T] {

        // validate input
        guard windowSize > 0 && windowSize < input.count + 1  else {
            return [Int]()
        }

        let dq = LBDequeue(capacity: windowSize)

        // to hold output
        var output = [T]()

        //  first create window
        for (indx, value) in input.enumerated() {
            if indx > (windowSize - 1)
            {
                break
            }
            else
            {
                insertInQueue(val: value, dq: dq)
            }
        }

        // store max in output
        if case .success(let frontVal) = dq.getFront() {
            output.append(frontVal)
        }

        // slide window one psotion right till valid index
        for indx in 0..<input.count {
            // boundry condition
            if indx + windowSize >  input.count - 1 {
                break
            }

            // insert new element in dequeue
            insertInQueue(val: input[indx + windowSize], dq: dq)

            // Get max element from queue
            if case .success(let frontVal) = dq.getFront() {
                output.append(frontVal)
            }
        }

        // return output
        return output
    }

    private static func insertInQueue(val: T, dq: LBDequeue) {
        if case .success(let frontVal) = dq.getFront() {
            if val > frontVal {
                //delete from rear
                while !dq.isEmpty() {
                    _ = dq.deleteLast()
                }
                _ = dq.insertLast(item: val)

            } else {
                // if deque is full then delete front
                if dq.isFull() {
                    _ = dq.deleteFront()
                }
                // insert item
                _ = dq.insertLast(item: val)
            }
        } else if dq.isEmpty() {
            _ = dq.insertLast(item: val)
        }
    }
}

