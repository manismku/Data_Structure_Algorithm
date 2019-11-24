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
    var isEmpty: Bool { get } // read only
    var size: Int { get } // read only
    var front: T? { get } // read only
    func enqueue(elem: T) -> Result<[T], QueueError>
    func dequeue() -> Result<T, QueueError>
}

class LBQueue<T>: Queue {

    private var items: [T]
    private var FRONT = 0

    var isEmpty: Bool {
        return self.items.count == 0
    }

    var size: Int {
        return self.items.count
    }

    var queue: [T] {
        return self.items
    }

    var front: T? {
        return self.items.first
    }

    init() {
        self.items = [T]()
    }


    //AMRK: - Main operations
    func enqueue(elem: T) -> Result<[T], QueueError> {
        self.items.append(elem)
        return .success(self.items)
    }

    func dequeue() -> Result<T, QueueError> {
        guard !self.isEmpty else {
            return .failure(.Empty)
        }
        let front = self.items[FRONT]
        self.items.removeFirst()
        return .success(front)
    }

    //AMRK: - Aux Operation

}
