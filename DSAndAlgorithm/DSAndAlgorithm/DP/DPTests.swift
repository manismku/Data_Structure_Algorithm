//
//  01KnapsackTests.swift
//  Test
//
//  Created by Manish Kumar on 26/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class DPTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKnapsack() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ks = Knapsack(knapsack: 8, weights: [1,3,4,5], values: [1,4,5,7])
        let output = ks.solveKnapsack()
        XCTAssert(output == (11, [5,3]), "Not an optimal solution")
    }

    func testRodCutting() {
        let rodCutting =  Rodcutting(data: (totalCapacity: 8, sizes: [1,2,3,4,5,6,7,8], values: [1, 5, 8, 9, 10, 17, 17, 20]))
        if let output = rodCutting.solveRodCutting() {
            XCTAssert(output.maxValue == 22, "Not optimal substructure")
        } else {
            XCTAssert(false)
        }

    }

}
