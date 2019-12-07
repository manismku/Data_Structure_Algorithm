//
//  TreeTests+UnitTests.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 07/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

extension TreeTests {
    func testBSTkSmallestSum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 8)
        bst.addChild(elem: 5)
        bst.addChild(elem: 11)
        bst.addChild(elem: 2)
        bst.addChild(elem: 7)
        bst.addChild(elem: 3)

        let result = bst.findKSmallestElementSum(5)
        XCTAssert(result == 25, "Smalest Sum = \(result)")
    }

}
