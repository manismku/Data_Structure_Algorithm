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
    var value: Character
    var isVisited: Bool
    var neighbours: Array<Edge> // incase of isolated component

    init(value: Character) {
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
    private var output: [Character] = []
    // create vertex

    // create vertex
    func createVertex(key: Character) -> Vertex {
        // node altready presetn
        if let existingVertex = self.adjcLists.filter({$0.value == key}).first {
            return existingVertex
        }
        return Vertex(value: key)
    }

    func DFSTraversal() -> [Character] {
        return self.output
    }

    func DFSTraversal(_ vertex: Vertex)  {

    // we dont want to visit node which is already visited
    // thsi may come when we have one node falls in two adjacency list
     guard !vertex.isVisited else { return }

       vertex.markVisited()

        for neighbour in vertex.neighbours {
            // do Post Order DFS again
            _ = DFSTraversal(neighbour.dst)
        }
        // get it all neighbours
        self.output.append(vertex.value)

    }

    func BFSTraversal() -> [Vertex] {
        return []
    }
}
