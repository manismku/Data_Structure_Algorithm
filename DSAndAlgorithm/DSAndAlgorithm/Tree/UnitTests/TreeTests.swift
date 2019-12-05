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


//MARK:- Test BST Traversals
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


//MARK:- Test BST Properties
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

    func testRootToLeafForBST() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let bst = BinarySearchTree()
        bst.addChild(elem: 8)
        bst.addChild(elem: 3)
        bst.addChild(elem: 1)
        bst.addChild(elem: 6)
        bst.addChild(elem: 10)

        let result = bst.printRootToLeaf()

        XCTAssert(result == ["8 3 1", "8 3 6", "8 10"], "Incorrect Skewed BST tree size. Output = \(result)")
    }
}



//MARK:- Test Complete Binary Tree
extension TreeTests {

    func testCompleteBinaryTreeInteger() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5,6])
        let result = cbt.inorder()
        XCTAssert(result == [4,2,5,1,6,3], "Not CBT. Output = \(result)")
    }

    func testCompleteBinaryTreeFloat() {
        let cbt = CompleteBinaryTree<Float>()
        cbt.createCBT(of: [1.0,2.0,3.0,4.0,5.0])
        let result = cbt.inorder()
        XCTAssert(result == [4.0,2.0,5.0,1.0,3.0], "Not CBT. Output = \(result)")
    }

    func testCompleteBinaryTreeString() {
        let cbt = CompleteBinaryTree<String>()
        cbt.createCBT(of: ["1","2","3","4","5"])
        let result = cbt.inorder()

        XCTAssert(result == ["4","2","5","1","3"], "Not CBT as. Output = \(result)")

    }


}


//MARK:- Test Diameter of Binary Tre (CBT)
extension TreeTests {
    func testCompleteBinaryTreeDiameter() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5])
        let result = cbt.calculateDiameter()
        XCTAssert(result == 4, "Diameter should be 4. Output =  \(result)")
    }
}

//MARK:- Test Clone of Binary Tre (CBT)
extension TreeTests {
    func testCompleteBinaryClone() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5,6])
        let result = cbt.inorderClonedTree()
        XCTAssert(result == [3,6,1,5,2,4], "Not cloned tree. Output = \(result)")
    }
}

//MARK:- Level max Sum Binary Tre (CBT)
extension TreeTests {
    func testCompleteBinaryLevelSum() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5,8,6,7])
        let result = cbt.levelWithMaxSum(cbt.root)
        XCTAssert(result == 23, "Maximum level sum should be 23. Output = \(result)")
    }

    func testCompleteBinaryLevelSumWithNegative() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [4,2,-5,-1,3,-2,6])
        let result = cbt.levelWithMaxSum(cbt.root)
        XCTAssert(result == 6, "Maximum level sum should be 6. Output = \(result)")
    }

    func testCompleteBinaryLevelSumOneNode() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [4])
        let result = cbt.levelWithMaxSum(cbt.root)
        XCTAssert(result == 4, "Maximum level sum should be 4. Output = \(result)")
    }
}



//MARK:- Search particular node
extension TreeTests {
    func testNodeSearch() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5,6])
        let result = cbt.searchNode(elem: 7)
        XCTAssert(result == false, "Unable to find. Output = \(result)")
    }

    func testNodeSearchStrng() {
        let cbt = CompleteBinaryTree<String>()
        cbt.createCBT(of: ["1","2"])
        let result = cbt.searchNode(elem: "1")
        XCTAssert(result == true, "Unable to find. Output = \(result)")
    }


    func testLCANode() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
        let result = cbt.findLCA(firstVal: 9, secondVal: 11)
        XCTAssert(result == 2, "Not the LCA node. Output = \(String(describing: result))")
    }

}


//MARK:- Iterative and Last Node
extension TreeTests {
    func testTraversalIterativeTes() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [4,3,6,5,7])
        let result = cbt.inorderIterative()
        XCTAssert(result == [5,3,7,4,6], "Not inorder traversal. Output = \(String(describing: result))")
    }


    func testCBTlastNode() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [4,3,6,5,7])
        if let result = cbt.findLastNodeInCBT() {
            XCTAssert(result.value == 7, "Not the last node. Output = \(String(describing: result))")
            return
        }
        XCTAssert(false, "Found nil value. Output")
    }

    func testInorderlastNode() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [4,3,6,5,7])
        let result = cbt.findInorderOLastNode()
        XCTAssert(result == 6, "Not inorder traversal. Output = \(String(describing: result))")
    }

    func testEmptyInorderlastNode() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [])
        let result = cbt.findInorderOLastNode()
        XCTAssert(result == nil, "Not inorder traversal. Output = \(String(describing: result))")
    }

    func testInroderSuccessor() {
        let cbt = CompleteBinaryTree<Int>()
        cbt.createCBT(of: [1,2,3,4,5,6])
        let result = cbt.findInorderSuccessor(for: 3)
        XCTAssert(result == 6, "Not inorder successor. Output = \(String(describing: result))")
    }
}
