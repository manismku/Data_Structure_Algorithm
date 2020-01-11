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

    func testRodCutting_1() {
        let rodCutting =  Rodcutting(data: (totalCapacity: 8, sizes: [1,2,3,4,5,6,7,8], values: [1, 5, 8, 9, 10, 17, 17, 20]))
        if let output = rodCutting.solveRodCutting() {
            XCTAssert(output.maxValue == 22, "Not optimal substructure")
        } else {
            XCTAssert(false)
        }

    }

    func testRodCutting_2() {
        let rodCutting =  Rodcutting(data: (totalCapacity: 10, sizes: [1,2,3,5], values: [1, 5, 8, 10]))
        if let output = rodCutting.solveRodCutting() {
            XCTAssert(output.maxValue == 26, "Not optimal substructure")
        } else {
            XCTAssert(false)
        }
    }

    func testLCS_1() {
        let lcs =  LCS(data: (s1: "GXTXAYB", s2: "AGGTAB"))
        let result = lcs.findLCS()
        XCTAssert(result.lentgh == 4, "Not optimal solution")
        XCTAssert(result.seqeunce == "GTAB", "Not optimal solution")
    }

    func testLCS_2() {
        let lcs =  LCS(data: (s1: "AGGTAB", s2: "GXTXAYB"))
        let result = lcs.findLCS()
        XCTAssert(result.lentgh == 4, "Not optimal solution")
        XCTAssert(result.seqeunce == "GTAB", "Not optimal solution")
    }

    func testLCS_3() {
        let lcs =  LCS(data: (s1: "ABC", s2: "DEF"))
        let result = lcs.findLCS()
        XCTAssert(result.lentgh == 0, "Not optimal solution")
        XCTAssert(result.seqeunce == "", "Not optimal solution")
    }

    func testMaxContSubSeq_1() {
        let maxSeq = MaxValueContSubsequence(data: [1, -3, 4, -2, -1, 6])
        let result = maxSeq.solve()
       print("result is = \(result)")
    }

    func testMaxContSubSeq_2() {
        let maxSeq = MaxSumWindowNotTwoContigous(data: [1, -3, 4, -2, -1, 6])
        let result = maxSeq.solve()
        XCTAssert(result.last! == 110, "Invalid result")
    }

    func testMaxContSubSeq_3() {
        let maxSeq = MaxSumWindowNotTwoContigous(data: [5, 5, 10, 100, 10, 5])
        let result = maxSeq.solve()
        XCTAssert(result.last! == 110, "Invalid result")
    }

}
