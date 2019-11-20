//
//  TreeTests.swift
//  Test
//
//  Created by Manish Kumar on 19/11/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class TreeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}


//MARK:- Traversals
extension TreeTests {
    func testBSTInorder() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 30)
        bst.addChild(elem: 20)
        bst.addChild(elem: 40)
        bst.addChild(elem: 70)
        bst.addChild(elem: 60)
        bst.addChild(elem: 80)

        let result = bst.inorder()
        XCTAssert(result == [20, 30, 40, 50, 60, 70, 80], "This is not inorder traversal of BST")
    }


    func testSkewedBSTInorder() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 70)
        bst.addChild(elem: 80)
        bst.addChild(elem: 90)

        let result = bst.inorder()
        XCTAssert(result == [50,70,80,90], "This is not inorder traversal of BST")
    }

    func testBSTPreOrder() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 30)
        bst.addChild(elem: 20)
        bst.addChild(elem: 40)
        bst.addChild(elem: 70)
        bst.addChild(elem: 60)
        bst.addChild(elem: 80)

        let result = bst.preorder()
        XCTAssert(result == [50, 30, 20, 40, 70, 60, 80], "This is not preorder traversal of BST")
    }

    func testSkewedBSTPreOrder() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 70)
        bst.addChild(elem: 80)
        bst.addChild(elem: 90)

        let result = bst.preorder()
        XCTAssert(result == [50,70,80,90], "This is not preorder traversal of skewed tree")
    }

    func testBSTPostOrder() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 30)
        bst.addChild(elem: 20)
        bst.addChild(elem: 40)
        bst.addChild(elem: 70)
        bst.addChild(elem: 60)
        bst.addChild(elem: 80)

        let result = bst.postOrder()
        XCTAssert(result == [20, 40, 30, 60, 80, 70, 50], "This is not postorder traversal of BST")
    }

    func testSkewedBSTPostOrder() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 70)
        bst.addChild(elem: 80)
        bst.addChild(elem: 90)

        let result = bst.postOrder()
        XCTAssert(result == [90,80,70,50], "This is not postorder traversal of skewed tree")
    }
}


//MARK:- Properties
extension TreeTests {
    func testEmptyBSTHeight() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        let result = bst.height()

        XCTAssert(result == 0, "An emptry tree shoulde have height Zero. = \(result)")
    }

    func testBSTHeight() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 30)
        bst.addChild(elem: 20)
        bst.addChild(elem: 40)
        bst.addChild(elem: 70)
        bst.addChild(elem: 60)
        bst.addChild(elem: 80)

        let result = bst.height()
        XCTAssert(result == 3, "Wrong Height. Calculated height is  = \(result)")
    }


    func testSkewedBSTHeight() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 70)
        bst.addChild(elem: 80)
        bst.addChild(elem: 90)

        let result = bst.height()
        XCTAssert(result == 4, "Wrong Height. Calculated height is  = \(result)")
    }

    func testEmptyBSTSize() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        let result = bst.size()

        XCTAssert(result == 0, "An emptry tree shoulde have size Zero. = \(result)")
    }


    func testBSTSize() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 30)
        bst.addChild(elem: 20)
        bst.addChild(elem: 40)
        bst.addChild(elem: 70)
        bst.addChild(elem: 60)
        bst.addChild(elem: 80)

        let result = bst.size()

        XCTAssert(result == 7, "Incorrect BST tree size = \(result)")
    }

    func testSkewedBSTSize() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 50)
        bst.addChild(elem: 70)
        bst.addChild(elem: 80)
        bst.addChild(elem: 90)

        let result = bst.size()

        XCTAssert(result == 4, "Incorrect Skewed BST tree size = \(result)")
    }
}