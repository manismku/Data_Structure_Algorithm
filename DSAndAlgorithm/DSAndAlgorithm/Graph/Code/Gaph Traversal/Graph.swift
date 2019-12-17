//
//  Graph.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 14/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


// represents a vertex
class Vertex {
    var value: String
    var isVisited: Bool
    var neighbours: Array<Edge> // incase of isolated component

    init(value: String) {
        self.value = value
        self.isVisited = false
        self.neighbours = []
    }

    func addEdge(neighbour: Vertex, weight: Int = 0) {
        let newEdge = Edge(src: self, dst: neighbour, weight: weight)
        self.neighbours.append(newEdge)
    }

     func markVisited() {
        self.isVisited = true
    }
}

// represents an edge
struct Edge {
    //src vertex
    var src: Vertex
    //dst
    var dst: Vertex
    //optional weight
    var weight: Int = 0
}


class AdjacencyListGraph {
    // adjacency list hold an array of
    private var adjcLists: [Vertex] = []
    private var output: [String] = []


    // create vertex
    func createVertex(key: String) -> Vertex {
        // node altready presetn
        if let existingVertex = self.adjcLists.filter({$0.value == key}).first {
            return existingVertex
        }

        let v = Vertex(value: key)
        self.adjcLists.append(v)

        return v
    }

    func DFSTraversal(startNode: Vertex) -> [String] {
        DFSTraversal(startNode)
        return self.output
    }

    func DFSTraversalUndirected() -> [String] {
        for v in self.adjcLists {
            DFSTraversal(v)
        }
        return self.output
    }

    private func DFSTraversal(_ vertex: Vertex)  {

    // we dont want to visit node which is already visited
    // thsi may come when we have one node falls in two adjacency list
     guard !vertex.isVisited else { return }

       vertex.markVisited()

      // Pre Order
       self.output.append(vertex.value)

        // get it all neighbours
        for neighbour in vertex.neighbours {
            _ = DFSTraversal(neighbour.dst)
        }
    }

    func BFSTraversal() -> [Vertex] {
        return []
    }

}
