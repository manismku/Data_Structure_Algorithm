//
//  MAXWindowTests.swift
//  Test
//
//  Created by Manish Kumar on 18/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class MAXWindowTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaxWindow() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let output = LBDequeue.maximumWindow(input: [1,3,-1,-3,5,3,6,7], windowSize: 3)
        XCTAssert(output == [3,3,5,5,6,7], "Not sliding window max")
    }


    func testMaxWindowWithWindowSizeOne() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let output = LBDequeue.maximumWindow(input: [1,3,-1,-3,5,3,6,7], windowSize: 1)
        XCTAssert(output == [1,3,-1,-3,5,3,6,7], "With window size one output should be same as input array")
    }


    func testMaxWindowWithWindowSizeZero() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let output = LBDequeue.maximumWindow(input: [1,3,-1,-3,5,3,6,7], windowSize: 0)
        XCTAssert(output == [], "Not sliding window. There should not be any element inside the window.")
    }


}
