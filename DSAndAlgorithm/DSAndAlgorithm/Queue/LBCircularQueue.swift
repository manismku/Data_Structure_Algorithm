//
//  LBQueue.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 05/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


// Queue protocol / interface
protocol CircularQueue {
    associatedtype T
    func enqueue(item: T) -> Result<Bool, QueueError>
    func deque() -> Result<T, QueueError>
    func front() -> Result<T, QueueError>
    func rear() ->  Result<T, QueueError>
    func isFull() -> Bool
    func isEmpty() -> Bool
}

enum QueueError: LocalizedError {
    case Full
    case Empty
    case InvalidInput

    var localizedDescription: String {
        switch self {
        case .Full:
            return "Queue is full."
        case .Empty:
            return "Queue is empty."
        case .InvalidInput:
            return "Input is not valid."
        }
    }
}


class LBCircularQueue: CircularQueue {

    typealias T = Int

    private let CAPACITY = 2
    private var size = 0
    private var items: [T]
    private var frontIndx: Int
    private var rearIndx: Int

    init() {
        items = [T]()
        items.reserveCapacity(CAPACITY)
        frontIndx = 0
        rearIndx = -1
    }

    func enqueue(item: T) -> Result<Bool, QueueError> {

        guard !isFull() else {
            return .failure(.Full)
        }

        rearIndx = (rearIndx + 1) % self.CAPACITY

        items.insert(item, at: rearIndx)
        size += 1

        return .success(true)
    }

    func deque() -> Result<T, QueueError> {
        guard !isEmpty() else {
            return Result.failure(.Empty)
        }

        let val =  items[frontIndx]
        self.frontIndx = (frontIndx + 1) % CAPACITY
        size -= 1
        return .success(val)
    }

    func isFull() -> Bool {
        return size == CAPACITY
    }

    func isEmpty() -> Bool {
        return size == 0
    }


    func front() -> Result<T, QueueError> {

        guard !isEmpty() else {
            return Result.failure(.Empty)
        }

        return .success(items.first!)
    }

    func rear() ->  Result<T, QueueError> {

        guard !isFull() else {
            return Result.failure(.Full)
        }

        return .success(items.last!)
    }


    static func test() {
        let lbqueue = LBCircularQueue()

        _ = lbqueue.enqueue(item: 10)
        _ = lbqueue.enqueue(item: 5)

        let enqresult = lbqueue.enqueue(item: 5)
        
        switch enqresult {
        case .success(_):
            print("Enqueud succfully")
        case .failure(let error):
            print(error.localizedDescription)
        }

        var result = lbqueue.deque()

        switch result {
        case .success(let num):
            print("\(num) Dequed.")
        case .failure(let error):
            print(error.localizedDescription)
        }

        // Dequeu
        result = lbqueue.deque()

        switch result {
        case .success(let num):
            print("\(num) Dequed.")
        case .failure(let error):
            print(error.localizedDescription)
        }

        // Dequeu
        _ = lbqueue.enqueue(item: 5)

        result = lbqueue.deque()

        switch result {
        case .success(let num):
            print("\(num) Dequed.")
        case .failure(let error):
            print(error.localizedDescription)
        }

        result = lbqueue.deque()

        switch result {
        case .success(let num):
            print("\(num) Dequed.")
        case .failure(let error):
            print(error.localizedDescription)
        }

    }
}


