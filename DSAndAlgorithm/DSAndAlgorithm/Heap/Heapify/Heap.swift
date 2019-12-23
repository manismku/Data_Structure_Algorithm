//
//  Heap.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 22/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

//TO-DO: A binary heap should have capacity. We can't insert more than the capacity of the binary heap
class BinaryHeap<T: Comparable> {

    // We use array data structure to store the heap
    lazy private(set) var array = [T]()

    var size: Int {
        return self.array.count
    }

    func insert(key: T) {
        self.array.append(key)
        swimup(index: (size - 1))
    }

    func getMin() -> T {
        return array[0] // since elements are stored in array as level order traversal of CBt
    }

    func deleteMin() -> T? {
        guard self.size != 0  else {
            return nil
        }

        let min = self.array[0]
        self.array.swapAt(0, size - 1)
        self.array.removeLast()
        // we have changed at first index
        swimdown(0)
        return min
    }
}


// MARK: - Childs
extension BinaryHeap {
    private func parent(_ index: Int) -> Int {
        return ( index - 1) / 2
    }

    private func leftChild(_ index: Int) -> Int {
        return ( 2 * index + 1)
    }

    private func rightChild(_ index: Int) -> Int {
        return ( 2 * index + 2)
    }
}


// MARK: - Private
private extension BinaryHeap {
    func swimup(index: Int) {

        guard index > 0 else { return }

        let p = parent(index)

        if self.array[p] > self.array[index] {
            self.array.swapAt(index, p)
            swimup(index: p)
        }
    }

    func findSwapIndex(_ leftIndex: Int, _ minIndex: inout Int, _ rightIndex: Int) {
        if self.array[leftIndex] < self.array[minIndex] {
            minIndex = leftIndex
        }

        if self.array[rightIndex] < self.array[minIndex] {
            minIndex = rightIndex
        }
    }

    func swimdown(_ index: Int) {

        let leftIndex = self.leftChild(index)
        let rightIndex =  self.rightChild(index)

        print("Left Index = \(leftIndex) and RightIndex = \(rightIndex)")
        print("Array is = \(self.array)")

        guard leftIndex < self.size else { return }
        guard rightIndex < self.size else {
            if self.array[leftIndex] < self.array[index] {
                self.array.swapAt(leftIndex, index)
            }
            return
        }

        var minIndex = index
        findSwapIndex(leftIndex, &minIndex, rightIndex)
        if minIndex != index {
            self.array.swapAt(index, minIndex)
        }
        swimdown(minIndex)
    }
}


// MARK: - Utility
extension BinaryHeap {
    func swap(i: Int, j: Int) {
            self.array.swapAt(i, j)
    }
}
