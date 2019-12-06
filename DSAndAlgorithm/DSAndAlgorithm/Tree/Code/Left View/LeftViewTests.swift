//
//  LeftViewTests.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 06/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class LeftViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLeftView() {

        let root = GenericTreeNode<Int>(value:1)
        root.left = GenericTreeNode<Int>(value:2);
        root.left!.left = GenericTreeNode<Int>(value:4);
        root.left!.right = GenericTreeNode<Int>(value:5);
        root.left!.right!.left = GenericTreeNode<Int>(value:7);
        root.left!.right!.right = GenericTreeNode<Int>(value:8);
        root.left!.right!.left!.left = GenericTreeNode<Int>(value:9);

        root.right = GenericTreeNode<Int>(value:3);
        root.right!.left = GenericTreeNode<Int>(value:6);
        root.right!.right = GenericTreeNode<Int>(value:7);

        let obj = LeftView(root)
        let result = obj.findLeftViewOfTree()

        XCTAssert(result == [1,2,4,7,9], "Not the left view of tree")

    }


}
