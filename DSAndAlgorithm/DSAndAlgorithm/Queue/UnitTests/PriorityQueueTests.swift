//
//  PriorityQueueTests.swift
//  Test
//
//  Created by Manish Kumar on 08/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest


class PriorityQueueTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPQCreate() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pq = LBPriorityQueue()

        let result = pq.create(input: [11,3,2,15,5,4,45])
        if let pHeap = try? result.get() {
            XCTAssert(pHeap == [2, 3, 11, 15, 5, 4, 45], "Not min heap.")
        }

        if case .failure(let failure) = result {
            print("\(failure.localizedDescription)")
        }
    }

    func testPQInsert() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pq = LBPriorityQueue()

        var result = pq.create(input: [11,3,2,15,5,4,45])

        result = pq.insert(elem: 1)

        if let pHeap = try? result.get() {
            XCTAssert(pHeap == [1, 3, 11, 15, 5, 4, 45, 2], "Not min heap. \(pHeap)")
        }

    }


    func testPQDelete() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pq = LBPriorityQueue()

        _ = pq.create(input: [11,3,2,15,5,4,45])

        var result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 2, "This is not minimum heap.")
        }


        result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 3, "This is not minimum heap.")
        }

        result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 4, "This is not minimum heap.")
        }

        result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 5, "This is not minimum heap.")
        }

        result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 11, "This is not minimum heap.")
        }


        result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 15, "This is not minimum heap.")
        }


        result = pq.delete()

        if let minimumElem = try? result.get() {
            XCTAssert(minimumElem == 45, "This is not minimum heap.")
        }
    }


}
