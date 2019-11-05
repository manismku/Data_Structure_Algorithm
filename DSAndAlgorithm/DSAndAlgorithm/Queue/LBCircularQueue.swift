//
//  LBCircularQueue.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 05/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation
// DeQueue protocol / interface
protocol Dequeue {
    associatedtype T
    func insertFront()
    func insertLast()
    func deleteFront()
    func deleteLast()

    func getFront()
    func getRear()
    func isEmpty()
    func isFull()
}
