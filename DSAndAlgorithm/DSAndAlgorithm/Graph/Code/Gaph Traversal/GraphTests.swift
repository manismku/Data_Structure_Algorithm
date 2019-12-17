//
//  GraphTests.swift
//  Test
//
//  Created by Manish Kumar on 14/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import XCTest

class GraphTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGraphTotalEdges() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGraphTotalNodes() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    //MARK:- DFS Traversal
    func testDirectedGraphDFSTraversal() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let graph = AdjacencyListGraph()
        let zero = graph.createVertex(key: "0")
        let one = graph.createVertex(key: "1")
        let nine = graph.createVertex(key: "9")
        let eight = graph.createVertex(key: "8")
        let seven = graph.createVertex(key: "7")
        let three = graph.createVertex(key: "3")
        let ten = graph.createVertex(key: "10")
        let eleven = graph.createVertex(key: "11")
        let six = graph.createVertex(key: "6")
        let five = graph.createVertex(key: "5")
        let two = graph.createVertex(key: "2")
        let four = graph.createVertex(key: "4")


        zero.addEdge(neighbour: one)
        zero.addEdge(neighbour: two)

        one.addEdge(neighbour: two)

        two.addEdge(neighbour: zero)
        two.addEdge(neighbour: three)

        three.addEdge(neighbour: three)

        let result = graph.DFSTraversal(startNode: two)

        XCTAssert(result  == ["2", "0", "1", "3" ], "Not DFS = \(result)")

    }


    func testUnDirectedGraphDFSTraversal() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let graph = AdjacencyListGraph()
        let a = graph.createVertex(key: "A")
        let b = graph.createVertex(key: "B")
        let c = graph.createVertex(key: "C")
        let d = graph.createVertex(key: "D")
        let e = graph.createVertex(key: "E")
        let f = graph.createVertex(key: "F")

        let g = graph.createVertex(key: "G")


        a.addEdge(neighbour: b)
        a.addEdge(neighbour: c)

        b.addEdge(neighbour: a)
        b.addEdge(neighbour: d)
        b.addEdge(neighbour: e)

        c.addEdge(neighbour: a)
        c.addEdge(neighbour: e)


         d.addEdge(neighbour: e)
        d.addEdge(neighbour: b)
        d.addEdge(neighbour: f)

         e.addEdge(neighbour: d)
        e.addEdge(neighbour: b)
        e.addEdge(neighbour: c)
        e.addEdge(neighbour: f)


        f.addEdge(neighbour: d)
        f.addEdge(neighbour: e)


        let result = graph.DFSTraversal(startNode: a)

        XCTAssert(result  == ["A", "B", "D", "E", "C", "F" ], "Not DFS = \(result)")

    }


    func testUnDirectedGraphDFSTraversal_DisconnectedNodes() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let graph = AdjacencyListGraph()
        let a = graph.createVertex(key: "A")
        let b = graph.createVertex(key: "B")
        let c = graph.createVertex(key: "C")
        let d = graph.createVertex(key: "D")
        let e = graph.createVertex(key: "E")
        let f = graph.createVertex(key: "F")

        let g = graph.createVertex(key: "G")


        a.addEdge(neighbour: b)
        a.addEdge(neighbour: c)

        b.addEdge(neighbour: a)
        b.addEdge(neighbour: d)
        b.addEdge(neighbour: e)

        c.addEdge(neighbour: a)
        c.addEdge(neighbour: e)


        d.addEdge(neighbour: e)
        d.addEdge(neighbour: b)
        d.addEdge(neighbour: f)

        e.addEdge(neighbour: d)
        e.addEdge(neighbour: b)
        e.addEdge(neighbour: c)
        e.addEdge(neighbour: f)


        f.addEdge(neighbour: d)
        f.addEdge(neighbour: e)


        let result = graph.DFSTraversalUndirected()

        XCTAssert(result  == ["A", "B", "D", "E", "C", "F", "G" ], "Not DFS = \(result)")
    }



}

//MARK:- BFS Traversal

extension GraphTests {
    func testDirectedGraphBFSTraversal() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let graph = AdjacencyListGraph()
        let zero = graph.createVertex(key: "0")
        let one = graph.createVertex(key: "1")
        let nine = graph.createVertex(key: "9")
        let eight = graph.createVertex(key: "8")
        let seven = graph.createVertex(key: "7")
        let three = graph.createVertex(key: "3")
        let ten = graph.createVertex(key: "10")
        let eleven = graph.createVertex(key: "11")
        let six = graph.createVertex(key: "6")
        let five = graph.createVertex(key: "5")
        let two = graph.createVertex(key: "2")
        let four = graph.createVertex(key: "4")


        zero.addEdge(neighbour: one)
        zero.addEdge(neighbour: two)

        one.addEdge(neighbour: two)

        two.addEdge(neighbour: zero)
        two.addEdge(neighbour: three)

        three.addEdge(neighbour: three)

        let result = graph.BFSTraversal(startNode: two)

        XCTAssert(result  == ["2", "0", "3", "1" ], "Not BFS = \(result)")

    }

    func testUnDirectedGraphBFSTraversal() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let graph = AdjacencyListGraph()
        let a = graph.createVertex(key: "1")
        let b = graph.createVertex(key: "2")
        let c = graph.createVertex(key: "3")
        let d = graph.createVertex(key: "4")
        let e = graph.createVertex(key: "5")
        let f = graph.createVertex(key: "6")

        let g = graph.createVertex(key: "7")


        a.addEdge(neighbour: b)
        a.addEdge(neighbour: c)

        b.addEdge(neighbour: a)
        b.addEdge(neighbour: d)
        b.addEdge(neighbour: e)

        c.addEdge(neighbour: a)
        c.addEdge(neighbour: e)


        d.addEdge(neighbour: e)
        d.addEdge(neighbour: b)
        d.addEdge(neighbour: f)

        e.addEdge(neighbour: d)
        e.addEdge(neighbour: b)
        e.addEdge(neighbour: c)
        e.addEdge(neighbour: f)


        f.addEdge(neighbour: d)
        f.addEdge(neighbour: e)


        let result = graph.BFSTraversal(startNode: a)

        XCTAssert(result  == ["1", "2", "3", "4", "5", "6" ], "Not BFS = \(result)")

    }


    func testUnDirectedGraphBFSTraversal_DisconnectedNodes() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let graph = AdjacencyListGraph()
        let a = graph.createVertex(key: "1")
        let b = graph.createVertex(key: "2")
        let c = graph.createVertex(key: "3")
        let d = graph.createVertex(key: "4")
        let e = graph.createVertex(key: "5")
        let f = graph.createVertex(key: "6")

        let g = graph.createVertex(key: "7")


        a.addEdge(neighbour: b)
        a.addEdge(neighbour: c)

        b.addEdge(neighbour: a)
        b.addEdge(neighbour: d)
        b.addEdge(neighbour: e)

        c.addEdge(neighbour: a)
        c.addEdge(neighbour: e)


        d.addEdge(neighbour: e)
        d.addEdge(neighbour: b)
        d.addEdge(neighbour: f)

        e.addEdge(neighbour: d)
        e.addEdge(neighbour: b)
        e.addEdge(neighbour: c)
        e.addEdge(neighbour: f)


        f.addEdge(neighbour: d)
        f.addEdge(neighbour: e)


        let result = graph.BFSTraversalUndirected()

        XCTAssert(result  == ["1", "2", "3", "4", "5", "6", "7" ], "Not BFS = \(result)")
    }

}
