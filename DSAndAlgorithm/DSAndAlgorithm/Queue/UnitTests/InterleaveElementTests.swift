//
//  InterleaveElement.swift
//  Test
//
//  Created by Manish Kumar on 11/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class InterleaveElement: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInterleaveElementsInQueue() {
        let result = LBQueue.interleaveElements(input: [1,2,3,4,5,6])
        let interLeavedElements = try? result.get()

        XCTAssert(interLeavedElements == [1,4,2,5,3,6], "FAILED output is = \(String(describing: interLeavedElements))")

    }

    func testInterleaveElementsOddInput() {
        let result = LBQueue.interleaveElements(input: [1,2,3,4,5])

        do {
                _ = try result.get()
        } catch let error {
            XCTAssert(error as! QueueError == QueueError.InvalidInput , "")
            return
        }

        XCTAssertFalse(true)
    }


}
