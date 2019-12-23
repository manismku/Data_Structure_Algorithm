//
//  HuffmancodingTests.swift
//  Test
//
//  Created by Manish Kumar on 23/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class HuffmancodingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let hc = HuffmanCoding(input: ["a" : 5, "b" : 9, "c" : 12, "d" : 13, "e" : 16, "f" : 45])
        hc.createHuffmanTree()
        let result = hc.getBitTable()

        XCTAssert(result == ["a" : "1100", "b" : "1101", "c" : "100", "d" : "101", "e" : "111", "f" : "0"], "result is = \(result)")
    }


}
