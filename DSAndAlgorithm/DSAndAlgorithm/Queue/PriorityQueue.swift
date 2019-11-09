//
//  PriorityQueue.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 06/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

/*
 *  A priority queue is queue element are stored in priority
 *  It can be of type min or max. Max and Min heap is a priority queue.
 *  Max or Min Heap is complete binary tree where every level is completely filled, except possibly the last.
 *  And it fills from left to right
 */

/*
 *   Abstract Priority Queue
 */

protocol PriorityQueue {
    associatedtype T
    func create(input: [T]) -> Result<[T], PQError>
    func insert(elem: T) -> Result<[T], PQError>
    func delete() -> Result<T, PQError>
    func getPriorityElement() -> Result<T, PQError>
}


/*
 *   Encapsualte all PQErrors
 */
enum PQError: LocalizedError {
    case Empty
    case ElementNotFound

    var localizedDescription: String {
        switch self {
        case .Empty:
            return "Heap is empty."
        case .ElementNotFound:
            return "Element not found."
        }
    }
}


class LBPriorityQueue: PriorityQueue {


    typealias T = Int

    private var items: [T] = [T]()
    private let MIN_INDEX = 0

    //private methods / functions
    private func leftChildIndex(_ index: Int) -> Int {
        return (index * 2) + 1
    }

    private func rightChildIndex(_ index: Int) -> Int {
        return (index * 2) + 2
    }

    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) % 2
    }

    private func isInRange(indx: Int) -> Bool {
        return (indx < self.items.count) &&  (indx > -1 )
    }

    /*
     *  This function will take current index and will run min-heap check on it's parent.
     *  If it satisfy will return else will recursively call swim-up on
     *  its parent.
     *  base case for recursion is = first node
     *  runTime Complexity= O(logn)
     */
    private func swimUp(_ curIndx: Int) {
        //Get parent index of current element
        let parentIndx = parentIndex(curIndx)
        guard isInRange(indx: parentIndx) else {
            return
        }

        //current and parent value
        let curVal = self.items[curIndx]
        let prntVal = self.items[parentIndx]

        // check min-heap condition on parent
        if curVal < prntVal {
            // replace
            self.items.swapAt(curIndx, parentIndx)
            // swim-up now and check at parent index
            swimUp(parentIndx)
        }
    }


    func getPriorityElement() -> Result<T, PQError> {

        guard self.items.count > 0 else {
            return .failure(.Empty)
        }

        return .success(self.items[MIN_INDEX])
    }

    /*
     *  This function will create min-heap on input
     */
    func create(input: [T]) -> Result<[T], PQError> {

        guard input.count > 0 else {
            return .success(input)
        }

        // store items
        self.items = input

        for (index, _ ) in items.enumerated() {
            if index == MIN_INDEX {
                continue
            }

            //perform swim-up
            swimUp(index)
        }

        print("Actual Minimum Heap is = \(self.items)")
        return .success(self.items)
    }

    /*
     *  insert operation on priority queue will insert a key into PQ.
     *  We will first append the item in last (since it is complete binary tree)
     *  and then perform swim-up
     */
    func insert(elem: T) -> Result<[T], PQError> {
        self.items.append(elem)
        // perform swim-up on last index
        swimUp(self.items.count - 1)

        return .success(self.items)
    }


    /*
     *  Delete operation on min-heap will extract the value from heap delete
     *  that element. This operation will reduce size of the heap.
     *  We can't delete any random element as it will violate CBT property of Heap.
     *  So we repalce last with first and then delete last element.
     *  Since element at root is changed now we have to push it dowm
     */
    func delete() -> Result<T, PQError> {
        guard self.items.count > 0 else {
            return .failure(.Empty)
        }
        //get the minimum value from heap
        let minVal = self.items[MIN_INDEX]
        let size = self.items.count
        self.items.swapAt(MIN_INDEX, (size - 1))

        //remove last item
        self.items.removeLast()

        //swim-down from root
        swimDown(MIN_INDEX)

        print("New Min Heap is = \(self.items)")

        return .success(minVal)
    }

    private func swimDown(_ curIndx: Int) {

        guard isInRange(indx: curIndx) else {
            return
        }

        let curVal = self.items[curIndx]
        let lIndx = self.leftChildIndex(curIndx)
        let rIndx = self.rightChildIndex(curIndx)
        var indexToSwap = curIndx
        var lVal: T?
        var rVal: T?

        if isInRange(indx: lIndx) {
            lVal = self.items[lIndx]
        }

        if isInRange(indx: rIndx) {
            rVal = self.items[rIndx]
        }


        // if only left children is present
        if let _ = lVal {
            indexToSwap = lIndx
        }

        // if only right children is present
        if let _ = rVal {
            indexToSwap = rIndx
        }


        // if both left and right children is present
        if let lChildVal = lVal, let rChilVal = rVal {
            if lChildVal < rChilVal {
                indexToSwap = lIndx
            } else {
                indexToSwap = rIndx
            }
        }

        // there is no further down we are swimming
        guard indexToSwap != curIndx else {
            return
        }

        // current is not minimum hence need to be pushed either left or right
        if curVal > self.items[indexToSwap] {
            self.items.swapAt(curIndx, indexToSwap)
        }

        swimDown(indexToSwap)
    }

}


extension LBPriorityQueue  {
    static func testLBPriorityQueue() {
        let pq = LBPriorityQueue()

        var pqoutput = pq.create(input: [11,3,2,15,5,4,45])

        print("Heap priority queue = \(pqoutput)")

        print("Minimu element is = \(pq.delete())")

        //pqoutput = pq.insert(elem: 1)

        print("Heap priority now = \(pqoutput)")

        print("Minimu element is = \(pq.delete())")


    }
}


