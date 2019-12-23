//
//  HeapTests.swift
//  Test
//
//  Created by Manish Kumar on 22/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class HeapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBinaryHeapGetMin() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       let bh = BinaryHeap<Int>()
        bh.insert(key: 11)
        bh.insert(key: 3)
        bh.insert(key: 2)
        bh.insert(key: 1)
        bh.insert(key: 15)
        bh.insert(key: 5)
        bh.insert(key: 4)
        bh.insert(key: 45)

        print("This is array = \(bh.array)")

        XCTAssert(bh.getMin() == 1, "Incorrect Heap")
    }

    func testBinaryHeapExtract() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bh = BinaryHeap<Int>()
        bh.insert(key: 11)
        bh.insert(key: 3)
        bh.insert(key: 2)
        bh.insert(key: 1)
        bh.insert(key: 15)
        bh.insert(key: 5)
        bh.insert(key: 4)
        bh.insert(key: 45)

        let min = bh.deleteMin()

        print("This is array = \(bh.array)")


        XCTAssert(min == 1, "Incorrect Minimum")
        XCTAssert(bh.getMin() == 2, "Incorrect Heap = \(bh.getMin())")
    }


    func testBinaryHeapWithThreeNodes() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bh = BinaryHeap<Int>()
        bh.insert(key: 11)
        bh.insert(key: 3)
        bh.insert(key: 2)
        let min = bh.deleteMin()

        print("This is array = \(bh.array)")


        XCTAssert(min == 2, "Incorrect Minimum")
        XCTAssert(bh.getMin() == 3, "Incorrect Heap = \(bh.getMin())")
    }


}
