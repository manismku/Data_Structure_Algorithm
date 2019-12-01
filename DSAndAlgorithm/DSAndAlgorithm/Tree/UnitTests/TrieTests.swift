//
//  TrieTests.swift
//  Test
//
//  Created by Manish Kumar on 30/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class TrieTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testValidInsertAndSearchSuccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let aTrie = Tries()
        aTrie.insertInTrie(input: "a")
        aTrie.insertInTrie(input: "as")

        let result = aTrie.search(pattern: "as")

        XCTAssert(result == true, "as not found")

    }

    func testInsertAndSearchSuccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let aTrie = Tries()
        aTrie.insertInTrie(input: "Peter")
        aTrie.insertInTrie(input: "Piper")
        aTrie.insertInTrie(input: "Picked")
        aTrie.insertInTrie(input: "Peck")
        aTrie.insertInTrie(input: "Pickled")
        aTrie.insertInTrie(input: "Peppers")

        let result = aTrie.search(pattern: "Peppers")

        XCTAssert(result == true, "Peppers not found")

    }


    func testInsertAndSearchFailure() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let aTrie = Tries()
        aTrie.insertInTrie(input: "Peter")
        aTrie.insertInTrie(input: "Piper")
        aTrie.insertInTrie(input: "Picked")
        aTrie.insertInTrie(input: "Peck")
        aTrie.insertInTrie(input: "Pickled")
        aTrie.insertInTrie(input: "Peppers")

        let result = aTrie.search(pattern: "Pecker")

        XCTAssert(result == false, "Pecker is found")

    }


    func testAllStudents() {
        let aTrie = Tries()
        aTrie.insertInTrie(input: "all")
        aTrie.insertInTrie(input: "students")
        aTrie.insertInTrie(input: "assignment")
        aTrie.insertInTrie(input: "go")
        aTrie.insertInTrie(input: "to")
        aTrie.insertInTrie(input: "heaven")
        aTrie.insertInTrie(input: "and")
        aTrie.insertInTrie(input: "students")
        aTrie.insertInTrie(input: "not")
        aTrie.insertInTrie(input: "doing")
        aTrie.insertInTrie(input: "go")
        aTrie.insertInTrie(input: "to")
        aTrie.insertInTrie(input: "hell")

        let result = aTrie.search(pattern: "heavens")

        XCTAssert(result == true, "heaven not found")
    }



}
