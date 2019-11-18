//
//  LBCircularQueue.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 05/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

// Dequeue protocol / interface for circular double ended queue
protocol Dequeue {
    associatedtype T
    func insertFront(item: T) -> Result<T, QueueError>
    func insertLast(item: T) -> Result<T, QueueError>
    func deleteFront() -> Result<T, QueueError>
    func deleteLast() -> Result<T, QueueError>

    //func getFront() -> Result<T, QueueError>
    //func getRear() -> Result<T, QueueError>
    func isEmpty() -> Bool
    func isFull() -> Bool

    func getFront() -> Result<T, QueueError>
    func getRear() -> Result<T, QueueError>
}

class LBDequeue: Dequeue {

    typealias T = Int
    private var capacity: Int
    private var size = 0
    private var items: [T]
    private var frontIndx: Int
    private var rearIndx: Int


    init(capacity: Int) {
        self.items = [T]()
        self.capacity = capacity
        items.reserveCapacity(capacity)
        self.frontIndx = -1
        self.rearIndx = 0
    }

    func insertFront(item: T) -> Result<T, QueueError> {

        //check if we can insert an item
        guard !self.isFull() else {
            return .failure(.Full)
        }

        if self.isEmpty() {
            frontIndx = 0
            rearIndx = 0
        } else if frontIndx == 0 {
            frontIndx = self.capacity - 1
        } else {
            frontIndx = frontIndx - 1
        }

        self.items.insert(item, at: frontIndx)
        // increase size by 1
        self.size += 1
        return .success(0)
    }

    func insertLast(item: T) -> Result<T, QueueError> {

        //we can insert only if Queue is not full
        guard !self.isFull() else {
            return .failure(.Full)
        }

        if self.isEmpty() {
            rearIndx = 0
            frontIndx = 0 
        } else if rearIndx == (self.capacity - 1) {
                rearIndx = 0
        } else {
            rearIndx += 1
        }

        self.items.insert(item, at: rearIndx)

        return .success(0)
    }

    func deleteFront() -> Result<T, QueueError> {

        if frontIndx == rearIndx {
            frontIndx = -1
            rearIndx = 0
        } else if frontIndx == self.capacity - 1 {
            frontIndx = 0
        } else {
            frontIndx += 1
        }

        return .success(0)
    }

    func deleteLast() -> Result<T, QueueError> {

        self.items.remove(at: rearIndx)
        if frontIndx == rearIndx {
            frontIndx = -1
            rearIndx = 0
        } else if rearIndx == 0 && frontIndx == self.capacity - 1 {
            rearIndx = self.capacity - 1
        } else {
            rearIndx -= 1
        }

        return .success(0)
    }

    func isEmpty() -> Bool {
        return frontIndx == -1
    }

    func isFull() -> Bool {
        return (rearIndx + 1) % self.capacity == frontIndx
    }

    func getFront() -> Result<T, QueueError> {

        guard !isEmpty() else {
            return .failure(.Empty)
        }

        return .success(self.items[frontIndx])
    }

    func getRear() -> Result<T, QueueError> {

        guard !isEmpty() else {
            return .failure(.Empty)
        }

        return .success(self.items[rearIndx])
    }


    static func testDqueue() {

        let lbDqueue = LBDequeue(capacity: 2)

        var result = lbDqueue.insertFront(item: 1)
        print("1st OP result is = \(result)")

        result = lbDqueue.insertLast(item: 3)
        print("2nd OP result is = \(result)")


        result = lbDqueue.getFront()
        print("Front element is = \(result)")

        result = lbDqueue.getRear()
        print("Rear element is = \(result)")

        result = lbDqueue.insertLast(item: 3)
        print("3rd Element is = \(result)")

        result = lbDqueue.deleteFront()
        print("Front deleted = \(result)")

        result = lbDqueue.getFront()
        print("Front element is = \(result)")

        result = lbDqueue.getRear()
        print("Rear element is = \(result)")

    }

}
