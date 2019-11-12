//
//  Stack.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 11/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

enum StackError: Error {
    case invalidPop
    case stackOverflow
    case noElement
}

class Stack<T> {
    private var elements = [T]()

    //stack - start
    var isEmpty: Bool {
        return elements.count == 0
    }

    func push(_ symbol: T) {
        elements.append(symbol)
    }

    func pop() throws ->  T {
        guard elements.isEmpty == false else {
            throw StackError.invalidPop
        }
        return elements.removeLast() //handle error on pop
    }

    func top() throws -> T {
        guard elements.isEmpty == false else {
            throw StackError.noElement
        }
        return elements.last!
    }
    //end - stack
}
