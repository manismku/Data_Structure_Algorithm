//
//  Queue.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 11/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype T
    var size: Int { get }
    var queue: [T] { get }
    func dequeue() -> Result<T, QueueError> //Dequeue
    func enqueue(elem: T) -> Result<[T], QueueError>
}


class LBQueue: Queue {

    typealias T = Int
    private var items: [T]
    private var FRONT = 0

    var size: Int {
        return self.items.count
    }

    var queue: [T] {
        return self.items
    }

    init() {
        self.items = [T]()
    }

    private func isEmpty() -> Bool {
        return self.items.count == 0
    }

    func enqueue(elem: T) -> Result<[T], QueueError> {
        self.items.append(elem)
        return .success(self.items)
    }

    func dequeue() -> Result<T, QueueError> {
        guard !self.isEmpty() else {
            return .failure(.Empty)
        }
        let front = self.items[FRONT]
        self.items.removeFirst()
        return .success(front)
    }
}
