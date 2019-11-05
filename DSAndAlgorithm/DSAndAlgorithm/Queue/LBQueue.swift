//
//  LBQueue.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 05/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


// Queue protocol / interface
protocol Queue {
    associatedtype T
    func enqueue(item: T) -> Result<Bool, QueueError>
    func deque() -> Result<T, QueueError>
    func isFull() -> Bool
    func isEmpty() -> Bool
}

enum QueueError: LocalizedError {
    case Full
    case Empty

    var localizedDescription: String {
        switch self {
        case .Full:
            return "Can't add item as Queue is full."
        case .Empty:
            return "Can't deque an item as queue is empty."
        }
    }
}


class LBQueue: Queue {

    typealias T = Int

    private let CAPACITY = 2
    private var size = 0
    private var items: [T]
    private var front: Int
    private var rear: Int

    init() {
        items = [T]()
        items.reserveCapacity(CAPACITY)
        front = 0
        rear = 0
    }

    func enqueue(item: T) -> Result<Bool, QueueError> {

        guard !isFull() else {
            return .failure(.Full)
        }

        items.append(item)
        size = items.count

        return .success(true)
    }

    func deque() -> Result<T, QueueError> {
        guard !isEmpty() else {
            return Result.failure(.Empty)
        }

        let val =  items.removeFirst()
        size -= 1
        return .success(val)
    }

    func isFull() -> Bool {
        return size == CAPACITY
    }

    func isEmpty() -> Bool {
        return size == 0
    }

    static func test() {
        let lbqueue = LBQueue()

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


